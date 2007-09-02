/////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
package advancedflex.math.func {
	/**
	 * 数值积分
	 */
	public final class Integral {
		/**
		 * 在[a, b]间的梯形数值积分
		 * @param f 积分函数
		 * @param a 左界限
		 * @param b 右界限
		 * @param n 分段数
		 * @return [a, b]间的定积分
		 */
		public static function trapezoidalInte(f:Function, a:Number, b:Number,n:int = 1024):Number {
			var h:Number = (b-a) / n;
			var result:Number = 0;
			n--;//n-1 => n
			for(var i:int = 1; i<n; i++) {
				result += f(a + i*h);
			}
			return (h/2)*(f(a) + f(b) + 2*result);
		}
		/**
		 * 在[a, b]间的辛普森数值积分
		 * @param f 积分函数
		 * @param a 左界限
		 * @param b 右界限
		 * @param n 分段数
		 * @return [a, b]间的定积分
		 */
		public static function simpsonInte(f:Function, a:Number, b:Number, n:int = 1024):Number {
			n*=2;//2n => n
			var h:Number = (b-a) / (n);
			var x1:Number = 0;
			var x2:Number = 0;
			n--;//2n-1 => n
			for(var i:int = 1; i<n; i++/*i+=2 => i++*/) {
				x1 += f(a + i*h);
				i++;//i+1 => i
				x2 += f(a + i*h);
			}
			return (h/3)*(f(a) + f(b) + 4*x1 + 2*x2);
		}
		/**
		 * 在[a, b]间的拟柱体数值积分。<br/>
		 * @param f 积分函数
		 * @param a 左界限
		 * @param b 右界限
		 * @return [a, b]间的定积分
		 */
		public static function cylinderInte(f:Function, a:Number, b:Number):Number {
			var h:Number = b-a;
			return (h/6)*(f(a) + 4*f( (a+b) / 2 ) + f(b));
		}
		/**
		 * 返回拟柱体数值积分函数。
		 * @param f 被积分函数
		 * @return 拟柱体数值积分函数 function(a:Number, b:Number):Number。
		 */
		public static function cylinderInteFunc(f:Function):Function {
			return function(a:Number, b:Number):Number {
				var h:Number = b-a;
				return (h/6)*(f(a) + 4*f( (a+b) / 2 ) + f(b));
			}
		}
		public static function binTreeInte(f:Function, a:Number, b:Number, n:int = 128, error:Number = 1e-2, maxSplit:int = 10):Number {
			var cx:Number = 0;
			var h:Number = (b-a) / n;
			var ai:Number = a;
			var bi:Number;
			var fa:Number, fb:Number;
			for(var i:int = 0; i<n; i++) {
				bi =ai + h;
				fa = f(ai);
				fb = f(bi);
				cx+=$binTreeInte(f, ai, bi, fa, fb, error, maxSplit);
				ai = bi;
			}
			return cx;
		}
		private static function $binTreeInte(f:Function, a:Number, b:Number,fa:Number, fb:Number, error:Number, maxSplit:int):Number {
			
			var c:Number = (a+b) / 2;
			var fc:Number = f(c);
			if(maxSplit--) {
				var da:Number = (fc-fa) / (c-a);
				var db:Number = (fc-fb) / (c-b);
				//trace("da :", da, "db :", db)
				if(Math.abs(da-db)>error) {
					return $binTreeInte(f, a, c, fa, fc, error, maxSplit) 
						 + $binTreeInte(f, c, b, fc, fb, error, maxSplit);
				}
			}
			return (fa+fb+fc)*(b-a)/3;
		}
		public static function getN(a:Number, b:Number, maxSlice:Number):int {
			return Math.ceil(Math.abs((b-a) / maxSlice));
		}
	}
}