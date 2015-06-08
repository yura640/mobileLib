package model.proxy
{
	import config.GeneralNotification;
	
	import model.dto.GamesConfigDO;
	import model.dto.LevelDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class LevelProxy extends Proxy
	{
		public static const NAME:String = "LevelProxy";
		
		public function LevelProxy()
		{
			super(NAME, new LevelDto());
		}
		public function get levelDto():LevelDto{
		return getData() as LevelDto;
		}
		public function parseIncomDto(incomDto:GamesConfigDO):void{
			levelDto.levelNumber = incomDto.level_number;
			levelDto.levelTime = incomDto.level_time;
			levelDto.scoresToNextLevel = incomDto.scores_to_next_level;
			levelDto.timeOfEnemieGenerate = incomDto.time_of_enemie_generate
			levelDto.typeOfEnemie = incomDto.type_of_enemie;
		}
		
	}
}