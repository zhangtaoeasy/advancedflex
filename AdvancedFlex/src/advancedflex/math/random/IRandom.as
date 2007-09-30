package advancedflex.math.random {
	import flash.utils.ByteArray;
	
	/**
	 * 生成各种随机数的接口。
	 * 
	 * <p>注意，这里说的随机数为<strong>伪随机数</strong>。概率分布也为<strong>拟概率分布</strong></p>
	 */
	public interface IRandom {
		
		/**
		 * 生成一个(0.0 ≤ X < 1.0)的随机数。
		 * @return 一个(0.0 ≤ X < 1.0)的随机数。
		 */
		function random():Number;
		
		/**
		 * 生成一个(0 ≤ X < 127)的随机数。
		 * @return 一个(0 ≤ X < 127)的随机数。
		 */
		function getByte():int;
		
		/**
		 * 生成一个(0 ≤ X < 255)的随机数。
		 * @return 一个(0 ≤ X < 255)的随机数。
		 */
		function getUnsignedByte():uint;
		
		/**
		 * 生成一个(0 ≤ X < 32767)的随机数。
		 * @return 一个(0 ≤ X < 32767)的随机数。
		 */
		function getShort():int;
		
		/**
		 * 生成一个(0 ≤ X < 65535)的随机数。
		 * @return 一个(0 ≤ X < 65535)的随机数。
		 */
		function getUnsignedShort():uint;
		
		/**
		 * 生成一个(0 ≤ X < int.MAX_VALUE)的随机数。
		 * @return 一个(0 ≤ X < int.MAX_VALUE)的随机数。
		 */
		function getInt():int;
		
		/**
		 * 生成一个(0 ≤ X < uint.MAX_VALUE)的随机数。
		 * @return 一个(0 ≤ X < uint.MAX_VALUE)的随机数。
		 */
		function getUnsignedInt():uint;
		
		/**
		 * 生成一个 (a ≤ X < b) 的int类型的随机数。
		 * 
		 * @param a 下限
		 * @param b 上限
		 * @return 随机数。
		 */
		function getIntR(a:int, b:int):int;
		
		/**
		 * 生成一个 (a ≤ X < b) 的uint类型的随机数。
		 *
		 * @param a 下限
		 * @param b 上限
		 * @return 随机数。
		 */
		function getUnsignedIntR(a:int, b:int):uint;
		
		/**
		 * 生成一个 (0 ≤ X < Number.MAX_VALUE) 的Number类型的随机数。
		 * @return 随机数。
		 */
		function getDouble():Number;
		
		/**
		 * 生成一个 (a ≤ X < b) 的Number类型的伪随机数。
		 * 
		 * @param a 下限
		 * @param b 上限
		 * @return 随机数。
		 */
		function getDoubleR(a:Number, b:Number):Number;
		
		/**
		 * 生成一个随机 boolean 值。
		 * @return boolean 值。
		 */
		function getBoolean():Boolean;
		
		/**
		 * 生成一个随机 ByteArray。
		 * @param byteArray ByteArray
		 * @param index 起始点
		 * @param length 长度
		 */
		function getBytes(byteArray:ByteArray, index:int = 0, length:int = -1):void;
		
		/**
		 * 生成一个每个字节为(a ≤ X < b)的随机 ByteArray。
		 * @param a 下限，必须(0 ≤ a < 255)
		 * @param b 上限，必须(0 ≤ ba < 255)
		 * @param byteArray ByteArray
		 * @param index 起始点
		 * @param length 长度
		 */
		function getBytesR(a:int, b:int, byteArray:ByteArray, index:int = 0, length:int = -1):void
	}
}