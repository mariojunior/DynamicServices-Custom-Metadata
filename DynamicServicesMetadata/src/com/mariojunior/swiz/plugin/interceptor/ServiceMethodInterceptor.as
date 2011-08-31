package com.mariojunior.swiz.plugin.interceptor
{
	import org.as3commons.bytecode.interception.IMethodInvocationInterceptorFactory;
	
	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class ServiceMethodInterceptor implements IMethodInvocationInterceptorFactory
	{
		
		private var _serviceType		 : String;
		private var _serviceDestination  : String;
		
		/**
		 * Constructor
		 *  
		 * @param serviceDestination
		 * @param serviceType
		 * 
		 */		
		public function ServiceMethodInterceptor(serviceDestination:String, serviceType:String=null)
		{
			this._serviceDestination = serviceDestination;
			this._serviceType = serviceType;
		}
		
		/**
		 * This method is used by framework, to retrive a instance of 
		 * the object that will intercept all functions call.
		 *  
		 * @return 
		 * 
		 */		
		public function newInstance():*
		{
			return new InternalMethodInterceptor(_serviceDestination, _serviceType);
		}
	}
}


import mx.rpc.AsyncToken;

import org.as3commons.bytecode.interception.IMethodInvocationInterceptor;
import org.as3commons.bytecode.interception.impl.InvocationKind;



/**
 * 
 * @author mariojunior
 * 
 */
class InternalMethodInterceptor implements IMethodInvocationInterceptor
{
	private var _serviceType		 : String;
	private var _serviceDestination  : String;
	
	
	public function InternalMethodInterceptor(serviceDestination:String, serviceType:String=null)
	{
		this._serviceDestination = serviceDestination;
		this._serviceType = serviceType;
	}
	
	public function intercept(targetInstance:Object, kind:InvocationKind, member:QName, arguments:Array=null, method:Function=null):*
	{
		if (kind == InvocationKind.METHOD)
		{
			trace("################################################################")
			trace("METHOD INTERCEPTOR INVOKED: \n" +
				  "destination: " + _serviceDestination + "\n" +
				  "type: " + _serviceType);
			trace("################################################################")
			
			return new AsyncToken(null);
		}
	}
}