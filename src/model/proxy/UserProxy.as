package model.proxy
{
	import config.GeneralNotification;
	
	import flash.net.SharedObject;
	
	import model.dto.UserDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class UserProxy extends Proxy
	{
		public static const NAME:String = "UserProxy";
		public var mySo:SharedObject;
		
		public function UserProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, new UserDto());
		}
		
		public function get user():UserDto{  
			return getData() as UserDto;
	}
		
		public function addScore(score:int):void{
			user.score+=score;
			sendNotification(GeneralNotification.CHANGE_SCORE, user.score);
			
		}
		
		public function addUserName (name1:String):void
		{
			user.name = name1;
			
		}
		public function sharedObject():void
		{
			 mySo = SharedObject.getLocal("mySharedObject7");
			
			 if (mySo.data == null) {
				 mySo.data[user.name] = new Object();
				 mySo.data.name = "mySharedObject7";
				 mySo.data[user.name].name = user.name;
				 mySo.data[user.name].score = user.score;
				// trace (user.name + "1");
				 mySo.flush();
			 }
			 if (mySo.data[user.name] == null){
				 mySo.data[user.name] = new Object();
				 mySo.data[user.name].name = user.name;
				 mySo.data[user.name].score = user.score;
				// trace (user.name + "2");
				 mySo.flush();
			 } else {
				 mySo.data[user.name].score = user.score;
				// trace (user.name + "3");
				 mySo.flush();
			 }
			 addScoreAndNameToArray();
		}

			public function addScoreAndNameToArray():void
				{ if (mySo !== null){
				var arrOfNamesAndScores:Array = new Array();
				for each(var obj:Object in mySo.data){
					try {
						arrOfNamesAndScores.push({name:obj.name as String, score:obj.score as int});
						arrOfNamesAndScores.sortOn("score", Array.DESCENDING | Array.NUMERIC);
						//trace (arrOfNamesAndScores);
					}
					catch (error:Error) {
						mySo.data.name;
					}
				}
					sendNotification(GeneralNotification.MY_HIGH_SCORE_DTO, arrOfNamesAndScores);
		}
				}		
//		public function sendDto ():void
//		{
//			sendNotification("myDto", UserDto);
		
//		}
	}
	}
