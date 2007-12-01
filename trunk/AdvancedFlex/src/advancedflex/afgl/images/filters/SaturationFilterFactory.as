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
	import flash.errors.IllegalOperationError;

	/**
	 * 彩度滤镜工厂。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 */
	public class SaturationFilterFactory implements IBitmapFilterFactory {
		
		/* Red Identity */
		private static const $redIdentity:Array	= 	[1, 0, 0, 0, 0];
		
		/* Green Identity */
		private static const $greenIdentity:Array = [0, 1, 0, 0, 0];
		
		/* Blue Identity */
		private static const $blueIdentity:Array = 	[0, 0, 1, 0, 0];
		
		/* Alpha Identity */
		private static const $alphaIdentity:Array = [0, 0, 0, 1, 0];
		
		/* grayluma */
		private static const $grayluma:Array = 	[0.3, 0.59, 0.11, 0, 0];
		
		/* Saturation Amount */
		private var $amount:Number;
		
		/* Color Matrix */
		[ArrayElementType("Number")]
		private var $matrix:Array;
		
		/* If it isn't disposed. */
		private var $alive:Boolean = true;
		
		/* If param is changed. */
		private var $changed:Boolean = true;
		
		/**
		 * 创建一个 SaturationFilterFactory
		 * @param amount 彩度。0 表示无彩色；1 为原图；2 为高彩色。
		 */
		public function SaturationFilterFactory(amount:Number) {
			$amount = amount;
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
				return new ColorMatrixFilter($matrix);
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
		 * 返回 SaturationFilterFactory 对象，
		 * 它是与原始 SaturationFilterFactory 对象完全相同的副本。
		 * @return SaturationFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new SaturationFilterFactory($amount);
		}
		
		/* Set up Matrix */
		private function $setUpMatrix():void {
			var colmatrix:Array;
			colmatrix = 
				$interpolateArrays($grayluma, $redIdentity, $amount).concat(
					$interpolateArrays($grayluma, $greenIdentity, $amount),
					$interpolateArrays($grayluma, $blueIdentity,  $amount),
					$alphaIdentity
				);
			$matrix = colmatrix;
		}
		
		/* Interpolate Arrays */
		private static function $interpolateArrays(
			ary1:Array, 
			ary2:Array, 
			t:Number):Array 
		{
			var result:Array = 
				(ary1.length >= ary2.length) ? ary1.slice() : ary2.slice();
			var i:int = result.length;
			while (i--) {
				result[i] = ary1[i] + (ary2[i] - ary1[i]) * t;
			}
			return result;
		}
	}
}