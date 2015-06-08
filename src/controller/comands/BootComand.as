package controller.comands
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import model.dto.FlashVarsDto;
	import model.proxy.BonusProxy;
	import model.proxy.EnemieProxy;
	import model.proxy.FlashVariantsProxy;
	import model.proxy.FlashVarsProxy;
	import model.proxy.GameProxy;
	import model.proxy.LevelProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	import utils.WareHouse;
	
	import view.mediator.GamePlayMediator;
	import view.mediator.RootMediator;
	import view.mediator.ScoreMediator;
	
	public class BootComand extends SimpleCommand
	{
		
		
		override public function execute(notification:INotification):void{
			
			
			var rootSprite:Sprite = notification.getBody() as Sprite;
			var flashVarsDto:FlashVarsDto=new FlashVarsDto(); // pyti загрузки
			
			facade.registerCommand(GeneralNotification.LOAD_MAIN_RESOURSES , LoadMainContentCommand);
			facade.registerCommand("SLC", SelectLevelCommand);
			facade.registerCommand(GeneralNotification.LOAD_GAME, LoadGameComand);
			facade.registerCommand(GeneralNotification.GAME_IS_LOADED, StartLobbyComand);
			facade.registerCommand(GeneralNotification.LOAD_CURENT_LEVEL, LoadLevelCommand);
			facade.registerCommand(GeneralNotification.ON_CLICK_ON_HIGH_SCORE_BTN, OpenHighScoreCommand);
			facade.registerCommand(GeneralNotification.ADD_NAME_COMMAND, AddNameCommand);
			facade.registerCommand(GeneralNotification.CLICK_RETURN_BTN, RemoveHighScorePanelCommand);
			facade.registerCommand(GeneralNotification.START_THE_GAME, StartLevelComand);
			facade.registerCommand(GeneralNotification.GENERATE_ENEMI_AND_CELL, AddedEnemiCommand);
			facade.registerCommand("dobavitVraga1", AddEnemieToCellComand);
			facade.registerCommand(GeneralNotification.CLICK_ON_ENEMIE, KillingEnemieCommand);	
			facade.registerCommand(GeneralNotification.RESET_SCORE, ChangeScoreCommand);
			facade.registerCommand(GeneralNotification.REMOVE_CURENT_BONUS_COMMAND, RemoveCurentBonusCommand);
			facade.registerCommand(GeneralNotification.DELL_BONUS_LABLE_COMMAND, BonusLableRemoveCommand);
			facade.registerCommand(GeneralNotification.ADD_BONUS_TO_STAGE, AddBonusCommand);
			facade.registerCommand(GeneralNotification.DELL_BONUS_RESET_TIMER_COMMAND, RemoveBonusLableResetTimerCommand);
			facade.registerCommand(GeneralNotification.REMOVE_TARGET_BY_RED_BTN, KillingEnemieByBtnCommand);
			facade.registerCommand(GeneralNotification.GAME_OVER_COMMAND, GameOverCommand);
			facade.registerCommand(GeneralNotification.TO_MAKE_RELOAD_COMMAND, ReloadCommand);
			
			facade.registerMediator( new RootMediator(rootSprite));
			facade.registerProxy(new LevelProxy());
			facade.registerProxy(new UserProxy());
			facade.registerProxy(new GameProxy());
			facade.registerProxy(new BonusProxy());
			facade.registerProxy( new EnemieProxy());
			sendNotification(GeneralNotification.LOAD_GAME);
		}
	}
}