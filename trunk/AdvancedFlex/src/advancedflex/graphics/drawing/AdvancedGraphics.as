package advancedflex.graphics.drawing {
	import flash.display.Graphics;
	import flash.geom.Point;
	
	public class AdvancedGraphics implements IDrawing {
		
		private var $g:Graphics;
		
		public function get graphics():Graphics {
			return $g;
		}
		
		private static const $APPR:Number = 1.0 / 8;
		
		public function drawBezier(a:Point, b:Point, c:Point, d:Point):void {
			$g.moveTo(a.x, a.y);
			var pt1:Point = new Point();
			var pt2:Point = new Point();
			var pt3:Point = new Point();
			for(var t:Number = $APPR * 2; t <= 1.0; t += $APPR * 2) {
                $setBezierPoint(pt1, a, b, c, d, t);
                $setBezierPoint(pt2, a, b, c, d, t - $APPR);
                $setBezierPoint(pt3, a, b, c, d, t - 2*$APPR);

                pt2.x = 2*pt2.x - (pt1.x+pt3.x) / 2;
                pt2.y = 2*pt2.y - (pt1.y+pt3.y) / 2;
                $g.curveTo(pt2.x, pt2.y, pt1.x, pt1.y);
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