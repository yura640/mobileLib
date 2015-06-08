package controller.comands
{
	import model.proxy.BonusProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BonusLableRemoveCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).removeBonusLable();
		}
	}
}