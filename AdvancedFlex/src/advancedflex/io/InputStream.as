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

	/**
	 * InputStream 接口是扩展的IDataInput，为<strong>AFIO(Advanced Flex I/O)</strong>框架的一部分，
	 * 用于从二进制流中读取字节。
	 * 对于此接口中的所有数据读取例程来说，如果在读取所需字节数之前已经到达文件末尾 (end of file)，则将抛出 EOFError。
	 * 如果因为到达文件末尾以外的其他原因无法读取字节，则将抛出 IOError 而不是 EOFError。
	 * 尤其是，在输入流已关闭的情况下，将抛出 IOEError。 
	 */
	public interface InputStream extends IDataInput {
		
		/**
		 * 读直到出现等于结束标记的值。
		 * <p>如果(vlue & mask == sign & mask)的话结束(value为读入的bytes)</p>
		 * 
		 * @param bytes 要将数据读入的 ByteArray 对象。
		 * @param sign 结束标记
		 * @param mask 指定用于比较的mask。
		 */
		function readUntil(bytes:ByteArray, sign:uint, mask:uint = 0x000000FF):void;
		
		/**
		 * 试图在输入流中跳过数据的 n 个字节，并丢弃跳过的字节。
		 * 
		 * @param bytes 要跳过的字节数。
		 * @throws flash.error.EOError 当跳过了末尾。
		 */
		function skip(bytes:int):void;
		
		/**
		 * 标记流中的当前位置。对 reset() 的后续调用将尝试将该流重新定位到此点。并不是所有的字符输入流都支持 mark() 操作。
		 * @param readAheadLimit 在仍保留该标记的情况下，对可读取字符数量的限制。
		 * 在读取这样多的字符后，尝试重置流可能会失败。-1为无限，但不能保证一定能reset()。
		 * @throws flash.errors.IOError 如果尚未标记流，或者该标记已失效，或者该流不支持 reset()，或者发生一些其他 I/O 错误
		 */
		function mark(readAheadLimit:int = -1):void;
		
		/**
		 * 重置该流。
		 * 
		 * <p>如果已标记该流，则尝试在该标记处重新定位该流。
		 * 如果已标记该流，则以适用于特定流的某种方式尝试重置该流，例如，通过将该流重新定位到其起始点。
		 * 并不是所有的字符输入流都支持 reset() 操作，有些支持 reset() 而不支持 mark()。</p>
		 * @throws flash.errors.IOError 如果尚未标记流，或者该标记已失效，或者该流不支持 reset()，或者发生一些其他 I/O 错误
		 */
		function reset():void;
		
		/**
		 * 判断此流是否支持 mark() 操作。
		 * @defaultValue false
		 * @return 当且仅当此流支持此 mark 操作时，返回 true。
		 */
		function get markSupport():Boolean;
		/**
		 * 判断此流是否支持 reset() 操作。
		 * @defaultValue false
		 * @return 当且仅当此流支持此 reset 操作时，返回 true。
		 */
		function get resetSupport():Boolean;
		/**
		 * 关闭该流并释放与之关联的所有资源。关闭以前关闭的流无效。
		 * @throws flash.errors.IOError 无法关闭，或者未打开。
		 */
		function close():void;
	}
}