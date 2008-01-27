package advancedflex.math.geom {
	
	public class Matrix2d {
		
		public var m11:Number, m12:Number;
		
		public var m21:Number, m22:Number;
		
		public function Matrix2d(
			m11:Number = 0, m12:Number = 0, 
			m21:Number = 0, m22:Number = 0) 
		{
			this.m11 = m11;
			this.m12 = m12;
			this.m21 = m21;
			this.m22 = m22;
		}
		
		public function addTo(m:Matrix2d):Matrix2d {
			m11 += m.m11;
			m12 += m.m12;
			m21 += m.m21;
			m22 += m.m22;
			return this;
		}
		
		public function add(m1:Matrix2d, m2:Matrix2d):Matrix2d {
			m11 = m1.m11 + m2.m11;
			m12 = m1.m12 + m2.m12;
			m21 = m1.m21 + m2.m21;
			m22 = m1.m22 + m2.m22;
			return this;
		}
		
		public function subTo(m:Matrix2d):Matrix2d {
			m11 -= m.m11;
			m12 -= m.m12;
			m21 -= m.m21;
			m22 -= m.m22;
			return this;
		}
		
		public function sub(m1:Matrix2d, m2:Matrix2d):Matrix2d {
			m11 = m1.m11 - m2.m11;
			m12 = m1.m12 - m2.m12;
			m21 = m1.m21 - m2.m21;
			m22 = m1.m22 - m2.m22;
			return this;
		}
		
		public function scaleTo(n:Number):Matrix2d {
			m11 *= n;
			m12 *= n;
			m21 *= n;
			m22 *= n;
			return this;
		}
		
		public function scale(n:Number, m:Matrix2d):Matrix2d {
			m11 = m.m11*n;
			m12 = m.m12*n;
			m21 = m.m21*n;
			m22 = m.m22*n;
			return this;
		}
		/**
		 * |a b| |e f|
		 * |c d| |g h|
		 */
		public function multTo(m:Matrix2d):Matrix2d {
			var t11:Number = m11*m.m11 + m12*m.m21;
			var t12:Number = m11*m.m12 + m12*m.m22;
			var t21:Number = m21*m.m11 + m22*m.m21;
			var t22:Number = m21*m.m12 + m22*m.m22;
			m11 = t11;
			m12 = t12;
			m21 = t21;
			m22 = t22;
			return this;
		}
		
		public function mult(m1:Matrix2d, m2:Matrix2d):Matrix2d {
			m11 = m1.m11*m2.m11 + m1.m12*m2.m21;
			m12 = m1.m11*m2.m12 + m1.m12*m2.m22;
			m21 = m1.m21*m2.m11 + m1.m22*m2.m21;
			m22 = m1.m21*m2.m12 + m1.m22*m2.m22;
			return this;
		}
	}
}