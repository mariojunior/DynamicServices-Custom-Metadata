package com.mariojunior.swiz.plugin.factory
{
	import mx.rpc.http.mxml.HTTPService;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class HttpServiceFactory
	{
		
		
		/**
		 * Single factory, just creates a MXML HTTPService and return it
		 * 
		 * @param destination
		 * @return 
		 * 
		 */		
		public static function build(destination:String):HTTPService
		{
			var hs : HTTPService = new HTTPService(destination);
			return hs;
		}
		
		
	}
}