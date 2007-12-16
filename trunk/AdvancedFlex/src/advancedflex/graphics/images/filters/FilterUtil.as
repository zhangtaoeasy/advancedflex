////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://advancedflex.googlecode.com/. 
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package advancedflex.graphics.images.filters {
	
	import advancedflex.graphics.images.ImageBufferManager;
	
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