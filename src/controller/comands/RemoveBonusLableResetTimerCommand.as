package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.BonusProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class RemoveBonusLableResetTimerCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
//			(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).resetLableTimer();
//			sendNotification(GeneralNotification.DELL_BONUS_LABLE);
		}
	}
}