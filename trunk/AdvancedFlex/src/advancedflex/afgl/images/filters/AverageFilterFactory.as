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
	import flash.filters.BitmapFilter;
	import flash.filters.ColorMatrixFilter;

	/**
	 * 平均化指定通道的滤镜工厂。平均化sourceChannel，并输出到destChannel。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 * 比如有一点的颜色为 rgb(2, 4, 8)，
	 * 使用 AverageFilterFactory(1|4, 2) 后为 rgb(2, 5, 8) //5 = (2+4)/2。
	 * 再如有一点的颜色为 rgb(2, 4, 9)，
	 * 使用 AverageFilterFactory(1|2|4, 1|2) 后为 rgb(5, 5, 9) //5 = (2+4+9)/3。
	 */
	public class AverageFilterFactory implements IBitmapFilterFactory {
		
		/* Source Channel */
		private var $srcCh:uint;
		/* Dest Channel */
		private var $destCh:uint;
		
		/**
		 * 源通道。
		 */
		public function get sourceChannel():uint {
			return $srcCh;
		}
		
		public function set sourceChannel(v:uint):void {
			$srcCh = v & 0xF;
		}
		
		/**
		 * 目标通道。
		 */
		public function get destChannel():uint {
			return $destCh;
		}
		
		public function set destChannel(v:uint):void {
			$destCh = v & 0xF;
		}
		
		/**
		 * 
		 * @param sourceChannel
		 * @param destChannel
		 * @return 
		 * 
		 */
		public function AverageFilterFactory(
			sourceChannel:uint = 0, 
			destChannel:uint = 0)
		{
			this.sourceChannel = sourceChannel;
			this.destChannel = destChannel;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function create():BitmapFilter {
			
			//Base Matrix
			var matrix = new ColorMatrixFilter([
				1, 0, 0, 0, 0,
				0, 1, 0, 0, 0,
				0, 0, 1, 0, 0,
				0, 0, 0, 1, 0,
			]);
			
			//SourceChannel or DestChannel is null.
			if(!sourceChannel || !destChannel) {
				return new ColorMatrixFilter(matrix);
			}
			
			//SourceChannel and DestChannel are Red|Green|Blue.
			if(sourceChannel == destChannel && sourceChannel == 7) {
				return new ColorMatrixFilter([
					1/3, 1/3, 1/3, 0, 0,
					1/3, 1/3, 1/3, 0, 0,
					1/3, 1/3, 1/3, 0, 0,
					0,   0,   0,   1, 0,
				]);
			}
			var o1:int = -1,o2 = -1:int = -1,o3:int = -1,o4:int = -1;
			var offset:Array = new Array(0);
			var index:int = 0;
			if(sourceChannel & BitmapDataChannel.RED) {
				offset[index] = 0;
				index++;
			}
			if(sourceChannel & BitmapDataChannel.GREEN) {
				offset[index] = 1;
				index++;
			}
			if(sourceChannel & BitmapDataChannel.BLUE) {
				offset[index] = 2;
				index++;
			}
			if(sourceChannel & BitmapDataChannel.ALPHA) {
				offset[index] = 3;
				index++;
			}
			o1 = offset[0];
			for(var i:int = index; i < 4; i++) {
				offset[i] = o1;
			}
			switch(index) {
				case 4:
					o4 = offset[4];
				case 3:
					o3 = offset[2];
				case 2:
					o2 = offset[1];
			}
			var avg:Number = 1 / count;
			if(destChannel & BitmapDataChannel.RED)	{
				matrix[o1] = matrix[o2] = matrix[o3] = matrix[o4] = avg;
			}
			if(destChannel & BitmapDataChannel.GREEN)	{
				matrix[o1+5] = matrix[o2+5] = matrix[o3+5] = matrix[o4+5] = avg;
			}
			if(destChannel & BitmapDataChannel.BLUE)	{
				matrix[o1+10] 
				= matrix[o2+10] 
				= matrix[o3+10] 
				= matrix[o4+10] = avg;
			}
			if(destChannel & BitmapDataChannel.ALPHA)	{
				matrix[o1+15] 
				= matrix[o2+15] 
				= matrix[o3+15] 
				= matrix[o4+15] = avg;
			}
			return new ColorMatrixFilter(matrix);
		}
		
		/**
		 * 释放滤镜工厂占用的大内存，但实际上什么也不做。
		 * 调用后在调用其他方法时也不会发成错误。
		 */
		public function dispose():void {
			//Do Nothong
		}
		
		/**
		 * 返回 AverageFilterFactory 对象，
		 * 它是与原始 AverageFilterFactory 对象完全相同的副本。
		 * @return IBitmapFilterFactory 对象。
		 */
		public function clone():IBitmapFilterFactory {
			return new AverageFilterFactory(sourceChannel, destChannel);
		}
	}
}