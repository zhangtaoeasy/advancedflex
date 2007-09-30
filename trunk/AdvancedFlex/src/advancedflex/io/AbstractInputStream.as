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
	import flash.errors.IllegalOperationError;
	import flash.errors.IOError;

	/**
	 * AbstractInputStream为<strong>AFIO(Advanced Flex I/O)</strong>框架的一部分，
	 * 包含其他一些输入流，它将这些流用作其基本数据源，它可以直接传输数据或提供一些额外的功能。
	 * AbstractInputStream 类本身只是简单地重写那些将所有请求传递给所包含输入流的 InputStream 的所有方法。
	 * AbstractInputStream 的子类可进一步重写这些方法中的一些方法，并且还可以提供一些额外的方法和字段。
	 */
	public class AbstractInputStream implements InputStream {
		
		protected var input:IDataInput;
		
		public function AbstractInputStream(input:IDataInput) {
			this.input = input;
		}
		
		public function get objectEncoding():uint {
			return input.objectEncoding;
		}
		
		public function set objectEncoding(version:uint):void {
			input.objectEncoding = version;
		}
		
		public function readByte():int {
			return input.readByte();
		}
		
		public function readDouble():Number {
			return input.readDouble();
		}
		
		public function readUnsignedShort():uint {
			return input.readUnsignedShort();
		}
		
		public function readObject():* {
			return input.readObject();
		}
		
		public function readShort():int {
			return input.readShort();
		}
		
		public function readUTF():String {
			return input.readUTF();
		}
		
		public function readMultiByte(length:uint, charSet:String):String {
			return input.readMultiByte(length, charSet);;
		}
		
		public function readBytes(bytes:ByteArray, offset:uint=0.0, length:uint=0.0):void {
			input.readBytes(bytes, offset, length);
		}
		
		public function readUTFBytes(length:uint):String {
			return input.readUTFBytes(length);
		}
		
		public function readUnsignedByte():uint {
			return input.readUnsignedByte();
		}
		
		public function readInt():int {
			return input.readInt();
		}
		
		public function readBoolean():Boolean {
			return input.readBoolean();
		}
		
		public function get bytesAvailable():uint {
			return input.bytesAvailable;
		}
		
		public function get endian():String {
			return input.endian;
		}
		
		public function set endian(type:String):void {
			input.endian = type;
		}
		
		public function readFloat():Number {
			return input.readFloat();
		}
		
		public function readUnsignedInt():uint {
			return input.readUnsignedInt();
		}
		
		/**
		 * 读直到出现等于结束标记的值。
		 * <p>如果(vlue & mask == sign & mask)的话结束(value为读入的bytes)</p>
		 * 
		 * @param bytes 要将数据读入的 ByteArray 对象。
		 * @param sign 结束标记
		 * @param mask 指定用于比较的mask。
		 */
		public function readUntil(bytes:ByteArray, sign:uint, mask:uint = 0x000000FF):void {
			
		}
		
		/**
		 * 试图在输入流中跳过数据的 n 个字节，并丢弃跳过的字节。
		 * 
		 * @param bytes 要跳过的字节数。
		 * @throws flash.error.EOError 当跳过了末尾。
		 */
		public function skip(bytes:int):void {
			input.readBytes(new ByteArray, 0, bytes);
		}
		
		/**
		 * 标记流中的当前位置。对 reset() 的后续调用将尝试将该流重新定位到此点。并不是所有的字符输入流都支持 mark() 操作。
		 * @param readAheadLimit 在仍保留该标记的情况下，对可读取字符数量的限制。
		 * 在读取这样多的字符后，尝试重置流可能会失败。-1为无限，但不能保证一定能reset()。
		 * @throws flash.errors.IOError 如果尚未标记流，或者该标记已失效，或者该流不支持 reset()，或者发生一些其他 I/O 错误
		 */
		public function mark(readAheadLimit:int = -1):void {
			throw new IOError("Unsupported method calling.");
		}
		
		/**
		 * 重置该流。
		 * 
		 * <p>如果已标记该流，则尝试在该标记处重新定位该流。
		 * 如果已标记该流，则以适用于特定流的某种方式尝试重置该流，例如，通过将该流重新定位到其起始点。
		 * 并不是所有的字符输入流都支持 reset() 操作，有些支持 reset() 而不支持 mark()。</p>
		 * @throws flash.errors.IOError 如果尚未标记流，或者该标记已失效，或者该流不支持 reset()，或者发生一些其他 I/O 错误
		 */
		public function reset():void {
			throw new IOError("Unsupported method calling.");
		}
		
		/**
		 * 判断此流是否支持 mark() 操作。
		 * @defaultValue false
		 * @return 当且仅当此流支持此 mark 操作时，返回 true。
		 */
		public function get markSupport():Boolean {
			return false;
		}
		
		/**
		 * 判断此流是否支持 reset() 操作。
		 * @defaultValue false
		 * @return 当且仅当此流支持此 reset 操作时，返回 true。
		 */
		public function get resetSupport():Boolean {
			return false;
		}
		
		/**
		 * 关闭该流并释放与之关联的所有资源。关闭以前关闭的流无效。
		 * @throws flash.errors.IOError 无法关闭，或者未打开。
		 */
		public function close():void {
			try{
				input["close"]();
			}catch(e:Error) {
				throw new IOError(e.message);
			}
		}
	}
}