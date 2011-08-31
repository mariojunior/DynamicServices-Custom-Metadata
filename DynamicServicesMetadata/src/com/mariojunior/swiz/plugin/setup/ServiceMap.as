package com.mariojunior.swiz.plugin.setup
{
	import flash.utils.Dictionary;
	
	/**
	 * A very very basic 'HashMap' implementation to store my services concrete impls.
	 * 
	 * @author mariojunior
	 * 
	 */	
	public dynamic class ServiceMap extends Dictionary
	{
		
		/**
		 * default constructor
		 *  
		 * @param weakKeys
		 * 
		 */		
		public function ServiceMap(weakKeys:Boolean=false)
		{
			super(weakKeys);
		}
		
		/**
		 * 
		 * @param key
		 * @param value
		 * 
		 */		
		public function put(key:String, value:Object):void
		{
			this[key] = value;
		}
		
		/**
		 * 
		 * @param key
		 * @return 
		 * 
		 */		
		public function getValue(key:String):Object
		{
			if (this.hasOwnProperty(key))
			{
				return this[key];
			}
			
			return null;
		}
		
		/**
		 * 
		 * @param key
		 * @return 
		 * 
		 */		
		public function hasKey(key:String):Boolean
		{
			for (var keyIn:String in this)
			{
				if (keyIn == key) 
				{
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * 
		 * @param value
		 * @return 
		 * 
		 */		
		public function getKey(value:Object):String
		{
			for (var key:String in this)
			{
				if (this[key] === value) 
				{
					return key;
				}
			}
			
			return null;
		}
		
		/**
		 * 
		 * @param key
		 * 
		 */		
		public function deleteValue(key:String):void
		{
			delete this[key];
		}
		
	}
}