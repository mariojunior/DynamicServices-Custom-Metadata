package com.mariojunior.swiz.plugin.factory
{
	import mx.rpc.remoting.mxml.RemoteObject;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class RemoteObjectFactory
	{
		
		
		/**
		 * Single factory, just creates a MXML RemoteObject and return it
		 * 
		 * @param destination
		 * @param endpoint
		 * @return 
		 * 
		 */		
		public static function build(destination:String, endpoint:String=null):RemoteObject
		{
			var ro : RemoteObject = new RemoteObject(destination);

			if (null != endpoint)
			{
				ro.endpoint = endpoint; //I really need to set a endpoint? I believe that not.
			}
			
			return ro; 
		}
		
	}
}