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
	
	import flash.display.BitmapDataChannel;
	import flash.errors.IllegalOperationError;
	import flash.filters.BitmapFilter;
	import flash.filters.ColorMatrixFilter;

	/**
	 * 改变颜色通道的滤镜工厂。
	 * 比如它可以把 红色通道变为蓝色通道。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 * @sample 
	 * var chf:ChannelChangeFilterFactory = 
	 * 	new ChannelChangeFilterFactory(4);
	 * my_mc.filters = [chf.create()];
	 */
	public class ChannelChangeFilterFactory implements IBitmapFilterFactory {
		
		/*Matrix*/
		[ArrayElementType("int")]
		private var $matrix:Array;
		
		/*Red Channel*/
		private var $redCh:uint;
		/*Green Channel*/
		private var $greenCh:uint;
		/*Blue Channel*/
		private var $blueCh:uint;
		/*Alpha Channel*/
		private var $alphaCh:uint;
		
		/**
		 * 红色通道。
		 * @return 红色通道。
		 */
		public function get redChannel():uint {
			return $redCh;
		}
		
		public function set redChannel(v:uint):void {
			$redCh = v & 0xF;
			$matrix[0] = $redCh & BitmapDataChannel.RED   ? 1 : 0;
			$matrix[1] = $redCh & BitmapDataChannel.GREEN ? 1 : 0;
			$matrix[2] = $redCh & BitmapDataChannel.BLUE  ? 1 : 0;
			$matrix[3] = $redCh & BitmapDataChannel.ALPHA ? 1 : 0;
		}
		
		/**
		 * 绿色通道。
		 * @return 绿色通道。
		 */
		public function get greenChannel():uint {
			return $greenCh;
		}
		
		public function set greenChannel(v:uint):void {
			$redCh = v & 0xF;
			$matrix[5] = $greenCh & BitmapDataChannel.RED   ? 1 : 0;
			$matrix[6] = $greenCh & BitmapDataChannel.GREEN ? 1 : 0;
			$matrix[7] = $greenCh & BitmapDataChannel.BLUE  ? 1 : 0;
			$matrix[8] = $greenCh & BitmapDataChannel.ALPHA ? 1 : 0;
		}
		
		/**
		 * 蓝色通道。
		 * @return 蓝色通道。
		 * 
		 */
		public function get blueChannel():uint {
			return $blueCh;
		}
		
		public function set blueChannel(v:uint):void {
			$blueCh = v & 0xF;
			$matrix[10] = $blueCh & BitmapDataChannel.RED   ? 1 : 0;
			$matrix[11] = $blueCh & BitmapDataChannel.GREEN ? 1 : 0;
			$matrix[12] = $blueCh & BitmapDataChannel.BLUE  ? 1 : 0;
			$matrix[13] = $blueCh & BitmapDataChannel.ALPHA ? 1 : 0;
		}
		
		/**
		 * alpha 通道。
		 * @return alpha 通道。
		 * 
		 */
		public function get alphaChannel():uint {
			return $alphaCh;
		}
		
		public function set alphaChannel(v:uint):void {
			$alphaCh = v & 0xF;
			$matrix[15] = $alphaCh & BitmapDataChannel.RED   ? 1 : 0;
			$matrix[16] = $alphaCh & BitmapDataChannel.GREEN ? 1 : 0;
			$matrix[17] = $alphaCh & BitmapDataChannel.BLUE  ? 1 : 0;
			$matrix[18] = $alphaCh & BitmapDataChannel.ALPHA ? 1 : 0;
		}
		
		/**
		 * 创建一个 ChannelChangeFilterFactory 实例。
		 * @param redChannel 红色通道的值。
		 * @param greenChannel 绿色通道的值。
		 * @param blueChannel 蓝色通道的值。
		 * @param alphaChannel alpha 通道的值。
		 * @see flash.display.BitmapDataChannel
		 */
		public function ChannelChangeFilterFactory(
			redChannel:uint = 1, 
			greenChannel:uint = 2, 
			blueChannel:uint = 4, 
			alphaChannel:uint = 8) 
		{
			$matrix = [
				0, 0, 0, 0, 0,//0  1  2  3  4
				0, 0, 0, 0, 0,//5  6  7  8  9
				0, 0, 0, 0, 0,//10 11 12 13 14
				0, 0, 0, 0, 0,//15 16 17 18 19
			];
			this.redChannel = redChannel;
			this.greenChannel = greenChannel;
			this.blueChannel = blueChannel;
			this.alphaChannel = alphaChannel;
		}
		
		/**
		 * 创建滤镜。
		 * @return 滤镜。
		 */
		public function create():BitmapFilter {
			return new ColorMatrixFilter($matrix);
		}
		
		/**
		 * 释放滤镜工厂占用的大内存，但实际上什么也不做。
		 * 调用后在调用其他方法时也不会发成错误。
		 */
		public function dispose():void {
			//Do Nothing.
		}
		
		/**
		 * 返回 IBitmapFilterFactory 对象，
		 * 它是与原始 IBitmapFilterFactory 对象完全相同的副本。
		 * @return IBitmapFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new ChannelChangeFilterFactory(
				$redCh, 
				$greenCh, 
				$blueCh, 
				$alphaCh
			);
		}
		
	}
}