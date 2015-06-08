package model.proxy
{
	import config.GeneralNotification;
	
	import model.dto.FlashVarsDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;

	
	public class FlashVariantsProxy extends Proxy{
		
		static public const NAME:String="FlashVariantsProxy";
		
		public function FlashVariantsProxy(flashVars:FlashVarsDto){
			super(NAME, flashVars); //  шо за ьнах?
			sendNotification(GeneralNotification.LOAD_MAIN_RESOURSES, flashVars.assetsPath, flashVars.mainConfigPath);
		}
	}
}