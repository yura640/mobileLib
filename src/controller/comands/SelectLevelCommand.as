package controller.comands
{
	import config.GeneralNotification;
	
	import model.dto.GamesConfigDO;
	import model.proxy.GamesConfigProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class SelectLevelCommand extends SimpleCommand
	{
		
		//public var arrayLevelDto:Array;
		override public function execute(notification:INotification):void
		{
			var LevelNumber:int = notification.getBody() as int;
			//arrayLevelDto = (facade.retrieveProxy(GamesConfigProxy.NAME) as GamesConfigProxy).gamesConfigData;
			chozeTheLevel(LevelNumber);
		}
		public function get arrayLevelDto():Array{
			return (facade.retrieveProxy(GamesConfigProxy.NAME) as GamesConfigProxy).gamesConfigData as Array;
		}
		public function chozeTheLevel(incimingIndex:int):void // в пркси
		{
			for (var i:int=0; i < arrayLevelDto.length; i++){
				var oneDto:GamesConfigDO = arrayLevelDto[i]
					if (oneDto.level_number == incimingIndex){
						sendNotification(GeneralNotification.LOAD_CURENT_LEVEL, oneDto);
					break;
					}
			}
				
		}
	}
}