package advancedflex.math.number
{
	import advancedflex.errors.NumberFlowError;
	
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	
	public class Int64 implements IExternalizable {
		protected var buf1:uint;
		protected var buf2:uint;
		protected var buf3:uint;
		protected var buf4:uint;
		
		protected static const BUF_MAX_VALUE:uint = 0xFFFF;
		protected static const SIGN_MASK:uint = 1<<31;
		protected static const BUF_MASK:uint = 0xFFFF;
		protected static const BUF4_MASK:uint = 0x7FFF
		public function add(int64:Int64):Int64 {
			var result:Int64 = new Int64();
			var flow:int;
			//buf1
			result.buf1 = buf1 + int64.buf1;
			flow = result.buf1 - BUF_MAX_VALUE;
			if(flow > 0) {//flow
				result.buf1 = BUF_MAX_VALUE;
			}
			//buf2
			result.buf2 = buf2 + int64.buf2 + flow;
			flow = result.buf2 - BUF_MAX_VALUE;
			if(flow > 0) {//flow
				result.buf2 = BUF_MAX_VALUE;
			}
			//buf3
			result.buf3 = buf3 + int64.buf3 + flow;
			flow = result.buf3 - BUF_MAX_VALUE;
			if(flow > 0) {//flow
				result.buf3 = BUF_MAX_VALUE;
			}
			//buf4
			var resultBuf4:uint;
			resultBuf4 = (buf4&BUF4_MASK) + (int64.buf4&BUF4_MASK) + flow;
			flow = result.buf4 - BUF_MAX_VALUE;
			if(flow > 0) {//flow
				throw new NumberFlowError();
			}
			return result;
		}
		public function toString(radix:int = 10):String {
			switch(radix) {
				case 10:
				case 16:
					if(buf4 & SIGN_MASK) {	// -
						return 	"-" + 
								( ~(buf4&BUF4_MASK) ).toString(16) +
						  		( ~buf3 ).toString(16) +
						  		( ~buf2 ).toString(16) +
						  		( ~buf1 ).toString(16);
					} else {				//+
						return 	(buf4&BUF4_MASK).toString(16) +
						  		 buf3.toString(16) +
						  		 buf2.toString(16) +
						  		 buf1.toString(16);
					}
				case 2:
					if(buf4 & SIGN_MASK) {	// -
						return 	"-" + 
								( ~(buf4&BUF4_MASK) ).toString(2) +
						  		( ~buf3 ).toString(2) +
						  		( ~buf2 ).toString(2) +
						  		( ~buf1 ).toString(2);
					} else {				//+
						return 	(buf4&BUF4_MASK).toString(2) +
						  		 buf3.toString(2) +
						  		 buf2.toString(2) +
						  		 buf1.toString(2);
					}
				default:
					throw new ArgumentError("The radix:<" + radix + "> is unsupported in this version.");
			}
		}
		public function writeExternal(output:IDataOutput):void {
			
		}
		public function readExternal(input:IDataInput):void {
		}
	}
}