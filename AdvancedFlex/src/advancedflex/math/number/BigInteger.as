package advancedflex.math.number {
	import flash.utils.ByteArray;
	
	public class BigInteger {
		
		/**
		 * The signum of this BigInteger: -1 for negative, 0 for zero, or
		 * 1 for positive.  Note that the BigInteger zero <i>must</i> have
		 * a signum of 0.  This is necessary to ensures that there is exactly one
		 * representation for each BigInteger value.
		 *
		 * @serial
		 */
		 
		protected var signum:int;
		
		/**
		 * The magnitude of this BigInteger, in <i>big-endian</i> order: the
		 * zeroth element of this array is the most-significant int of the
		 * magnitude.  The magnitude must be "minimal" in that the most-significant
		 * int (<tt>mag[0]</tt>) must be non-zero.  This is necessary to
		 * ensure that there is exactly one representation for each BigInteger
		 * value.  Note that this implies that the BigInteger zero has a
		 * zero-length mag array.
		 */
		[ArrayElementType("int")]
		protected var mag:Array;
		
		// These "redundant fields" are initialized with recognizable nonsense
		// values, and cached the first time they are needed (or never, if they
		// aren't needed).
		
			 /**
		 * The bitCount of this BigInteger, as returned by bitCount(), or -1
		 * (either value is acceptable).
		 *
		 * @serial
		 * @see #bitCount
		 */
		private var bitCount:int = -1;
		
		 /**
		 * The bitLength of this BigInteger, as returned by bitLength(), or -1
		 * (either value is acceptable).
		 *
		 * @serial
		 * @see #bitLength
		 */
		private var bitLength:int = -1;
		
		 /**
		 * The lowest set bit of this BigInteger, as returned by getLowestSetBit(),
		 * or -2 (either value is acceptable).
		 *
		 * @serial
		 * @see #getLowestSetBit
		 */
		private var lowestSetBit:int = -2;
		
		/**
		 * The index of the lowest-order byte in the magnitude of this BigInteger
		 * that contains a nonzero byte, or -2 (either value is acceptable).  The
		 * least significant byte has int-number 0, the next byte in order of
		 * increasing significance has byte-number 1, and so forth.
		 */
		private var firstNonzeroByteNum:int = -2;
		
		/**
		 * The index of the lowest-order int in the magnitude of this BigInteger
		 * that contains a nonzero int, or -2 (either value is acceptable).  The
		 * least significant int has int-number 0, the next int in order of
		 * increasing significance has int-number 1, and so forth.
		 */
		private var firstNonzeroIntNum:int = -2;
		
		/**
		 * This mask is used to obtain the value of an int as if it were unsigned.
		 */
		private static const LONG_MASK:uint = 0xffffffff;
		
		
	}
}