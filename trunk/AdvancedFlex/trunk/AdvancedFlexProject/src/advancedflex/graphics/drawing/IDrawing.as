package advancedflex.graphics.drawing {
	
	import advancedflex.math.geom.Circle2d;
	import advancedflex.math.geom.Ellipse2d;
	import advancedflex.math.geom.Rect2d;
	import advancedflex.math.geom.Vector2d;
	
	import flash.display.Graphics;
	
	public interface IDrawing {
		
		function get graphics():Graphics;
			
		function clear():void;
		
		function curveTo(control:Vector2d, anchor:Vector2d):void;
			
		function drawCircle(circle:Circle2d):void;
		
		function drawEllipse(ellipse:Ellipse2d):void;
			
		function drawRect(rect:Rect2d):void;
		
		function drawRoundRect(rect:Rect2d, 
			ellipseWidth:Number, ellipseHeight:Number):void;
		
		function lineTo(point:Vector2d):void;
		
		function moveTo(point:Vector2d):void;
	}
}