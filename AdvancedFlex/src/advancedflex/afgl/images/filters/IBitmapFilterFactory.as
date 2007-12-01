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

package advancedflex.afgl.images.filters {
	
	import flash.filters.BitmapFilter;
	
	/**
	 * IBitmapFilterFactory 类是所有图像滤镜效果工厂的基类。
	 * <p>他可以创建各种 BitmapFilter。</p>
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 */
	public interface IBitmapFilterFactory {
		
		/**
		 * 创建滤镜。
		 * @return 滤镜。
		 */
		function create():BitmapFilter;
		
		/**
		 * 返回 IBitmapFilterFactory 对象，
		 * 它是与原始 IBitmapFilterFactory 对象完全相同的副本。
		 * @return IBitmapFilterFactory 对象。
		 */
		function clone():IBitmapFilterFactory;
		
		/**
		 * 释放滤镜工厂占用的大内存(如果有的话)。
		 * 对 BitmapFilterFactory 调用 dispose() 方法时，
		 * 对此 BitmapFilterFactory 实例的方法或属性的所有后续调用都将失败，并引发异常。
		 */
		function dispose():void;
	}
}