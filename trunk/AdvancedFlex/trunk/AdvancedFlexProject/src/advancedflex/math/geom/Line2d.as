package advancedflex.math.geom {
	import advancedflex.utils.FloatUtil;
	
	public class Line2d implements IArea2d {
		protected var _interceptX:Number;
		
		protected var _interceptY:Number;
		
		public function Line2d(interceptX:Number, interceptY:Number) {
			_interceptX = interceptX;
			_interceptY = interceptY;
		}
		
		public function reset2p(p1:Vector2d, p2:Vector2d, tol:Number = 1e-12):Line2d {
			if(FloatUtil.equals(p1.x, p2.x, tol)) {
				_interceptX = Infinity;
				_interceptY = p1.y;
			}else if(FloatUtil.equals(p1.y, p2.y, tol)) {
				_interceptX = p1.x;
				_interceptY = Infinity;
			}else{
				var a:Number, b:Number;
				a = (p1.y-p2.y) / (p1.x-p2.x);
				b = -a*p1.x + p1.y;
				_interceptX = -b/a;
				_interceptY = b;
			}
			return this;
		}
		
		public function get rect():Rect2d {
			if(_interceptX == Infinity)
				return new Rect2d(new Vector2d(-Infinity, _interceptY), Infinity, 0);
			if(_interceptY == Infinity)
				return new Rect2d(new Vector2d(_interceptX, -Infinity), 0, Infinity);
			return new Rect2d(new Vector2d(-Infinity, -Infinity), Infinity, Infinity);
		}
		
		public function equals(toCompare:*, tol:Number=1e-12):Boolean {
			return FloatUtil.equals(_interceptX, toCompare._interceptX, tol)
				&& FloatUtil.equals(_interceptY, toCompare._interceptY, tol);
		}
		
		public function clone():IArea2d {
			return new Line2d(_interceptX, _interceptY);
		}
		
	}
}