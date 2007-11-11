package advancedflex.display.images.imagefilters {
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	public class ImgCustomColorNoiseFilter implements IImageFilter{

		public var nextRandomSeed:int;
		public var randomSeed:int;
		protected var colors:Array;
		protected var pixels:Array;
		protected var isRatio:Boolean;
		
		public function ImgCustomColorNoiseFilter(randomSeed:int, colors:Array, pixels:Array, isRatio:Boolean = true) {
			if(colors.length != pixels.length) {
				throw new ArgumentError("colors.length != ratios.length.");
			}
			this.randomSeed = randomSeed;
			this.colors = colors;
			this.pixels = pixels;
			this.isRatio = isRatio;
		}
		
		public function generateFilterRect(sourceBitmapData:BitmapData):Rectangle {
			return sourceBitmapData.rect;
		}
		
		public function apply(
			inputBitmapData:BitmapData,
			outputBitmapData:BitmapData,
			sourceRect:Rectangle,
			destPoint:Point):void
		{
			if(!(inputBitmapData && outputBitmapData )) {
				throw new ArgumentError("BitmapData is null.");
			}
			if(colors.length != pixels.length) {
				throw new ArgumentError("colors.length != ratios.length.");
			}
			nextRandomSeed = randomSeed;
			var i:int;
			var length:int = colors.length;
			if(isRatio) {
				var s:int = sourceRect.width * sourceRect.height;
				for(i = 0; i < length; i++) {
					pixels[i] = s*pixels[i];
				}
			}
			var point:Point = new Point(sourceRect.x, sourceRect.y);
			if(inputBitmapData != outputBitmapData) {
				outputBitmapData.copyPixels(inputBitmapData, sourceRect, destPoint);
				sourceRect.x = destPoint.x;
				sourceRect.y = destPoint.y;
			}
			for(i = 0; i < length; i++) {
				nextRandomSeed = outputBitmapData.pixelDissolve(outputBitmapData, sourceRect, point, nextRandomSeed, pixels[i], colors[i]);
			}
		}
		
		public function clone():IImageFilter {
			return null;
		}
		
	}
}