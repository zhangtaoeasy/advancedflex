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
	 * 颜色反转工厂。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 */
	public class ReversesFilterFactory implements IBitmapFilterFactory {
		
		/* The Reverses Matrix */
		private static const $MATRIX:Array = [
			-1, 0, 0, 0, 255,
			 0,-1, 0, 0, 255,
			 0, 0,-1, 0, 255,
			 0, 0, 0, 1, 0,
		];
		
		/**
		 * 创建滤镜。
		 * @return 滤镜。
		 */
		public function create():BitmapFilter {
			return new ColorMatrixFilter($MATRIX);
		}
		
		/**
		 * 释放滤镜工厂占用的大内存，但实际上什么也不做。
		 * 调用后在调用其他方法时也不会发成错误。
		 */
		public function dispose():void {
			//Do Nothing.
		}
		
		/**
		 * 返回 ReversesFilterFactory 对象，
		 * 它是与原始 ReversesFilterFactory 对象完全相同的副本。
		 * @return ReversesFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new ReversesFilterFactory();
		}
		
	}
}