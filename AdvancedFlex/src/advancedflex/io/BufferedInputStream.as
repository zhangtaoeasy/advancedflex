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
package advancedflex.io {
	import flash.utils.IDataInput;
	import flash.utils.ByteArray;
	import flash.errors.IOError;

	/**
	 * BufferedInputStream 为<strong>AFIO(Advanced Flex I/O)</strong>框架的一部分，
	 * 为另一个输入流添加一些功能，即缓冲输入以及支持 mark 和 reset 方法的能力。
	 * 在创建 BufferedInputStream 时，会创建一个内部缓冲区数组。
	 * 在读取或跳过流中的字节时，可根据需要从包含的输入流再次填充该内部缓冲区，一次填充多个字节。
	 * mark 操作记录输入流中的某个点，reset 操作使得在从包含的输入流中获取新字节之前，
	 * 再次读取自最后一次 mark 操作后读取的所有字节。
	 */
	public class BufferedInputStream extends AbstractInputStream {
		
		/**
		 * 缓存的大小
		 */
		protected var bufSize:int;
		
		/**
		 * 输入源。
		 * <strong>注意：</strong>input为真正的缓存。
		 */
		protected var src:ByteArray;//buf is input
		//input:ByteArray
		
		/**
		* mark的位置。-1为未设mark。
		*/
		protected var markPos:int = -1;
		
		/**
		* 缓存是否填满。
		*/
		protected var isFull:Boolean;
		
		/**
		* 最小可活动的缓存大小。
		*/
		protected var minbytesAvailable:int;
		
		/**
		* 是否流已经关闭。
		*/
		protected var closed:Boolean = false;
		
		public function BufferedInputStream(input:IDataInput, bufferSize:int = 8192, minbytesAvailable:int = 6144) {
			super(new ByteArray());
			src = input;
			bufSize = bufferSize;
			this.minbytesAvailable = minbytesAvailable;
		}
		protected function setUpBuffer():void {
			if(input.bytesAvailable < minbytesAvailable) {
				if(src.bytesAvailable) {
					if(src.bytesAvailable > (bufSize - input.bytesAvailable)) {
						var tmp:ByteArray = new ByteArray();
						var buf:ByteArray = input as ByteArray
						tmp.writeBytes(buf, buf.position, buf.bytesAvailable);
						//todo
					}
				}
			}
		}
		public override function close():void {
			try {
				super.close();
			}catch(e:IOError) {
				
			}
			(input as ByteArray).position = 0;
			(input as ByteArray).length = 0;
			input = null;
			closed = true;
		}
	}
}