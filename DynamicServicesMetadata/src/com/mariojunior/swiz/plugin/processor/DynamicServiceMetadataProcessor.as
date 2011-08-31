package com.mariojunior.swiz.plugin.processor
{
	import com.mariojunior.swiz.plugin.interceptor.ServiceMethodInterceptor;
	import com.mariojunior.swiz.plugin.metadata.DynamicServiceMetadataTag;
	import com.mariojunior.swiz.plugin.setup.DynamicServiceSetup;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.getClassByAlias;
	import flash.utils.Dictionary;
	
	import mx.core.FlexGlobals;
	
	import org.as3commons.bytecode.proxy.IClassProxyInfo;
	import org.as3commons.bytecode.proxy.IProxyFactory;
	import org.as3commons.bytecode.proxy.impl.ProxyFactory;
	import org.as3commons.bytecode.reflect.ByteCodeType;
	import org.swizframework.core.Bean;
	import org.swizframework.core.BeanProvider;
	import org.swizframework.core.ISwiz;
	import org.swizframework.core.ISwizAware;
	import org.swizframework.processors.BaseMetadataProcessor;
	import org.swizframework.reflection.IMetadataTag;
	import org.swizframework.reflection.MetadataArg;
	
	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class DynamicServiceMetadataProcessor extends BaseMetadataProcessor
	{
		
		private var _proxyFactory : IProxyFactory;
		private var _setup : DynamicServiceSetup;
		private var _swiz : ISwiz;
		
		private var _delegatesQueue : Dictionary = new Dictionary(false);
		
		
		
		[Bindable("setupChanged")]
		public function get setup():DynamicServiceSetup
		{
			return _setup;
		}

		public function set setup(value:DynamicServiceSetup):void
		{
			_setup = value;
			dispatchEvent(new Event("setupChanged"));
		}
				
		
		/**
		 * Constructor
		 * 
		 */		
		public function DynamicServiceMetadataProcessor()
		{
			super(["DynamicService"], DynamicServiceMetadataTag);
			
		}
		
		/**
		 * 
		 * @param swiz
		 * Initiates the Metadata Processor, and starts the as3Commons ByteCode API. 
		 * 
		 */		
		override public function init(swiz:ISwiz):void {
			super.init(swiz);
			
			ByteCodeType.fromLoader(FlexGlobals.topLevelApplication.automationOwner.loaderInfo);
			_proxyFactory = new ProxyFactory();
		}
		
		
		/**
		 * 
		 * @param metadataTag
		 * @param bean
		 * 
		 */		
		override public function setUpMetadataTag(metadataTag:IMetadataTag, bean:Bean):void
		{
			var destArg : MetadataArg = metadataTag.getArg(DynamicServiceMetadataTag.DESTINATION_ATTR_NAME);
			var typeArg : MetadataArg = metadataTag.getArg(DynamicServiceMetadataTag.TYPE_ATTR_NAME);
			
			
			var proxyInfo:IClassProxyInfo = _proxyFactory.defineProxy(metadataTag.host.type);
			
			_proxyFactory.addEventListener(Event.COMPLETE, proxyFactoryCompleteHandler(metadataTag,bean));
			_proxyFactory.addEventListener(IOErrorEvent.IO_ERROR, proxyFactoryIOErrorHandler(metadataTag,bean));
			
			
			if (!setup.map.hasKey(destArg.value))
			{
				setup.addOrReplaceServiceToMap(destArg.value,null);

				//interceptar os metodos chamados nela, passando o tipo de servico e destination
				proxyInfo.interceptorFactory = new ServiceMethodInterceptor(destArg.value,((typeArg) ? typeArg.value:null));
				_proxyFactory.generateProxyClasses();
				_proxyFactory.loadProxyClasses();
			} else {
				trace("The service \"" + destArg.value + "\" already exists."); 
			}
			
		}
		
		/**
		 * 
		 * @param metadataTag
		 * @param bean
		 * 
		 * @return 
		 * 
		 */		
		protected function proxyFactoryCompleteHandler(metadataTag:IMetadataTag, bean:Bean):Function
		{
			return function(event:Event):void
			{
				var proxy:* = _proxyFactory.createProxy(metadataTag.host.type);
				var destinationService:String = metadataTag.getArg(DynamicServiceMetadataTag.DESTINATION_ATTR_NAME).value;
				setup.addOrReplaceServiceToMap(destinationService, proxy);
				bean.source[metadataTag.host.name] = proxy;
				trace("The Service \"" + destinationService + "\" has been injected at \"" + bean.name + "\" variable.");
			}
		}
		
		/**
		 * 
		 * @param metadataTag
		 * @param bean
		 * @return 
		 * 
		 */		
		protected function proxyFactoryIOErrorHandler(metadataTag:IMetadataTag, bean:Bean):Function
		{
			return function(event:IOErrorEvent):void
			{
				var destinationService:String = metadataTag.getArg(DynamicServiceMetadataTag.DESTINATION_ATTR_NAME).value;
				var errorMsg : String = "Error creating a \'" + 
										destinationService + 
										"\' Service concrete class at Bean \'" + 
										bean.name + "\n\n" + 
										"Detail: " + event.text;
				trace(errorMsg);
				throw new Error(errorMsg);
			}
		}
		
	}
}