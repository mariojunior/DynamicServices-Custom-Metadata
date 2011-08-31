package com.mariojunior.swiz.plugin.metadata
{
	import org.swizframework.reflection.BaseMetadataTag;
	import org.swizframework.reflection.IMetadataTag;
	
	/**
	 * 
	 * @author mariojunior
	 * 
	 * Class that defines the metadata arguments: <br/>
	 * [DynamicService(destination=..., type=...)]
	 * 
	 */	
	public class DynamicServiceMetadataTag extends BaseMetadataTag
	{
		public static const DESTINATION_ATTR_NAME : String = "destination";
		public static const TYPE_ATTR_NAME : String = "type";
		
		
		public static const REMOTE_OBJECT : String = "remoteObject";
		public static const HTTP_SERVICE  : String = "httpService";
		public static const WEBSERVICE	  : String = "webService";
		public static const MOCK		  : String = "mock";
		
		
		private var _destination : String;
		private var _type : String = REMOTE_OBJECT;
		

		/**
		 * Constructor 
		 * 
		 */		
		public function DynamicServiceMetadataTag()
		{
			super();
			defaultArgName = "destination";
		}
		
		
		/**
		 * <p>The "destination" back-end data source.<br/>
		 * This argument depends of value from "type" argument.<br/>
		 * <b>Important Note:</b>If no type is defined, then the default behavior assumes that 'type'
		 * is a <b>RemoteObject</b> and you just need specify the remoteClass destination of your
		 * back-end, defined in your remoting-config.xml.</p>
		 * 
		 * See the table below to define the correct value:<br/>
		 * 
		 * <table>
		 * 	<tr>
		 * 		<td><b>type</></td>
		 * 		<td><b>Instruction</></td>
		 * 	</tr>
		 * 	<tr>
		 * 		<td><b>remoteObject</></td>
		 * 		<td><b>Just specify your remoteClass destination name.</></td>
		 * 	</tr>
		 * 	<tr>
		 * 		<td><b>httpService</></td>
		 * 		<td><b>You need specify an url to post/get your data.</></td>
		 * 	</tr>
		 * 	<tr>
		 * 		<td><b>webService</></td>
		 * 		<td><b>You need specify an Operation name, defined in your WSDL.</></td>
		 * 	</tr>
		 * 	<tr>
		 * 		<td><b>mock</></td>
		 * 		<td><b>You need specify a bean name of your Mock implementation, defined in your Beans.</></td>
		 * 	</tr>
		 * </table>
		 * 
		 * This argument is required.
		 * 
		 * @return 
		 * 
		 */
		public function get destination():String
		{
			return _destination;
		}

		/**
		 *  
		 * @param value
		 * 
		 */		
		public function set destination(value:String):void
		{
			_destination = value;
		}

		
		
		public function get type():String
		{
			return _type;
		}

		/**
		 * 
		 * @param value
		 * 
		 */		
		public function set type(value:String):void
		{
			_type = value;
		}
		
		
		override public function copyFrom(metadataTag:IMetadataTag):void
		{
			super.copyFrom(metadataTag);
			
//			if (hasArg("type"))
//			{
//				this._type = getArg("type").value;
//			}
			
			if (hasArg("destination"))
			{
				this._destination = getArg("destination").value;
			}
			
		}

	}
}