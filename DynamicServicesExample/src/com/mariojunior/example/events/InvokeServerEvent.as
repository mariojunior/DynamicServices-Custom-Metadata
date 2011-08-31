package com.mariojunior.example.events
{
	import flash.events.Event;
	
	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class InvokeServerEvent extends Event
	{
		public static const INVOKE_REMOTE_OBJECT : String = "invokeRemoteObjectEvent";
		public static const INVOKE_WEB_SERVICE	 : String = "invokeWebServiceEvent";
		public static const INVOKE_HTTP_SERVICE	 : String = "invokeHttpServiceEvent";
		public static const INVOKE_MOCK_OBJECT	 : String = "invokeMockObjectEvent";
		
		
		public static const NOTIFY_VIEW	: String = "notifyViewEvent";
		
		
		
		public var dataToSend:Object;
		public var dataToView:Object;
		
		
		/**
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function InvokeServerEvent(type:String, dataToSend:Object)
		{
			this.dataToSend = dataToSend;
			super(type, false, false);
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		override public function clone():Event
		{
			return new InvokeServerEvent(type, this.dataToSend); 
		}
		
	}
}