package com.mariojunior.example.controllers
{
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	import mx.utils.ObjectUtil;
	
	import org.swizframework.utils.services.ServiceHelper;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class BaseController
	{
		
		[Dispatcher]
		public var swizDispatcher : IEventDispatcher;
		
		[Inject]
		public var serviceHelper : ServiceHelper;
		
		
		
		protected function defaultFaultHandler(e:FaultEvent):void
		{
			trace(ObjectUtil.toString(e));
		}
		
		
		
	}
}