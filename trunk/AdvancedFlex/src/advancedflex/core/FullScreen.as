package advancedflex.core {
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.geom.Rectangle;
	
	public class FullScreen {
		public static function go(display:DisplayObject):void {
			var stage:Stage = display.stage;
			stage["fullScreenSourceRect"] = new Rectangle(0, 0, stage.width, stage.height);
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		public static function back(display:DisplayObject):void {
			var stage:Stage = display.stage;
			stage.displayState = StageDisplayState.NORMAL;
		}
	}
}