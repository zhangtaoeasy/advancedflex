package advancedflex.utils {
	import flash.utils.*;
	
	use namespace flash_proxy;

	public class BitVector extends Proxy {
		protected var _buf:Array;
		protected var _length:int;
		public function BitVector(arg:*) {
			super();
			if(!arg) {
				_length = 0;
				_buf = new Array();
			}else if(arg is Number) {
				_length = length;
				_buf = new Array( (length>>4)+1 );
			}else if(FloatArrayUtil.isFloatArray(arg)) {
				_length = arg.length*32;
				_buf = arg.slice();
			}else{
				throw new ArgumentError("Param:<arg> is not a correct Array.");
			}
		}
		flash_proxy override function getProperty(name:*):* {
			return at(name);
		}
		flash_proxy override function setProperty(name:*,value:*):void {
			if(value) {
				setTrue(name);
			}else{
				setFalse(name);
			}
		}
		public final function at(index:int):int {
			var mask:int = (index%32);
			return ( _buf[index>>4] & (1<<mask) )>>mask;
		}
		public final function setTrue(index:int):void {
			_buf[index>>4] |= 1 << (index%32);
		}
		public final function setFalse(index:int):void {
			_buf[index>>4] &= ~(1 << (index%32));
		}
		public function writeToStream(stream:IDataOutput, start:int = 0, end:int = -1):void {
			if(!stream) {
				throw new ArgumentError("Param:<stream> must not be null.");
			}
			//TODO
		}
	}
}