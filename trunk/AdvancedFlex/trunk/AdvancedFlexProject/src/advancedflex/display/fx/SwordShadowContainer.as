package advancedflex.display.fx {
	import flash.display.Sprite;
	import advancedflex.math.geom.Vector2d;

	public class SwordShadowContainer extends Sprite {
		
		internal var queue:Array;
		
		internal var length:int;//correct length - 1
		
		public function SwordShadowContainer() {
			super();
		}
		internal function setup():void {
			
		}
		internal function teardown():void {
			
		}
		internal function update(p1:Vector2d, p2:Vector2d):void {
			var point:Tuple2d = queue.pop();
			point.reset(p1, p2);
			queue.unshift(point);
			draw();
		}
		private function draw():void {
			for(var i:int = 0; i < length; i++) {
			}
		}
	}
}
	import advancedflex.math.geom.Vector2d;
	
class Tuple2d {
	
	internal var p1:Vector2d;
	
	internal var p2:Vector2d;
	
	internal function reset(p1:Vector2d, p2:Vector2d):void {
		this.p1 = p1;
		this.p2 = p2;
	}
}