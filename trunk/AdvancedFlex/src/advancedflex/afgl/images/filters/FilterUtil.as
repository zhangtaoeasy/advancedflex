package advancedflex.afgl.images.filters {
	import advancedflex.afgl.images.ImageBufferManager;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class FilterUtil {
		public static function applyFilters(
			inputBitmapData:BitmapData,
			outputBitmapData:BitmapData,
			inputRect:Rectangle,
			destPoint:Point,
			filters:Array, 
			keepInput:Boolean = true):void
		{
			if(		!filters
				 || !destPoint
				 || !inputRect 
				 || !outputBitmapData 
				 || !inputBitmapData
			){
				throw new ArgumentError("All params must not be null.");
			}
			if(filters.length == 0) {
				throw new ArgumentError("param:<filters> must not be empty.");
			}
			if(filters.length == 1) {
				outputBitmapData.applyFilter(
					inputBitmapData, 
					inputRect, 
					destPoint, 
					filters[0]
				);
			}
			var useBuffer:Boolean = false;
			if(inputBitmapData == outputBitmapData) {
				outputBitmapData = ImageBufferManager.offerFixedBuffer(
					inputBitmapData.width,
					inputBitmapData.height,
					inputBitmapData.transparent
				);
				destPoint.x = inputRect.x;
				destPoint.y = inputRect.y;
				useBuffer = true;
				if(keepInput) {
					inputBitmapData = inputBitmapData.clone();
				}
			}
			var index:int = 0;
			var length:int = filters.length;
			var reRect:Rectangle = inputRect.clone();
			var rePoint:Point = destPoint.clone();
			$swapRectPoint(reRect, rePoint);
			
			if(length % 2 == 1) {
				length--;
			}
			for(var i:int = 0; i < length; i+=2) {
				outputBitmapData.applyFilter(
					inputBitmapData,
					inputRect,
					destPoint,
					filters[i]
				);
				inputBitmapData.applyFilter(
					outputBitmapData,
					reRect,
					rePoint,
					filters[i+1]
				);
			}
			if(filters.length % 2 == 0) {
				if(!useBuffer) {
					outputBitmapData.copyPixels(
						inputBitmapData, 
						inputRect, 
						destPoint
					);
				}
			}else{
				inputBitmapData.applyFilter(
					outputBitmapData,
					reRect,
					rePoint,
					filters[filters.length-1]
				);
			}
			if(useBuffer) {
				inputBitmapData.copyPixels(
					outputBitmapData, 
					reRect, 
					rePoint
				);
				ImageBufferManager.recycle(outputBitmapData);
				outputBitmapData = null;
			}
			if(keepInput) {
				ImageBufferManager.recycle(inputBitmapData);
			}
		}
		private static function $swapRectPoint(rect:Rectangle, point:Point):void {
			var srcX:Number = rect.x;
			var srcY:Number = rect.y;
			rect.x = point.x;
			rect.y = point.y;
			point.x = srcX;
			point.y = srcY;
		}
	}
}