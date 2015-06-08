package controller.comands
{
	import config.GeneralNotification;
	
	import model.dto.EnemieDto;
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ChangeScoreCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			switch(notification.getBody()){
				case 1:
					(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addScore(-50);
					break;
				case 2:	
					(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addScore(100);
					break;
				case 3:
					(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addScore(200);
				break;
			}
			//(facade.retrieveProxy(GameProxy.NAME) as GameProxy).timerReset();
		}
	}
}