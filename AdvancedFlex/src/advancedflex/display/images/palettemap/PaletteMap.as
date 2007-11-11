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
package advancedflex.display.images.palettemap {
	/**
	 * 调色板映射所需的映射表。
	 */
	public class PaletteMap {
		[ArrayElementType("uint")]
		/**
		* 红色的调色板映射
		*/
		public var redMap:Array;
		
		[ArrayElementType("uint")]
		/**
		* 绿色的调色板映射
		*/
		public var greenMap:Array;
		
		[ArrayElementType("uint")]
		/**
		* 蓝色的调色板映射
		*/
		public var blueMap:Array;
		
		[ArrayElementType("uint")]
		/**
		* alpha的调色板映射
		*/
		public var alphaMap:Array;
		
		/**
		 * 创建一个PaletteMap对象
		 * @param redArray 红色的调色板映射
		 * @param greenArray 绿色的调色板映射
		 * @param blueArray 蓝色的调色板映射
		 * @param alphaArray alpha的调色板映射
		 * @see flash.display.BitmapData#paletteMap
		 */
		public function PaletteMap(
			redArray:Array = null, 
			greenArray:Array = null, 
			blueArray:Array = null, 
			alphaArray:Array = null) 
		{
			reset(redArray, greenArray, blueArray, alphaArray);
		}
		
		protected function reset(
			redArray:Array = null, 
			greenArray:Array = null, 
			blueArray:Array = null, 
			alphaArray:Array = null):void
		{
			redMap = redArray;
			greenMap = greenArray;
			blueMap = blueArray
			alphaMap = alphaArray;
		}
		
		/**
		 * 克隆一个副本。
		 * @return 副本。
		 */
		public function clone():PaletteMap {
			return new PaletteMap(redMap.slice(), greenMap.slice(), blueMap.slice(), alphaMap.slice());
		}
	}
}