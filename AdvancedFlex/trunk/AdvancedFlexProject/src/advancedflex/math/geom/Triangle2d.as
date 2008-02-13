package advancedflex.math.geom {
	public class Triangle2d implements IArea2d {
		
		public var p1:Vector2d;
		
		public var p2:Vector2d;
		
		public var p3:Vector2d;
		
		public function Triangle2d(p1:Vector2d, p2:Vector2d, p3:Vector2d) {
			this.p1 = p1;
			this.p2 = p2;
			this.p3 = p3;
		}
		public function get area():Number {
			/*
			 *  1 |aX aY 1|
			 * ---|bX bY 1| = (aX*bY + bX*cY + cX*aY - bX*aY - cX*bY - aX*cY)/2
			 *  2 |cX cY 1|
			 */
			var aX:Number = p1.x, aY:Number = p1.y;
			var bX:Number = p2.x, bY:Number = p2.y;
			var cX:Number = p3.x, cY:Number = p3.y;
			return (aX*bY + bX*cY + cX*aY - bX*aY - cX*bY - aX*cY)/2;
		}
		
		public function equals(toCompare:*, tol:Number=1e-12):Boolean {
			var pSelf:Array = [p1, p2, p3];
			var p2compare:Array = [toCompare.p1, toCompare.p2, toCompare.p3];
			pSelf.sortOn(["x", "y"], Array.NUMERIC);
			p2compare.sortOn(["x", "y"], Array.NUMERIC);
			return pSelf[0].equals(p2compare[0], tol)
				&& pSelf[1].equals(p2compare[1], tol)
				&& pSelf[2].equals(p2compare[2], tol);
		}
		
		public function get rect():Rect2d {
			var aX:Number = p1.x, aY:Number = p1.y;
			var bX:Number = p2.x, bY:Number = p2.y;
			var cX:Number = p3.x, cY:Number = p3.y;
			
			var top:Number = aY, bottom:Number = aY;
			var left:Number = aX, right:Number = aX;
			
			if(bX < left) {
				left = bX;
			} else if(bX > right) {
				right = bX;
			}
			if(cX < left) {
				left = cX;
			} else if(cX > right) {
				right = cX;
			}
			
			if(bY < top) {
				top = bX;
			} else if(bX > bottom) {
				bottom = bX;
			}
			if(cY < top) {
				top = cX;
			} else if(cX > bottom) {
				bottom = cX;
			}
			
			var result:Rect2d = new Rect2d(new Vector2d(top, left));
			result.bottom = bottom;
			result.right = right;
			return result;
		}
		
		public function clone():IArea2d {
			return new Triangle2d(
				p1.clone() as Vector2d,
				p2.clone() as Vector2d,
				p3.clone() as Vector2d);
		}
		
	}
}