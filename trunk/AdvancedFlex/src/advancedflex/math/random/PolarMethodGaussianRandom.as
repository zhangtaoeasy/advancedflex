package advancedflex.math.random {
	public class PolarMethodGaussianRandom extends AbstractRandom {
		
		private var nextNextGaussian:Number;
		
		private var haveNextNextGaussian:Boolean = false;
		
		/**
		 * 用极坐标法(polar method)生成一个呈高斯分布的随机数。
		 * 
		 * <p>这使用了 G. E. P. Box、M. E. Muller 和 G. Marsaglia 的极坐标法 (polar method)，
		 * 该方法在 Donald E. Knuth 的 The Art of Computer Programming, 
		 * Volume 3:Seminumerical Algorithms 的第 3.4.1 节，小节 C，算法 P 中进行了描述。
		 * 注意，它只需调用一次 StrictMath.log 和调用一次 StrictMath.sqrt> 就可以生成两个独立的值。</p>
		 * 
		 * @return 高斯分布的随机数。
		 */
		public override function random():Number {
			if (haveNextNextGaussian) {
				haveNextNextGaussian = false;
		 		return nextNextGaussian;
			} else {
				var v1:Number, v2:Number, s:Number;
				do {
					v1 = 2 * Math.random() - 1;	// between -1.0 and 1.0
					v2 = 2 * Math.random() - 1;	// between -1.0 and 1.0
				 	s = v1 * v1 + v2 * v2;
				} while (s >= 1 || s == 0);
				var multiplier:Number = Math.sqrt(-2 * Math.log(s)/s);
				nextNextGaussian = v2 * multiplier;
				haveNextNextGaussian = true;
				return v1*multiplier;
			}
		}
	}
}