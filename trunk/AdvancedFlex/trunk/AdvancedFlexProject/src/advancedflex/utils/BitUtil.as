package advancedflex.utils {
	public class BitUtil {
		
		public static function getIndex(bit:uint, index:int):uint {
			return (bit & 1<<index) >> index;
		}
		
		public static  function countTrue(bit:uint, mask:uint = 0xFFFFFFFF):int {
			var result:int = 0;
			for(var i:int = 0; i < 32; i++) {
				if(getIndex(bit, i) && getIndex(mask, i)) {
					result++;
				}
			}
			return result;
		}
		
		public static function countFalse(bit:uint, mask:uint = 0xFFFFFFFF):int {
			return countTrue(~bit, mask);
		}
	}
}