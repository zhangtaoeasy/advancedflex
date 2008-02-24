package advancedflex.graphics.drawing {
	import flash.display.Graphics;
	import flash.geom.Point;
	
	public class AdvancedGraphics extends AbstractDrawing implements IDrawing {
		
		public function AdvancedGraphics(g:Graphics) {
			super(g);
		}
		
		public function drawParametricEquation(
			fx:Function, fy:Function, 
			min:Number, max:Number, 
			interval:Number):void 
		{
			if(interval <= 0) {
				throw new ArgumentError("Param:<interval> must > 0.")
			}
			g.moveTo(fx(min), fy(min));
			if(min == max) {
				return;
			}
			var i:Number;
			if(min > max) {
				for(i = min - interval; i > max; i -= interval) {
					g.lineTo(fx(i), fy(i));
				}
			}else{
				for(i = min + interval; i < max; i += interval) {
					g.lineTo(fx(i), fy(i));
				}
			}
		}
		
		private static const $APPR:Number = 1.0 / 8;
		
		public function drawBezier3(a:Point, b:Point, c:Point, d:Point):void {
			g.moveTo(a.x, a.y);
			var pt1:Point = new Point();
			var pt2:Point = new Point();
			var pt3:Point = new Point();
			for(var t:Number = $APPR * 2; t <= 1.0; t += $APPR * 2) {
                $setBezierPoint(pt1, a, b, c, d, t);
                $setBezierPoint(pt2, a, b, c, d, t - $APPR);
                $setBezierPoint(pt3, a, b, c, d, t - 2*$APPR);

                pt2.x = 2*pt2.x - (pt1.x+pt3.x) / 2;
                pt2.y = 2*pt2.y - (pt1.y+pt3.y) / 2;
                g.curveTo(pt2.x, pt2.y, pt1.x, pt1.y);
            }
		}
		
		private function $setBezierPoint(
			point:Point,
			a:Point, 
			b:Point, 
			c:Point, 
			d:Point, 
			t:Number
			):void 
		{
			var N:Number = 1 - t;
			point.x =
					  N*N*N			* a.x
				+ 3 * N*N	* t		* b.x
				+ 3 * N 	* t*t	* c.x 
				+			  t*t*t	* d.x;
			point.y = 
					  N*N*N			* a.y 
				+ 3 * N*N	* t		* b.y 
				+ 3 * N		* t*t	* c.y 
				+			  t*t*t	* d.y;
		}
	}
}