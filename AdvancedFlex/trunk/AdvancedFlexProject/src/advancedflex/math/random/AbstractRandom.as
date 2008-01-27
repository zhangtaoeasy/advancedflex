package advancedflex.math.random {
	import flash.utils.ByteArray;
	import advancedflex.errors.AbstractMethodError;
	import flash.utils.getQualifiedClassName;

	public class AbstractRandom implements IRandom {
		public function getInt():int {
			return int(random() * int.MAX_VALUE);
		}
		
		public function getDoubleR(a:Number, b:Number):Number {
			return a + random() * (b-a);
		}
		
		public function random():Number {
			throw new AbstractMethodError("This class:<" + getQualifiedClassName(this) + "> is Abstract Class.");
		}
		
		public function getBytesR(a:int, b:int, byteArray:ByteArray, index:int=0, length:int = -1):void {
			if(index < 0 || index >= byteArray.length) {
				throw new RangeError("index is out of Range.")
			}
			length = length == -1 ? byteArray.length - index + 1 : length;
			for(var i:int = index; i<length; i++) {
				byteArray[i] = getIntR(a, b);
			}
		}
		
		public function getUnsignedShort():uint {
			return uint(random() * 65535);
		}
		
		public function getDouble():Number {
			return random() * Number.MAX_VALUE;
		}
		
		public function getBytes(byteArray:ByteArray, index:int=0, length:int = -1):void {
			if(index < 0 || index >= byteArray.length) {
				throw new RangeError("index is out of Range.")
			}
			length = length == -1 ? byteArray.length - index + 1 : length;
			for(var i:int = index; i<length; i++) {
				byteArray[i] = getUnsignedByte();
			}
		}
		
		public function getUnsignedIntR(a:int, b:int):uint {
			return uint(random() * uint.MAX_VALUE);
		}
		
		public function getIntR(a:int, b:int):int {
			return a + int(random() * (b-a));
		}
		
		public function getBoolean():Boolean {
			return random() < 0.50;
		}
		
		public function getUnsignedByte():uint
		{
			return uint(random() * 255);
		}
		
		public function getShort():int {
			return int(random() * 32767);
		}
		
		public function getUnsignedInt():uint {
			return uint(random() * 65535);
		}
		
		public function getByte():int {
			return int(random() * 127);
		}
		
	}
}