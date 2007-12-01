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

package advancedflex.afgl.images.filters {
	
	import flash.filters.BitmapFilter;
	import flash.filters.ColorMatrixFilter;

	/**
	 * 可使用 ColorTransformFilterFactory 类调整显示对象的颜色值。
	 * <p>这个滤镜主要是为了解决 ColorTransform 不是滤镜的问题。</p>
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 * @see flash.geom.ColorTransform
	 */
	public class ColorTransformFilterFactory implements IBitmapFilterFactory {
		
		/**
		 * 与红色通道值相乘的十进制值。
		 */
		public var redMultiplier:Number;
		
		/**
		 * 与绿色通道值相乘的十进制值。
		 */
		public var greenMultiplier:Number;
		
		/**
		 * 与蓝色通道值相乘的十进制值。
		 */
		public var blueMultiplier:Number;
		
		/**
		 * 与 Alpha 透明度通道值相乘的十进制值。
		 */
		public var alphaMultiplier:Number;
		
		/**
		 * -255 到 255 之间的数字，它先与 redMultiplier 值相乘，再与红色通道值相加。
		 */
		public var redOffset:Number;
		
		/**
		 * -255 到 255 之间的数字，它先与 greenMultiplier 值相乘，再与绿色通道值相加。
		 */
		public var greenOffset:Number;
		
		/**
		 * -255 到 255 之间的数字，它先与 blueMultiplier 值相乘，再与蓝色通道值相加。
		 */
		public var blueOffset:Number;
		
		/**
		 * -255 到 255 之间的数字，
		 * 它先与 alphaMultiplier 值相乘，再与 Alpha 透明度通道值相加。
		 */
		public var alphaOffset:Number;
		
		/**
		 * ColorTransformFilterFactory 对象的 RGB 颜色值。
		 * 设置此属性时，
		 * 会相应地更改三种颜色的偏移量值（redOffset、greenOffset 和 blueOffset），
		 * 并将这三个颜色乘数值（redMultiplier、greenMultiplier 和 blueMultiplier）
		 * 设置为 0。 Alpha 透明度乘数和偏移量值不变。
		 */
		public function get color():uint {
			return 
				((int(redOffset)   & 0x00FF0000) << 16) |
				((int(greenOffset) & 0x0000FF00) <<  8) |
				(int(blueOffsetb)  & 0x000000FF);
		}
		
		public function set color(v:uint):void {
			redMultiplier = greenMultiplier = blueMultiplier = 0;
			redOffset   = (v & 0x00FF0000) >> 16;
			greenOffset = (v & 0x0000FF00) >>  8;
			blueOffset  = (v & 0x000000FF);
		}
		
		/**
		 * 用指定的颜色通道值和 Alpha 值为显示对象创建 ColorTransformFilterFactory。
		 * <p>注意，此方法不会检查参数的范围。</p>
		 * @param redMultiplier 红色乘数的值，在 0 到 1 范围内。
		 * @param greenMultiplier 绿色乘数的值，在 0 到 1 范围内。
		 * @param blueMultiplier 蓝色乘数的值，在 0 到 1 范围内。
		 * @param alphaMultiplier Alpha 透明度乘数的值，在 0 到 1 范围内。
		 * @param redOffset 红色通道值的偏移量，在 -255 到 255 范围内。
		 * @param greenOffset 绿色通道值的偏移量，在 -255 到 255 范围内。
		 * @param blueOffset 蓝色通道值的偏移量，在 -255 到 255 范围内。
		 * @param alphaOffset Alpha 透明度通道值的偏移量，在 -255 到 255 范围内。
		 */
		public function ColorTransformFilterFactory(
			redMultiplier:Number = 1.0, 
			greenMultiplier:Number = 1.0,
			blueMultiplier:Number = 1.0, 
			alphaMultiplier:Number = 1.0, 
			redOffset:Number = 0, 
			greenOffset:Number = 0, 
			blueOffset:Number = 0, 
			alphaOffset:Number = 0)
		{
			this.redMultiplier = redMultiplier;
			this.greenMultiplier = greenMultiplier;
			this.blueMultiplier = blueMultiplier;
			this.alphaMultiplier = alphaMultiplier;
			this.redOffset = redOffset;
			this.greenOffset = greenOffset;
			this.blueOffset = blueOffset;
			this.alphaOffset = alphaOffset;
		}
		
		/**
		 * 创建滤镜。
		 * @return 滤镜。
		 */
		public function create():BitmapFilter {
			return new ColorMatrixFilter([
				redMultiplier, 	0, 	0, 	0, 	redOffset,
				0, greenMultiplier, 0, 	0, 	greenOffset,
				0, 0, blueMultiplier, 	0, 	blueOffset,
				0, 0, 0, alphaMultiplier, 	alphaOffset,
			]);
		}
		
		/**
		 * 释放滤镜工厂占用的大内存，但实际上什么也不做。
		 * 调用后在调用其他方法时也不会发成错误。
		 */
		public function dispose():void {
			//Do Nothing.
		}
		
		/**
		 * 返回 ColorTransformFilterFactory 对象，
		 * 它是与原始 ColorTransformFilterFactory 对象完全相同的副本。
		 * @return ColorTransformFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new ColorTransformFilterFactory(
				redMultiplier, greenMultiplier, blueMultiplier, alphaMultiplier, 
				redOffset,     greenOffset,     blueOffset,     alphaOffset
			);
		}
		
	}
}