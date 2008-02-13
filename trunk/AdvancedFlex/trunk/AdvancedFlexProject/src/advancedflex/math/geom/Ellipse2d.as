package advancedflex.math.geom {
	import advancedflex.utils.FloatUtil;
	
	public class Ellipse2d implements IArea2d {
		
		public var center:Vector2d;
		
		public var radiusX:Number;
		
		public var radiusY:Number;
		
		public function Ellipse2d(center:Vector2d, radiusX:Number, radiusY:Number) {
			this.center = center;
			this.radiusX = radiusX;
			this.radiusY = radiusY;
		}
		
		public function get rect():Rect2d {
			return new Rect2d(
				new Vector2d(
					center.x-radiusX, center.y-radiusY),
				radiusX*2, radiusY*2);
		}
		
		public function get area():Number {
			return radiusX*radiusY*Math.PI;
		}
		
		public function equals(toCompare:*, tol:Number=1e-12):Boolean {
			return center.equals(toCompare.center, tol)
				&& FloatUtil.equals(radiusX, toCompare.radiusX, tol)
				&& FloatUtil.equals(radiusY, toCompare.radiusY, tol);;
		}
		
		public function clone():IArea2d {
			return new Ellipse2d(center.clone() as Vector2d, radiusX, radiusY);
		}
		
	}
}