package advancedflex.graphics.drawing {
	import advancedflex.math.geom.Circle2d;
	import advancedflex.math.geom.Ellipse2d;
	import advancedflex.math.geom.Rect2d;
	import advancedflex.math.geom.Vector2d;
	
	import flash.display.Graphics;

	public class AbstractDrawing implements IDrawing {
		protected var g:Graphics;
		
		public function AbstractDrawing(graphics:Graphics) {
			g = graphics;
		}
		
		public function lineTo(point:Vector2d):void {
		}
		
		public function drawRect(rect:Rect2d):void {
		}
		
		public function clear():void {
		}
		
		public function drawCircle(circle:Circle2d):void {
		}
		
		public function get graphics():Graphics
		{
			return super.graphics;
		}
		
		public function curveTo(control:Vector2d, anchor:Vector2d):void
		{
		}
		
		public function moveTo(point:Vector2d):void
		{
		}
		
		public function drawEllipse(ellipse:Ellipse2d):void
		{
		}
		
		public function drawRoundRect(rect:Rect2d, ellipseWidth:Number, ellipseHeight:Number):void
		{
		}
		
	}
}