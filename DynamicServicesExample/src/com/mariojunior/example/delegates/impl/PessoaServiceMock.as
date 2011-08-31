package com.mariojunior.example.delegates.impl
{
	import com.mariojunior.example.delegates.IPessoaService;
	
	import mx.rpc.AsyncToken;
	
	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class PessoaServiceMock implements IPessoaService
	{
		
		public function getPerson(id:int):AsyncToken
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function listPersons():AsyncToken
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function savePerson(p:Object):AsyncToken
		{
			// TODO Auto Generated method stub
			return null;
		}
		
	}
}