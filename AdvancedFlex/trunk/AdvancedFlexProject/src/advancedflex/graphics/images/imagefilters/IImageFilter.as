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
package advancedflex.graphics.images.imagefilters {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 针对BitmapData的滤镜接口。
	 * 
	 * <p>它可以实现普通的BitmapFilter无法实现的效果。</p>
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 * 
	 * @see flash.display.BtemapData
	 */
	public interface IImageFilter {
		
		/**
		 * 应用滤镜。
		 * 
		 * @param inputBitmapData 要使用的输入位图图像。
		 * @param outputBitmapData 要使用的输出位图图像。
		 * @param sourceRect 定义要用作输入的源图像区域的矩形。
		 * @param destPoint 目标图像（当前BitmapData 实例）中与源矩形的左上角对应的点。
		 * 当 inputBitmapData 与 outputBitmapData 相同时忽略此参数。
		 * 
		 * @throws TypeError inputBitmapData、outputBitmapData、
		 * sourceRect、destPoint 为空。
		 * @throws flash.errors.IllegalOperationError 
		 * BitmapData 对象的透明度与滤镜操作不兼容。
		 * 
		 * @see flash.display.BtemapData#applyFilter
		 */
		function apply(
			inputBitmapData:BitmapData,
			outputBitmapData:BitmapData,
			sourceRect:Rectangle,
			destPoint:Point):void;
			
		/**
		 * 已知 BitmapData 对象、源矩形和滤镜对象，
		 * 确定 apply() 方法调用所影响的目标矩形。
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
		function generateFilterRect(
			sourceBitmapData:BitmapData, 
			rect:Rectangle = null
			):Rectangle;
		
		/**
		 * 返回一个新的 IImageFilter 对象，
		 * 它是对原始实例的克隆，包含与原始实例完全相同的副本。
		 * 
		 * @return 新的 IImageFilter 对象。
		 */
		function clone():IImageFilter;
	}
}