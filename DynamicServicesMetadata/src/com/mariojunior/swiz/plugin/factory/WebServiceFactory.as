package com.mariojunior.swiz.plugin.factory
{
	import mx.rpc.soap.mxml.WebService;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class WebServiceFactory
	{
		
		
		/**
		 * Single factory, just creates a MXML WebService and return it
		 * 
		 * @param destination
		 * @param endpoint
		 * @return 
		 * 
		 */		
		public static function build(destination:String, endpoint:String):WebService
		{
			var ws : WebService = new WebService(endpoint);
			ws.operations = [destination];
			
			return ws; 
		}
		
	}
}