////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
package advancedflex.afgl.images.imagefilters {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class ImgCustomColorNoiseFilter implements IImageFilter{

		public var nextRandomSeed:int;
		public var randomSeed:int;
		protected var colors:Array;
		protected var pixels:Array;
		protected var isRatio:Boolean;
		
		public function ImgCustomColorNoiseFilter(
			randomSeed:int, 
			colors:Array, 
			pixels:Array, 
			isRatio:Boolean = true) 
		{
			if(colors.length != pixels.length) {
				throw new ArgumentError("colors.length != ratios.length.");
			}
			this.randomSeed = randomSeed;
			this.colors = colors;
			this.pixels = pixels;
			this.isRatio = isRatio;
		}
		
		public function generateFilterRect(
			sourceBitmapData:BitmapData
			):Rectangle 
		{
			return sourceBitmapData.rect;
		}
		
		public function apply(
			inputBitmapData:BitmapData,
			outputBitmapData:BitmapData,
			sourceRect:Rectangle,
			destPoint:Point):void
		{
			if(!(inputBitmapData && outputBitmapData )) {
				throw new ArgumentError("BitmapData must not be null.");
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
				outputBitmapData.copyPixels(
					inputBitmapData, 
					sourceRect, 
					destPoint
				);
				sourceRect.x = destPoint.x;
				sourceRect.y = destPoint.y;
			}
			for(i = 0; i < length; i++) {
				nextRandomSeed = 
					outputBitmapData.pixelDissolve(
						outputBitmapData, 
						sourceRect, 
						point, 
						nextRandomSeed, 
						pixels[i], 
						colors[i]
					);
			}
		}
		
		public function clone():IImageFilter {
			return null;
		}
		
	}
}