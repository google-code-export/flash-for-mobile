package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import so.cuo.anes.admob.*;

	[SWF(width="960", height="640", frameRate="35", backgroundColor="#cccccc")]
	public class androidadmob extends Sprite
	{
		private var gid:String="a14fe845931f82e";
		public function androidadmob()
		{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.test1();
			drawRect();
		}
		
		private function drawRect():void
		{
			var g:Graphics=this.graphics;
			g.beginFill(0xffff00);
			g.drawRect(0,0,100,100);
			g.endFill();
		}
		private function test1():void
		{
			var admob:Admob=Admob.getInstance();
			if(admob.isSupported){
				admob.setUnitId(gid);
				admob.dispatcher.addEventListener(AdEvent.onReceiveAd,this.adHandler);
				admob.dispatcher.addEventListener(AdEvent.onFailedToReceiveAd,this.adHandler);
//				admob.showRelation(AdMobAlignment.ALIGN_BOTTOM,AdType.BANNER);
				admob.show(50,100,AdType.BANNER);
			}else{
				trace("not support");
			}
		}

		protected function adHandler(event:AdEvent):void
		{
			trace("receive ad");
		}
	}
}