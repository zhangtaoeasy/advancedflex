package advancedflex.math.geom {
	
	/**
	 * 矩阵。
	 * 注意，以下均设 this 为 <strong>A</strong>，参数里的矩阵为 <strong>B， C， D ...</strong>。
	 */
	public interface IMatrix {
		
		/**
		 * 矩阵的加法，会返回新的对象。(A + B)
		 * 
		 * @param m 矩阵。
		 * @return 新的矩阵。
		 */
		function add(m:IMatrix):IMatrix;
		
		/**
		 * 矩阵的加法，会改变自己(this)。(A += B)
		 * 
		 * @param m 矩阵。
		 * @return this。
		 */
		function addTo(m:IMatrix):IMatrix;
		
		/**
		 * 矩阵的减法，会返回新的对象。(A - B)
		 * 
		 * @param m 矩阵。
		 * @return 新的矩阵。
		 */
		function sub(m:IMatrix):IMatrix;
		
		/**
		 * 矩阵的减法，会改变自己(this)。(A -= B)
		 * 
		 * @param m 矩阵。
		 * @return this。
		 */
		function subTo(m:IMatrix):IMatrix;
		
		/**
		 * 矩阵的乘法，会返回新的对象。(AB)
		 * 
		 * @param m 矩阵。
		 * @return 新的矩阵。
		 */
		function mult(m:IMatrix):IMatrix;
		
		/**
		 * 矩阵的乘法，会改变自己(this)。(A = AB)
		 * 
		 * @param m 矩阵。
		 * @return this。
		 */
		function multTo(m:IMatrix):IMatrix;
		
		/**
		 * 矩阵的乘法，会返回新的对象。(AB)
		 * 
		 * @param m 矩阵。
		 * @return 新的矩阵。
		 */
		/**
		 * 多个矩阵的连续的乘法，会返回新的对象。(ABCD...)
		 * 
		 * 此方法一般会快于 A.multTo(B).multTo(C).multTo(D)...
		 * 
		 * @param matrixs 矩阵列。
		 * @return 新的矩阵。
		 */
		function multChain(... matrixs):IMatrix;
		
		/**
		 * 矩阵的标量积，会返回新的对象。(nA)
		 * 
		 * @param m 矩阵。
		 * @return 新的矩阵。
		 */
		function times(n:Number):IMatrix;
		
		/**
		 * 矩阵的标量积，会改变自己(this)。(A = nA)
		 * 
		 * @param m 矩阵。
		 * @return this。
		 */
		function timesTo(n:Number):IMatrix;
		
		/**
		 * 矩阵的冥，会返回新的对象。(A<sup>n</sup>)
		 * @param n 次数。
		 * @return 新的矩阵。
		 * 
		 */
		function pow(n:int):IMatrix;
		
		/**
		 * 矩阵的冥，会改变自己(this)。(A = A<sup>n</sup>)
		 * 
		 * @param n 次数。
		 * @return this。
		 */
		function powTo(n:int):IMatrix;
		
		/**
		 * 转置，会改变自己(this)。 (A<sup>T</sup>)
		 * 
		 * @return this。
		 */
		function transform():IMatrix;
		
		/**
		 * 返回行列式 ( det(A) )
		 * 
		 * @return det(A)
		 */
		function det():Number;
		
		/**
		 * 线性变换，使 XA -> B 的 B，会改变自己(this)。 (X = BA<sup>-1</sup>)
		 * @param m 矩阵。
		 * @return X
		 * 
		 */
		function diff(m:IMatrix):IMatrix;
		
		/**
		 * 逆矩阵，会改变自己(this)。 (A<sup>-1</sup>)
		 * 
		 * @return this。
		 */
		function invert():IMatrix;
		
		/**
		 * 变为单位矩阵，会改变自己(this)。 (A = E)
		 * 
		 * @return this。
		 */
		function identity():IMatrix;
		
		/**
		 * 克隆，会返回新的对象。
		 * 
		 * @return 新的对象。
		 */
		function clone():IMatrix;
		
		/**
		 * 得到行数。
		 * 
		 * @return 行数。
		 */
		function get row():int;
		
		/**
		 * 得到列数。
		 * 
		 * @return 列数。
		 */
		function get col():int;
		
		/**
		 * 得到A<sub>ij</sub>的元素。
		 * 
		 * @param i 行的下标。
		 * @param j 列的下标。
		 * @return A<sub>ij</sub>的元素。
		 */
		function item(i:int, j:int):Number;
	}
}