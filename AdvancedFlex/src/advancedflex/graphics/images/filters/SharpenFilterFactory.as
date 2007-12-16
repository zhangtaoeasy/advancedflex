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
	
	import flash.filters.BitmapFilter;
	import flash.filters.ConvolutionFilter;
	import flash.errors.IllegalOperationError;

	/**
	 * 锐化滤镜工厂。
	 * @author WeiHe
	 * 
	 */
	public class SharpenFilterFactory implements IBitmapFilterFactory {
		
		/* Sharpen Level */
		private var $level:Number;
		
		/**
		 * 锐化强度。
		 */
		public function get level():Number {
			return $level;
		}
		
		public function set level(v:Number):void {
			if(level<0) {
				throw new ArgumentError("Level must > 0.");
			}
			$level = v;
			$changed = true;
		}
		
		/* Matrix 3x3 */
		[ArrayElementType("Number")]
		private var $matrix:Array;
		
		/* If this instance doesn't disposed. */
		private var $alive:Boolean = true;
		
		/* If this instance changed. */
		private var $changed:Boolean = true;
		
		/**
		 * 创建一个 SharpenFilterFactory。
		 * @param level 锐化强度。
		 */
		public function SharpenFilterFactory(level:Number) {
			if(level<0) {
				throw new ArgumentError("Level must > 0.");
			}
			$level = level;
		}
		
		/**
		 * 创建滤镜。
		 * @return 滤镜。
		 */
		public function create():BitmapFilter {
			if($alive) {
				if($changed) {
					$setUpMatrix();
				}
				return new ConvolutionFilter(3, 3, $matrix, 1);
			}
			throw new IllegalOperationError("This FilterFactory is disposed.");
		}
		
		/**
		 * 释放滤镜工厂占用的大内存。
		 * 对 ReliefFilterFactory 调用 dispose() 方法时，
		 * 对此 ReliefFilterFactory 实例的方法或属性的所有后续调用都将失败，并引发异常。
		 */
		public function dispose():void {
			$matrix = null;
			$alive = false;
		}
		
		/**
		 * 返回 SharpenFilterFactory 对象，
		 * 它是与原始 SharpenFilterFactory 对象完全相同的副本。
		 * @return SharpenFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new SharpenFilterFactory($level);
		}
		/* Set up Matrix */
		private function $setUpMatrix():void {
			var a:Number = -$level / 100;
			var b:Number = a * (-8) + 1;
			$matrix = [
				a, a, a, 
				a, b, a, 
				a, a, a,
			];
		}
	}
}