package model.proxy
{
	import config.GeneralNotification;
	
	import model.dto.GamesConfigDO;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class GamesConfigProxy extends Proxy
	{ 
		public static const NAME:String = "GamesConfigProxy";
		private var _gamesConfigDO:GamesConfigDO;
		private var _gamesConfigDO_array:Array= [];
		
		
		public function GamesConfigProxy(gamesConfig:XML)
		{ 
			super(NAME);
			_gamesConfigDO=new GamesConfigDO;
			parseGamesConfigXML(gamesConfig);
		}
		public function parseGamesConfigXML(gamesConfig:XML):void{ // получаем на  вход ХМЛ
			//var _gamesConfigDO_array:Array=[];
			for (var i:int = 0; i<gamesConfig.*.length(); i++){
				var gameConfigDO:GamesConfigDO= new GamesConfigDO; // создаем экземпляр класса в самом классе
				gameConfigDO.level_number=gamesConfig.game[i].@NUMBER; // обращаемся к переменной _level_number и присв ей знач NUMBER(записанное в ХМЛ)
				for (var j:int=0; j<gamesConfig.game[i].*.length(); j++){ //для каждого экземпляра "game[i]" (лэвэла)...
					switch ( gamesConfig.game[i].property[j].@NAME.toString()){ // проверяем "property[j].@NAME" - значение имени каждого в стринг. форме
						case "art_path":
							gameConfigDO.art_path=gamesConfig.game[i].property[j].@VALUE.toString();// если имя "art_path" - то присв 
							break;													//gameConfigDO._art_path значение VALUE в стрынг форме
						case "time_of_enemie_generate" :
							gameConfigDO.time_of_enemie_generate=gamesConfig.game[i].property[j].@VALUE;
							break;
						case "type_of_enemie":
							gameConfigDO.type_of_enemie=gamesConfig.game[i].property[j].@VALUE;
							break;
						case "level_time":
							gameConfigDO.level_time=gamesConfig.game[i].property[j].@VALUE;
							break;
						case "scores_to_next_level":
							gameConfigDO.scores_to_next_level=gamesConfig.game[i].property[j].@VALUE;
							break;
						case "level_time":
							gameConfigDO.level_time=gamesConfig.game[i].property[j].@VALUE;
							break;
						
					}
				}
				_gamesConfigDO_array.push(gameConfigDO); // в итоге у нас есть масив ДТОшек
			}
				
				
			
			
			//retursn _gamesConfigDO_array;
		}	
		public function get gamesConfigData():Array{
			return _gamesConfigDO_array as Array;
		}
	}
}
