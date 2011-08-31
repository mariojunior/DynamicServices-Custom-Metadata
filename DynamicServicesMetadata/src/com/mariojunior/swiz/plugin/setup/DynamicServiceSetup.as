package com.mariojunior.swiz.plugin.setup
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import org.as3commons.logging.setup.target.TRACE_TARGET;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	[Bindable]
	public class DynamicServiceSetup extends EventDispatcher
	{
		
		private var _map : ServiceMap = new ServiceMap();
		
		private var _endPoint : String;
		private var _wsdlEndPoint : String;
		

		[Binable("endPointChanged")]
		public function get endPoint():String
		{
			return _endPoint;
		}
		
		public function set endPoint(value:String):void
		{
			_endPoint = value;
			dispatchEvent(new Event("endPointChanged"));
		}

		[Binable("wsdlEndPointChanged")]
		public function get wsdlEndPoint():String
		{
			return _wsdlEndPoint;
		}
		
		public function set wsdlEndPoint(value:String):void
		{
			_wsdlEndPoint = value;
			dispatchEvent(new Event("wsdlEndPointChanged"));
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public function get map():ServiceMap
		{
			return this._map;
		}
		
		/**
		 * 
		 * @param key
		 * @param value
		 * 
		 */		
		public function addOrReplaceServiceToMap(key:String, value:Object):void
		{
			map.put(key,value);
			trace("---- Service mapped. The Key is \""+ key + "\" and it has " + ((value==null) ? "NO " : "") + " value.");
		}

	}
}