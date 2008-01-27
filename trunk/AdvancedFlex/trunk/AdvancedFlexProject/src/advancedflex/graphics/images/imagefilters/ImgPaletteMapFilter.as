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
package advancedflex.graphics.images.imagefilters {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import advancedflex.graphics.images.palettemap.PaletteMap;

	/**
	 * 调色板映射滤镜。
	 * 
	 * @see flash.display.BitmapData#paletteMap
	 */
	public class ImgPaletteMapFilter implements IImageFilter {
		
		/*映射表*/
		private var $paletteMap:PaletteMap;
		
		/**
		 * 映射表。
		 * 
		 * @return 映射表。
		 */
		public function get paletteMap():PaletteMap {
			return $paletteMap;
		}
		
		public function set paletteMap(v:PaletteMap):void {
			if(!v) {
				throw new ArgumentError("paletteMap is null.")
			}
			$paletteMap = v;
		}
		
		/**
		 * 创建一个ImgPaletteMapFilter对象。
		 * 
		 * @param paletteMap 映射表。
		 */
		public function ImgPaletteMapFilter(paletteMap:PaletteMap) {
			this.paletteMap = paletteMap;
		}
		
		/**
		 * 已知 BitmapData 对象、源矩形和滤镜对象，
		 * 确定 apply() 方法调用所影响的目标矩形。
		 * 
		 * @param sourceBitmapData BitmapData 对象。
		 * @param rect 源矩形。
		 * @return 目标矩形。
		 */
		public function generateFilterRect(
			sourceBitmapData:BitmapData, 
			rect:Rectangle = null
			):Rectangle 
		{
			return rect || sourceBitmapData.rect;
		}
		
		/**
		 * 应用滤镜。
		 * 
		 * @param inputBitmapData 输入 BitmapData 对象
		 * @param outputBitmapData 输出 BitmapData 对象
		 * @param sourceRect 输入矩形
		 * @param destPoint 目标图像（当前 BitmapData 实例）中与源矩形的左上角对应的点。
		 */
		public function apply(
			inputBitmapData:BitmapData, 
			outputBitmapData:BitmapData, 
			sourceRect:Rectangle, 
			destPoint:Point
			):void 
		{
			outputBitmapData.paletteMap(
				inputBitmapData, 
				sourceRect, 
				destPoint, 
				$paletteMap.redMap, 
				$paletteMap.greenMap,
				$paletteMap.blueMap,
				$paletteMap.alphaMap
			);
		}
		
		/**
		 * 克隆一个副本。
		 * 
		 * @return 副本。
		 */
		public function clone():IImageFilter {
			return new ImgPaletteMapFilter($paletteMap.clone());
		}
		
	}
}