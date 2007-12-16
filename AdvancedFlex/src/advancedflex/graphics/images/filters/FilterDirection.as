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

package advancedflex.graphics.images.filters {
	/**
	 * Filter 的扫描方向。
	 * 方向的值为：
	 * <pre>
	 * ┌─┬─┬─┐
	 * │4│3│2│
	 * ├─┼─┼─┤
	 * │5│ │1│
	 * ├─┼─┼─┤
	 * │6│7│8│
	 * └─┴─┴─┘
	 * </pre>
	 */
	public class FilterDirection {
		
		/**
		 * 右
		 */
		public static const RIGHT		:int = 1;
		/**
		 * 右上
		 */	
		public static const TOP_RIGHT	:int = 2;
		/**
		 * 上
		 */
		public static const TOP			:int = 3;
		/**
		 * 左上
		 */
		public static const TOP_LEFT	:int = 4;
		/**
		 * 左
		 */
		public static const LEFT		:int = 5;
		/**
		 * 左下
		 */
		public static const BOTTOM_LEFT	:int = 6;
		/**
		 * 下
		 */
		public static const BOTTOM		:int = 7;
		/**
		 * 右下
		 */
		public static const BOTTOM_RIGHT:int = 8;

	}
}