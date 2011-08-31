package com.mariojunior.example.controllers
{
	import com.mariojunior.example.delegates.IPessoaService;

	/**
	 * 
	 * @author mariojunior
	 * 
	 */	
	public class AnotherExampleController
	{
		
		private var _anotherServiceExample : IPessoaService;
		
		[DynamicService(destination="PessoaService")]
		public function set anotherServiceExample(value:IPessoaService):void
		{
			_anotherServiceExample = value;
		}

	}
}