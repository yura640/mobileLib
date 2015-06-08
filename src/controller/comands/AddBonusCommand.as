package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.BonusProxy;
	import model.proxy.GameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddBonusCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{ //генерируем два числа с одинаковой долей вероятности
																			// одно число бонус времени - второе редБтн
			var bonusNumber:int = (Math.floor(Math.random()*2)+1);

			if (bonusNumber == 1){
			sendNotification(GeneralNotification.ADD_CURENT_BONUS);	
			//(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).resetLableTimer();
			sendNotification(GeneralNotification.DELL_BONUS_LABLE);

			} if (bonusNumber == 2){
				(facade.retrieveProxy(GameProxy.NAME) as GameProxy).resetGameTimer();
				sendNotification(GeneralNotification.ADD_BONUS_SEC);
				sendNotification(GeneralNotification.DELL_BONUS_LABLE);
				//(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).resetLableTimer();
			}
	}
	}
}