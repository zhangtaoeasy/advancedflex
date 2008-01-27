package advancedflex.graphics.images.imagefilters {
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	public class ImgReduceNoiseFilter extends AbstractImageFilter {
		
		public override function apply(
			inputBitmapData:BitmapData, 
			outputBitmapData:BitmapData, 
			sourceRect:Rectangle, 
			destPoint:Point
			):void
		{
			validateApplyParam(
				inputBitmapData, outputBitmapData, sourceRect, destPoint);
			$apply(inputBitmapData, outputBitmapData, sourceRect);
			
		}
		
		private function $apply(
			inputBitmapData:BitmapData, 
			outputBitmapData:BitmapData,
			rect:Rectangle
			):void 
		{
			outputBitmapData.lock();
			var width:int = rect.width;
			var height:int = rect.height;
			var xMax:int = rect.right;
			var yMax:int = rect.bottom;
			var color:uint;
			var colors:Array = new Array(9);
			var ty:int;
			for(var x:int = rect.x; x<xMax; x++) {
				for(var y:int = rect.y; y<yMax; y++) {
					ty = y;
					//1, 2, 3
					ty--;
					colors[0] = inputBitmapData.getPixel(x-1, y);
					colors[1] = inputBitmapData.getPixel(x  , y);
					colors[2] = inputBitmapData.getPixel(x+1, y);
					//4, 5, 6
					ty++;
					colors[3] = inputBitmapData.getPixel(x-1, y);
					colors[4] = inputBitmapData.getPixel(x  , y);
					colors[5] = inputBitmapData.getPixel(x+1, y);
					//7, 8, 9
					ty++;
					colors[6] = inputBitmapData.getPixel(x-1, y);
					colors[7] = inputBitmapData.getPixel(x  , y);
					colors[8] = inputBitmapData.getPixel(x+1, y);
					//
					colors.sort(Array.NUMERIC);
					outputBitmapData.setPixel(x, y, colors[4]);
				}
			}
			outputBitmapData.unlock(rect);
		}
		
		public override function clone():IImageFilter {
			return new ImgReduceNoiseFilter();
		}
		
	}
}