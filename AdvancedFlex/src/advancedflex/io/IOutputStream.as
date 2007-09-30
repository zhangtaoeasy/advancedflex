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
	import flash.utils.IDataOutput;

	/**
	 * OutputStream 接口是扩展的IDataOutput，为<strong>AFIO(Advanced Flex I/O)</strong>框架的一部分，
	 * 用于将数据从任意基本类型转换为一系列字节，并将这些字节写入二进制流。
	 * 对于此接口中写入字节的所有方法，如果由于某种原因无法写入某个字节，则抛出 IOError。 
	 */
	public interface IOutputStream extends IDataOutput {
		
		/**
		 * 关闭此输出流并释放与此流有关的所有系统资源。
		 * @throws flash.errors.IOError 如果发生 I/O 错误。
		 */
		function close():void;
		
		/**
		 * 刷新此输出流，并强制将所有已缓冲的输出字节写入该流中。
		 * @throws flash.errors.IOError 如果发生 I/O 错误。
		 */
		function flush():void;
	}
}