package advancedflex.math.geom {
	import advancedflex.utils.CompareUtil;
	
	public class Circle2d implements IArea2d {
		public var radius:Number;
		public var center:Vector2d;
		
		public function Circle2d(r:Number = 0, center:Vector2d = null) {
			radius = r;
			this.center = center;
		}
		
		
		public function get rect():Rect2d {
			return null;
		}
		
		public function equals(toCompare:*, tol:Number = 1e-12):Boolean {
			return CompareUtil.eqFloat(radius, toCompare.radius)
				&& center.equals(toCompare.center, tol);
		}
		
		public function clone():IArea2d {
			//TODO
			return null;
		}
	}
}