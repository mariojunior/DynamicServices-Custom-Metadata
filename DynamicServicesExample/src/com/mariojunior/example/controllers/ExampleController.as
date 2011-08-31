package com.mariojunior.example.controllers
{
	import com.mariojunior.example.delegates.IPessoaService;
	import com.mariojunior.example.events.InvokeServerEvent;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.InvokeEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.as3commons.logging.setup.target.TRACE_TARGET;
	import org.swizframework.utils.services.ServiceHelper;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class ExampleController extends BaseController
	{
		
		private var _service : IPessoaService;
		
//		[DynamicService(destination="getPerson", type="webService")]
		public var _webService : IPessoaService;
		
//		[DynamicService(destination="http://www.google.com", type="httpRequest")]
		public var _httpRequest : IPessoaService;
		
//		[DynamicService(destination="exampleDelegateMock", type="mock")]
		public var _mock : IPessoaService;
		
		
		
		[DynamicService(destination="PessoaService")]
		public function set service(value:IPessoaService):void
		{
			_service = value;
		}

		[EventHandler(event="InvokeServerEvent.INVOKE_REMOTE_OBJECT", properties="dataToSend")]
		public function invokeRemoteObject(data:Object):void
		{
			serviceHelper.executeServiceCall(_service.getPerson(data.toString()), invokeSuccess, defaultFaultHandler);
		}
		
		[EventHandler(event="InvokeServerEvent.INVOKE_WEB_SERVICE", properties="dataToSend")]
		public function invokeWebService(data:Object):void
		{
			trace('InvokeServerEvent.INVOKE_WEB_SERVICE invoked');
		}
		
		[EventHandler(event="InvokeServerEvent.INVOKE_HTTP_SERVICE")]
		public function invokeHttpService(event:InvokeServerEvent):void
		{
			trace('InvokeServerEvent.INVOKE_HTTP_SERVICE invoked');
		}
		
		[EventHandler(event="InvokeServerEvent.INVOKE_MOCK_OBJECT", properties="dataToSend")]
		public function invokeMockObject(data:Object):void
		{
			trace('InvokeServerEvent.INVOKE_MOCK_OBJECT invoked');
		}
		
		
		
		private function invokeSuccess(e:ResultEvent):void
		{
			trace("request well succeded");
			
			//notify the view sending the result object from server.
			var evt : InvokeServerEvent = new InvokeServerEvent(InvokeServerEvent.NOTIFY_VIEW,e.result);
			swizDispatcher.dispatchEvent(evt);
		}
		
		
	}
}