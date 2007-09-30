package advancedflex.io {
	import flash.utils.ByteArray;
	
	public interface IWriter {
		function get bytesAvailable():int;
		
		function read():int;
		function readChar():String;
		function readBytes(bytes:ByteArray, offset:int = 0, length:int = 0):void;
	}
}