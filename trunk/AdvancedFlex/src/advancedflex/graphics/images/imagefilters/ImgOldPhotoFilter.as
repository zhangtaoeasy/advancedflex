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
	
	import advancedflex.afgl.images.ImageBufferManager;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 老照片滤镜。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 */
	public class ImgOldPhotoFilter implements IImageFilter {
		
		/**
		* 添加杂点用的随机种子。
		*/
		public var seed:int;
		
		/**
		 * 创建一个 ImgOldPhotoFilter 对象。
		 * @param randomSeed 添加杂点用的随机种子。
		 */
		public function ImgOldPhotoFilter(randomSeed:int) {
			seed = randomSeed;
		}
		
		/**
		 * 已知 BitmapData 对象、源矩形和滤镜对象，
		 * 确定 apply() 方法调用所影响的目标矩形。
		 * 他永远返回<code>sourceBitmapData.rect ∩ rect</code>。
		 * @param sourceBitmapData BitmapData 对象。
		 * @param rect 一个矩形，它定义要用作输入的源图像的区域。
		 * 默认为<code>sourceBitmapData.rect</code>。
		 * 
		 * @return 一个目标矩形，它是使用图像、sourceRect 参数和滤镜计算得到的。
		 * 
		 * @throws TypeError BitmapData 为空。
		 * 
		 * @see flash.display.BtemapData#generateFilterRect
		 */
		public function generateFilterRect(
			sourceBitmapData:BitmapData, 
			rect:Rectangle=null
			):Rectangle 
		{
			if(!sourceBitmapData) {
				throw new TypeError("sourceBitmapData must not be null.");
			}
			if(!rect) {
				return sourceBitmapData.rect;
			}
			return sourceBitmapData.rect.intersection(rect);
		}
		
		/**
		 * @private
		 * 用于调整颜色的 ColorTransform 。
		 */
		private static const $COLOR_TRANSFORM:ColorTransform 
			= new ColorTransform(0.7, 0.7, 0.7, 0x44, 0x33, 0x22);
			
		/**
		 * @private
		 * 用于模糊的 BlurFilter 。
		 */
		private static const $BLUR_FILTER:BlurFilter = new BlurFilter(0.2, 0.2);
		
		/**
		 * 应用滤镜。
		 * 
		 * @param inputBitmapData 要使用的输入位图图像。
		 * @param outputBitmapData 要使用的输出位图图像。
		 * @param sourceRect 定义要用作输入的源图像区域的矩形。
		 * @param destPoint 目标图像（当前 BitmapData 实例)中与源矩形的左上角对应的点。
		 * 当 inputBitmapData 与 outputBitmapData 相同时忽略此参数。
		 * 
		 * @throws TypeError inputBitmapData、outputBitmapData、
		 * sourceRect、destPoint 为空。
		 * 
		 * @see flash.display.BtemapData#applyFilter
		 */
		public function apply(
			inputBitmapData:BitmapData, 
			outputBitmapData:BitmapData, 
			sourceRect:Rectangle, 
			destPoint:Point):void 
		{
			if(inputBitmapData != outputBitmapData) {
				outputBitmapData.copyPixels(
					inputBitmapData, 
					sourceRect, 
					destPoint
				);
				sourceRect.x = destPoint.x;
				sourceRect.y = destPoint.y;
			} else {
				destPoint.x = sourceRect.x;
				destPoint.y = sourceRect.y;
			}
			//Color Transform
			outputBitmapData.colorTransform(sourceRect,  $COLOR_TRANSFORM);
			//Blur
			outputBitmapData.applyFilter(
				outputBitmapData, 
				sourceRect, 
				destPoint, 
				$BLUR_FILTER
			);
			//Noise
			var noise:BitmapData = 
				ImageBufferManager.offerBuffer(
					sourceRect.width, 
					sourceRect.height
				);
			noise.noise(0, 0xee, 0xff, 7, true);
			outputBitmapData.draw(
				noise, 
				new Matrix(1, 0, 0, 1, destPoint.x, destPoint.y), 
				null, 
				BlendMode.MULTIPLY
			);
			ImageBufferManager.recycle(noise);
		}
		
		/**
		 * 返回一个新的 ImgOldPhotoFilter 对象，
		 * 它是对原始实例的克隆，包含与原始实例完全相同的副本。
		 * 
		 * @return 新的 ImgOldPhotoFilter 对象。
		 */
		public function clone():IImageFilter {
			return new ImgOldPhotoFilter(seed);
		}
		
	}
}