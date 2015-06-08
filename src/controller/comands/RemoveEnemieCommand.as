package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.GameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class RemoveEnemieCommand extends SimpleCommand
	{	
		
		override public function execute(notification:INotification):void{
		
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).removeEnemie();
	
		}
	}
}
