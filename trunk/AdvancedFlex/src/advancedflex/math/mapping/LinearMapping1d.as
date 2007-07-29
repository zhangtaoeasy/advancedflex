package advancedflex.math.mapping {
	import flash.geom.Point;
	
	public class LinearMapping1d implements IMapping1d {
		var a:Number, b:Number
		
		/*斜截式*/
		public function LinearMapping1d(a:Number = 1, b:Number = 0) {
			if(a==0 || isNaN(a + b)) {
				throw new ArgumentError("Arguments must not be NaN.");
			}
			this.a = a;
			this.b = b;
		}
		/*
		 *      y2-y1
		 * y = -------(X - x1) + y1;
		 *      x2-x1
		 * 
		 *      y2-y1
		 * A = -------;
		 *      x2-x1
		 * y = A(X-x1) + y1
		 *   = AX - Ax1 + y1
		 * 
		 * a = A
		 * b = -Ax1 + y1
		 */
		 /*两点式*/
		public function twoPoint(p1:Point,p2:Point):LinearMapping1d {
			a = (p2.y-p1.y) / (p2.x-p1.x);
			b = p1.y - a*p1.x;
			if(isNaN(a + b)) {
				throw new ArgumentError("Arguments must not be (p1.x == p2.x) or NaN.");
			}
			return this;
		}
		/*点斜式*/
		public function pointSlope(point:Point, slope:Number):LinearMapping1d {
			if(isNaN(slope) || slope == 0) {
				throw new ArgumentError("Arguments must not be 0 or NaN.");
			}
			a = slope;
			b = -a*point.x + point.y;
			return this;
		}
		/*点角式*/
		public function pointAngle(point:Point, angleRadin:Number):LinearMapping1d {
			return pointSlope(point, Math.sin(angleRadin) / Math.cos(angleRadin));
		}
		public function getValue(value:Number):Number {
			return a*value + b;
		}
		
		public function inRange(value:Number):Boolean {
			return !isNaN(value);
		}
	}
}