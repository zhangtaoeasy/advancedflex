package advancedflex.math.func {
	public final class IntCast {
		
		/**
		 * 把32位整数转换为16为整数。
		 * 
		 * @param n 32位整数
		 * @return 16为整数
		 */
		public function toShort(n:int):int {
			if(n > 0) {
				return n & 0x80007FFF;
			} else {
				return -(-n & 0x80007FFF);
			}
		}
		
		/**
		 * 把32位整数转换为8为整数。
		 * 
		 * @param n 32位整数
		 * @return 8为整数
		 */
		public function toByte(n:int):int {
			if(n > 0) {
				return n & 0x8000007F;
			} else {
				return -(-n & 0x8000007F);
			}
		}
	}
}