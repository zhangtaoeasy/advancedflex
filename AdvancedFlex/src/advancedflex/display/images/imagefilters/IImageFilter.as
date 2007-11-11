package advancedflex.display.images.imagefilters {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public interface IImageFilter {
		function apply(
			inputBitmapData:BitmapData,
			outputBitmapData:BitmapData,
			sourceRect:Rectangle,
			destPoint:Point):void;
		function generateFilterRect(sourceBitmapData:BitmapData, rect:Rectangle = null):Rectangle;
		function clone():IImageFilter;
	}
}