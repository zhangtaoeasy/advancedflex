/////////////////////////////////////////////////////////////////////////////////
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
package advancedflex.display.images.imagefilters {
	
	import advancedflex.display.images.ImageBufferManager;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 老照片滤镜
	 */
	public class ImgOldPhotoFilter implements IImageFilter {
		public var seed:int;
		public function ImgOldPhotoFilter(randomSeed:int) {
			seed = randomSeed;
		}
		public function generateFilterRect(sourceBitmapData:BitmapData, rect:Rectangle=null):Rectangle {
			return rect || sourceBitmapData.rect;
		}
		private static const $COLOR_TRANSFORM:ColorTransform 
			= new ColorTransform(0.7, 0.7, 0.7, 0x44, 0x33, 0x22);
		private static const $BLUR_FILTER:BlurFilter = new BlurFilter(0.2, 0.2);
		public function apply(
			inputBitmapData:BitmapData, 
			outputBitmapData:BitmapData, 
			sourceRect:Rectangle, 
			destPoint:Point):void 
		{
			outputBitmapData.copyPixels(inputBitmapData, sourceRect, destPoint);
			sourceRect.x = destPoint.x;
			sourceRect.y = destPoint.y;
			//Color Transform
			outputBitmapData.colorTransform(sourceRect,  $COLOR_TRANSFORM);
			outputBitmapData.applyFilter(outputBitmapData, sourceRect, destPoint, $BLUR_FILTER);
			//Noise
			var noise:BitmapData = ImageBufferManager.offerBuffer(sourceRect.width, sourceRect.height);
			noise.noise(0, 0xee, 0xff, 7, true);
			outputBitmapData.draw(
				noise, 
				new Matrix(1, 0, 0, 1, destPoint.x, destPoint.y), 
				null, 
				BlendMode.MULTIPLY
			);
			ImageBufferManager.recycle(noise);
		}
		
		public function clone():IImageFilter {
			return new ImgOldPhotoFilter(seed);
		}
		
	}
}