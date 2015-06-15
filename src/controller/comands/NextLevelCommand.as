package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.LevelProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.NextLevelMediator;
	
	public class NextLevelCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var nameUser:String = notification.getBody() as String;
			var curentLevel:int = (facade.retrieveProxy(LevelProxy.NAME) as LevelProxy).levelDto.levelNumber;
			var nextLevel:int = curentLevel + 1;
				sendNotification("SLC", nextLevel);
				facade.removeMediator(NextLevelMediator.NAME);
				sendNotification(GeneralNotification.START_THE_GAME, nameUser);
		}
	}
}