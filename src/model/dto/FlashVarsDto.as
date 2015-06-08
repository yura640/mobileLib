package model.dto
{
	public class FlashVarsDto
	{
		public function FlashVarsDto()
		{
		}
		public function get assetsPath():String{	
			return "res/";
		}
		public function get mainConfigPath():String{
			return "res/xml/MainConfig.xml";
		}
	}
}