package advancedflex.graphics.drawing {
	
	import advancedflex.math.geom.Circle2d;
	import advancedflex.math.geom.Ellipse2d;
	import advancedflex.math.geom.Rect2d;
	import advancedflex.math.geom.Vector2d;
	
	import flash.display.Graphics;

	public class DrawingBase implements IDrawing {
		
		private var $g:Graphics;
		
		public function DrawingBase(graphics:Graphics) {
			$g = graphics;
		}
		
		public function lineTo(point:Vector2d):void {
			$g.lineTo(point.x, point.y);
		}
		
		public function drawRect(rect:Rect2d):void {
			$g.drawRect(rect.x, rect.y, rect.width, rect.height);
		}
		
		public function clear():void {
			$g.clear();
		}
		
		public function drawCircle(circle:Circle2d):void {
			var center:Vector2d = circle.center
			$g.drawCircle(center.x, center.y, circle.radius);
		}
		
		public function get graphics():Graphics {
			return $g;
		}
		
		public function curveTo(control:Vector2d, anchor:Vector2d):void {
			$g.curveTo(control.x, control.y, anchor.x, anchor.y);
		}
		
		public function moveTo(point:Vector2d):void {
			$g.moveTo(point.x, point.y);
		}
		
		public function drawEllipse(ellipse:Ellipse2d):void {
			//TODO $g.drawEllipse(
		}
		
		public function drawRoundRect(rect:Rect2d, 
			ellipseWidth:Number, ellipseHeight:Number):void
		{
			$g.drawRoundRect(rect.x, rect.y, rect.width, 
				rect.height, ellipseWidth, ellipseHeight);
		}
		
	}
}