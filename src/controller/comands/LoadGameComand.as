package controller.comands
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import model.dto.FlashVarsDto;
	import model.proxy.FlashVariantsProxy;
	import model.proxy.GameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import utils.WareHouse;
	
	public class LoadGameComand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
			var zapros:URLRequest = new URLRequest("res/Crot.swf");
			loader.load(zapros);
		}
		
		protected function onLoad(event:Event):void
		{
			var loaderInfo:LoaderInfo = event.target as LoaderInfo; 
			loaderInfo.removeEventListener(Event.COMPLETE, onLoad)
			WareHouse.getInstance().setData(loaderInfo);
			var flashVarsDto:FlashVarsDto=new FlashVarsDto(); // pyti загрузки
			facade.registerProxy(new FlashVariantsProxy(flashVarsDto));
			
		}
	}
}