////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://advancedflex.googlecode.com/. 
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package advancedflex.math.geom {
	
	/**
	 * 2元向量(倍精度类型)
	 * <em>它是 AFML(Advanced Flex Math Libary)的一部分。</em>
	 */
	public class Vector2d {
		
		/**
		 * 该向量的x分量。
		 */
		public var x:Number
		
		/**
		 * 该向量的y分量。
		 */
		public var y:Number;
		
		/**
		 * 0向量。
		 */
		public static const ZERO:Vector2d = new Vector2d(0, 0);
		
		/**
		 * 创建一个向量。
		 * @param x x分量。
		 * @param y y分量。
		 */
		public function Vector2d(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		/**
		 * 向量的加法，this += v。
		 * @param v 向量。
		 * @return 自己。
		 */
		public final function addTo(v:Vector2d):Vector2d {
			x += v.x;
			y += v.y;
			return this;
		}
		
		/**
		 * 向量的加法，this = v1 + v2。
		 * @param v1 向量1。
		 * @param v2 向量2。
		 * @return 自己。
		 */
		public final function add(v1:Vector2d, v2:Vector2d):Vector2d {
			x = v1.x + v2.x;
			y = v1.y + v2.y;
			return this;
		}
		
		/**
		 * 向量的减法，this -= v。
		 * @param v 向量。
		 * @return 自己。
		 */
		public final function subTo(v:Vector2d):Vector2d {
			x -= v.x;
			y -= v.y;
			return this;
		}
		
		/**
		 * 向量的减法，this = v1 - v2。
		 * @param v1 向量1。
		 * @param v2 向量2。
		 * @return 自己。
		 */
		public final function sub(v1:Vector2d, v2:Vector2d):Vector2d {
			x = v1.x - v2.x;
			y = v1.y - v2.y;
			return this;
		}
		
		/**
		 * 向量的倍积，this *= n。
		 * @param n 倍数。
		 * @return 自己。
		 */
		public final function scaleTo(n:Number):Vector2d {
			x *= n;
			y *= n;
			return this;
		}
		
		/**
		 * 向量的倍积，this = n * v。
		 * @param n 倍数。
		 * @param v 向量。
		 * @return 自己。
		 */
		public final function scale(n:Number, v:Vector2d):Vector2d {
			x = v.x * n;
			y = v.y * n;
			return this;
		}
		
		/**
		 * 向量的内积，this·v。
		 * @param v 向量。
		 * @return this·v。
		 */
		public final function dot(v:Vector2d):Number {
			return x*v.x + y*v.y;
		}
		
		/**
		 * 向量的外积，this×v。
		 * @param v 向量。
		 * @return this×v。
		 */
		public final function cross(v:Vector2d):Number {
			return x*v.y - y*v.x;
		}
		
		/**
		 * 向量的模(长度)，|this|。
		 * @return |this|。
		 */
		public final function get length():Number {
			return Math.sqrt(x*x + y*y);
		}
		
		public final function set length(v:Number):void {
			if(v==0) {
				x = y = 0;
			}
			var l:Number = length;
			var dl:Number = v / l;
			x *= dl;
			y *= dl;
		}
		
		/**
		 * 绕原点旋转 rad 弧度。
		 * <p>
		 * <listing>
		 * x' =  sin(rad)*x + cos(rad)*y
		 * y' = -sin(rad)*x + cos(rad)*y
		 * </listing>
		 * </p>
		 * @param rad 旋转弧度。
		 * @return 自己。
		 */
		public final function rotateTo(rad:Number):Vector2d {
			var tx:Number = x, ty:Number = y;
			var sin:Number = Math.sin(rad);
			var cos:Number = Math.cos(rad);
			x =  sin*tx + cos*ty;
			y = -sin*tx + cos*ty;
			return this;
		}
		
		/**
		 * 绕原点旋转 rad 弧度，this = v.rotate(red)。
		 * 
		 * <p>
		 * x' =  sin(rad)*x + cos(rad)*y<br/>
		 * y' = -sin(rad)*x + cos(rad)*y
		 * </p>
		 * @param rad 旋转弧度。
		 * @param v 向量。
		 * @return 自己。
		 */
		public final function rotate(rad:Number, v:Vector2d):Vector2d {
			var tx:Number = v.x, ty:Number = v.x;
			var sin:Number = Math.sin(rad);
			var cos:Number = Math.cos(rad);
			x =  sin*tx + cos*ty;
			y = -sin*tx + cos*ty;
			return this;
		}
		
		/**
		 * 绕指定点旋转 rad 弧度。
		 * @param rad 弧度。
		 * @param point 指定点。
		 * @return 自己。
		 */
		public final function rotateAboutPointTo(
			rad:Number, point:Vector2d):Vector2d 
		{
			var tx:Number = x - point.x, ty:Number = y - point.y;
			var sin:Number = Math.sin(rad);
			var cos:Number = Math.cos(rad);
			x =  sin*tx + cos*ty + point.x;
			y = -sin*tx + cos*ty + point.y;
			return this;
		}
		
		/**
		 * 绕指定点旋转 rad 弧度，this = v.rotateAboutPoint(red, point)。
		 * @param rad 弧度。
		 * @param point 指定点。
		 * @param v 向量。
		 * @return 自己。
		 * 
		 */
		public final function rotateAboutPoint(
			rad:Number, point:Vector2d, v:Vector2d):Vector2d 
		{
			var tx:Number = v.x - point.x, ty:Number = v.y - point.y;
			var sin:Number = Math.sin(rad);
			var cos:Number = Math.cos(rad);
			x =  sin*tx + cos*ty + point.x;
			y = -sin*tx + cos*ty + point.y;
			return this;
		}
		
		/**
		 * 反转向量，this = -this。
		 * @return 自己。
		 */
		public final function invertTo():Vector2d {
			x = -x;
			y = -y; 
			return this;
		}
		
		/**
		 * 向量的夹角，&lt;this，v&gt;。
		 * @param v 向量。
		 * @return 向量的夹角，规定 0 ≤ &lt;this，v&gt; ≤ PI。
		 * 
		 */
		public final function angle(v:Vector2d):Number {
			return Math.abs( Math.atan2(y,x) - Math.atan2(v.y, v.x) ) % Math.PI;
		}
		
		/**
		 * 向量的混合积，a·(b×c)。
		 * @param a 向量。
		 * @param b 向量。
		 * @param c 向量。
		 * @return a·(b×c)。
		 */
		public static function MixedPlot(a:Vector2d, b:Vector2d, c:Vector2d):Number {
			/*
			 * |a b 1|
			 * |c d 1|
			 * |e f 1|
			 * = ad+cf+be-ed-bc-af
			 * = a(d-f)+b(e-c)+c(f-b)
			 */
			return a.x*(b.y-c.y) + a.y*(c.x-b.x) + b.x*(c.y-a.y);
		}
		
		public final function normalize(tol:Number = 1e-12):Vector2d {
			var m:Number = length;
			if(m<tol) {
				m = 1;
			}
			x /= m;
			y /= m;
			if(Math.abs(x)<tol) {
				x = 0;
			}
			if(Math.abs(y)<tol) {
				y = 0;
			}
			return this;
		}
		
		/**
		 * 两个向量是否垂直，this⊥v。
		 * @param v 向量。
		 * @param error 允许的最大计算误差。
		 * @return this⊥v。
		 */
		public final function isVertical(
			v:Vector2d, error:Number = 1e-12):Boolean 
		{
			return Math.abs(dot(v)) <= error;
		}
		
		/**
		 * 两个向量是否平行，this∥v。
		 * @param v 向量。
		 * @param error 允许的最大计算误差。
		 * @return this∥v。
		 */
		public final function isParallel(
			v:Vector2d, error:Number = 1e-12):Boolean 
		{
			return isZero() || v.isZero() ? true :
					Math.abs(x*v.y - y*v.x) <= error;
		}
		
		/**
		 * 是否为0向量。
		 * @param error 允许的最大计算误差。
		 * @return 是否为0向量。
		 */
		public final function isZero(error:Number = 1e-12):Boolean {
			return Math.abs(x) <= error && Math.abs(y) <= error;
		}
		
		/**
		 * 反转向量，this = -v。
		 * @param v 向量。
		 * @return 自己。
		 */
		public final function invert(v:Vector2d):Vector2d {
			x = -v.x;
			y = -v.y; 
			return this;
		}
		
		/**
		 * 重设向量。
		 * @param value 新的值，他必须包含 x 与 y 两个变量。
		 * @return 自己。
		 */
		public function reset(value:*):Vector2d {
			x = value.x;
			y = value.y;
			return this;
		}
		
		/**
		 * 判断是否相等。
		 * @param v 向量。
		 * @param error 允许的最大计算误差。
		 * @return 是否相等。
		 */
		public function equals(v:Vector2d, error:Number = 1e-12):Boolean {
			return Math.abs(x-v.x) <= error && Math.abs(y-v.y);
		}
		
		public function toString():String {
			return "(" + x + "," + y + ")";
		}
	}
}