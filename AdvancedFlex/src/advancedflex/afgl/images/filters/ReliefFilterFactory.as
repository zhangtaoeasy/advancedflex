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
	
	import flash.errors.IllegalOperationError;
	import flash.filters.BitmapFilter;
	import flash.filters.ConvolutionFilter;

	/**
	 * 浮雕滤镜工厂。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 * @see advancedflex.display.images.filtersFilterDirection
	 */
	public class ReliefFilterFactory implements IBitmapFilterFactory {
		
		/* Relief Direction */
		private var $dirction:int;
		
		/* Relief Level*/
		private var $level:Number;
		
		/**
		 * 要添加到浮雕的偏差。
		 */
		public var bias:int;
		
		/* Matrix 3x3 */
		[ArrayElementType("Number")]
		private var $matrix:Array;
		
		/* If this instance doesn't disposed. */
		private var $alive:Boolean = true;
		
		/* If this instance changed. */
		private var $changed:Boolean = true;
		
		/**
		 * 浮雕的方向。
		 */
		public function get direction():int {
			return $dirction;
		}
		
		public function set direction(v:int):void {
			if($dirction>=1 && $dirction <=8) {
				$dirction = v;
				$changed = true;
			}else{
				throw new ArgumentError(
					"Param:<direction> must between 1 and 8");
			}
		}
		
		/**
		 * 浮雕的强度。
		 */
		public function get level():Number {
			return $level;
		}
		
		public function set level(v:Number):void {
				$level = v;
				$changed = true;
		}
		
		/**
		 * 创建一个 ReliefFilterFactory 类。
		 * @param direction 浮雕的方向。
		 * @param level 浮雕的强度。
		 * @param bias 要添加到浮雕的偏差。
		 * @see advancedflex.display.images.filtersFilterDirection
		 */
		public function ReliefFilterFactory(
			direction:int, 
			level = 1, 
			bias:int = 128) 
		{
			$dirction = direction;
			$level =level;
			this.bias = bias;
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
				return new ConvolutionFilter(3, 3, $matrix, 1, bias);
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
		 * 返回 ReliefFilterFactory 对象，
		 * 它是与原始 ReliefFilterFactory 对象完全相同的副本。
		 * @return ReliefFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new ReliefFilterFactory($dirction, $level, bias);
		}
		
		/* Set up Matrix */
		private function $setUpMatrix():void {
			switch ($direction) {
				case FilterDirection.RIGHT :
					$matrix = [
						-n, 0, n,
						-n, 0, n, 
						-n, 0, n,
					];
				break;
				case FilterDirection.TOP_RIGHT :
					$matrix = [
						 0, n, n, 
						-n, 0, n, 
						-n,-n, 0,
					];
				break;
				case FilterDirection.TOP :
					$matrix = [
						 n, n, n, 
						 0, 0, 0, 
						-n,-n,-n,
					];
				break;
				case FilterDirection.TOP_LEFT :
					$matrix = [
						n, n, 0, 
						n, 0,-n, 
						0,-n,-n,
					];
				break;
				case FilterDirection.LEFT :
					$matrix = [
						n, 0,-n, 
						n, 0,-n, 
						n, 0,-n
					];
				break;
				case FilterDirection.BOTTOM_LEFT :
					$matrix = [
						0,-n,-n, 
						n, 0,-n, 
						n, n, 0,
					];
				break;
				case FilterDirection.BOTTOM :
					$matrix = [
						-n,-n,-n, 
						 0, 0, 0, 
						 n, n, n,
					];
				break;
				default://FilterDirection.BOTTOM_RIGHT
					$matrix = [
						-n,-n, 0, 
						-n, 0, n, 
						 0, n, n,
					];
				break;
			}
		}
	}
}