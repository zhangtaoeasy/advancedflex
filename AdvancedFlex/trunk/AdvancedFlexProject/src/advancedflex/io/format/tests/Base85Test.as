package advancedflex.io.format.tests {
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.*;
	import flash.utils.ByteArray;
	import advancedflex.utils.ByteArrayUtil;
	import advancedflex.io.format.Base85Encoder;
	import advancedflex.io.format.Base85CharSet;
	import advancedflex.io.format.Base85Decoder;
	import advancedflex.io.format.Base64CharSet;
	import advancedflex.debugger.aut.framework.Assert;
	
	use namespace test;
	public class Base85Test extends TestCase {
		test function test():void {
			var src:String = "alert('123')"
			var bytes:ByteArray = new ByteArray();
			var bytes2:ByteArray = new ByteArray();
			bytes.writeUTFBytes(src);
			bytes2.writeUTFBytes(src);
			out.println(ByteArrayUtil.toHex(bytes));
			bytes.compress();
			out.println(ByteArrayUtil.toHex(bytes));
			var base85:String = Base85Encoder.encodeByteArray(bytes, Base85CharSet.RFC_1924);
			out.println(base85);
			var result:ByteArray = new ByteArray();
			Base85Decoder.decodeByteArray(base85, result, Base85CharSet.DECODE_RFC_1924);
			out.println(ByteArrayUtil.toHex(result));
			Assert.isTrue(ByteArrayUtil.equals(bytes, result);
			result.uncompress();
			out.println(ByteArrayUtil.toHex(bytes2, result));
			
		}
	}
}