package advancedflex.math.func {
	public final class IntCast {
		public function toShort(n:int):int {
			if(n > 0) {
				return n & 0x80007FFF;
			} else {
				return -(-n & 0x80007FFF);
			}
		}
		public function toByte(n:int):int {
			if(n > 0) {
				return n & 0x8000007F;
			} else {
				return -(-n & 0x8000007F);
			}
		}
	}
}