package controller.comands
{
	import model.dto.GamesConfigDO;
	import model.proxy.LevelProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LoadLevelCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var oneDto:GamesConfigDO = notification.getBody() as GamesConfigDO;
			(facade.retrieveProxy(LevelProxy.NAME) as LevelProxy).parseIncomDto(oneDto);
		}
	}
}