package com.mariojunior.example.delegates
{
	import mx.rpc.AsyncToken;

	/**
	 * This interface defines a back-end service contract.
	 * 
	 * @author mariojunior
	 * 
	 */	
	public interface IPessoaService
	{
		function getPerson(id:int):AsyncToken;
		
		function listPersons():AsyncToken;
		
		//p would be a Person concrete class, no problem for that :)
		function savePerson(p:Object):AsyncToken;
		
		//...and all other methods about PersonService context.
		//Generally, this interface could be a 'copy' of your services back-end classes
		
	}
}