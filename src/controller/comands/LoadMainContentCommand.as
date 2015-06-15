package controller.comands
{
	import br.com.stimuli.loading.BulkLoader;
	
	import config.GeneralNotification;
	
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	
	import model.proxy.GamesConfigProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import utils.WareHouse;
	
	public class LoadMainContentCommand extends SimpleCommand
	{
		private var _loader:BulkLoader;
		private var _gamesXmlLoader:BulkLoader;
		private var _assetsPath:String;
		private var _mainConfigXML:XML;
		
		override public function execute(notification:INotification):void
		{
			_loader = new BulkLoader;
			_gamesXmlLoader = new BulkLoader;
			_assetsPath=notification.getBody() as String;
			var _mainConfigPath:String=notification.getType();
			_loader.add(_mainConfigPath, {id:"mainConfig"}); // _mainConfigPath - путь загрузки, {id:"mainConfig"} - идентификатор
			
			_loader.addEventListener(BulkLoader.COMPLETE, onMainConfigLoaded);
			_loader.addEventListener(BulkLoader.ERROR, onError);
			
			_loader.start();
		}
		public function onMainConfigLoaded(event:Event):void{
			_loader.removeEventListener(BulkLoader.COMPLETE, onMainConfigLoaded);
			_mainConfigXML=_loader.getContent("mainConfig") as XML; // содержимое id:"mainConfig" присваеваем _mainConfigXML
			for (var i:int=0; i<_mainConfigXML.conf.length(); i++){ // проходя по каждому полю _mainConfigXML...
				var asset_type:String=_mainConfigXML.conf[i].@TYPE;// тип каждого поля приваеваем переменной asset_type
				var asset_title:String=_mainConfigXML.conf[i].@TITLE;// тайтл каждого поля присваеваем переменной asset_title
				_loader.add(_assetsPath+_mainConfigXML.conf[i].@URL, {id:asset_title}); // загр res/URL каждого поля и метка asset_title = TITLE
			
			}
			_loader.addEventListener(BulkLoader.COMPLETE, onLoaderParseComplete);
			_loader.addEventListener(BulkLoader.ERROR, onError);
		}
		public function onLoaderParseComplete(event:Event):void{
			_loader.removeEventListener(BulkLoader.COMPLETE, onLoaderParseComplete);
			for (var i:int=0; i<_mainConfigXML.conf.length();i++){ // проходя по каждому элементу _mainConfigXML...
				var asset_type:String=_mainConfigXML.conf[i].@TYPE;// тип каждого поля приваеваем переменной asset_type
				var asset_title:String=_mainConfigXML.conf[i].@TITLE; // тайтл каждого поля присваеваем переменной asset_title
				switch (asset_type){ // проверяем тайп
					case "SWF":
						WareHouse.getInstance().setData(_loader.getContent(asset_title));// если мувик то ложим в варехауз
						break;
					case "Sounds":
						WareHouse.getInstance().setData(_loader.getContent(asset_title));// если саунд то ложем в варехауз
						break;
					case "XML":
						facade.registerProxy(new GamesConfigProxy(_loader.getContent(asset_title))); // если Хмл - создаемпрокси и на вход содержимое
						
						break;
				}
			}
			sendNotification(GeneralNotification.MAIN_CONTENT_LOADED);
			sendNotification(GeneralNotification.GAME_IS_LOADED);
		}
		
		public function onError(event:Event):void{
			_loader.removeEventListener(BulkLoader.ERROR, onError);
			var text_field:TextField=new TextField;
			text_field.text="error in loading files...";
			//sendNotification(GeneralNotification.ADD_CHILD_TO_ROOT, text_field);
		}
	}
}
