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

package advancedflex.math.solving {
	
	/**
	 * 求 <em>f(x)=N</em> 的解。
	 */
	public interface ISolving {
		
		/**
		 * 求一个解，迭代停止条件为误差小于 tol，或运行时间大于 ms 毫秒。
		 * @param n <em>f(x)=N</em>中的 N 的值。
		 * @param tol 允许的最大误差。
		 * @param ms 执行的最大时间，超过这个时间后，会强行返回。
		 * @param args 参数。
		 * @return 解。
		 */
		function solveTill(n:Number, range:ResultRange = null,
			tol:Number = 1e-12, ms:int = 4048, ...args):SlovingResult;
		
		/**
		 * 求一个解，迭代次数为 times 次。
		 * @param n <em>f(x)=N</em>中的 N 的值。
		 * @param times 迭代次数。
		 * @param args 参数。
		 * @return 解。
		 */
		function solveTimes(n:Number, range:ResultRange = null,
			times:int = 128, ...args):SlovingResult;
		
		/**
		 * 求多个解(如果可能的话)，迭代停止条件为误差小于 tol，或运行时间大于 ms 毫秒。
		 * @param n <em>f(x)=N</em>中的 N 的值。
		 * @param tol 允许的最大误差。
		 * @param ms 执行的最大时间，超过这个时间后，会强行返回。
		 * @param args 参数。
		 * @return 解。
		 */
		function solveAllTill(n:Number, range:ResultRange = null,
			tol:Number = 1e-12, ms:int = 4048, ...args):SlovingResult;
		
		/**
		 * 求多个解(如果可能的话)，迭代次数为 times 次。
		 * @param n <em>f(x)=N</em>中的 N 的值。
		 * @param times 迭代次数。
		 * @param args 参数。
		 * @return 解。
		 */
		function solveAllTimes(n:Number, range:ResultRange = null,
			times:int = 128, ...args):SlovingResult;
		
		/**
		 * <em>f(x)=N</em> 中的 f(x)
		 * @return f(x)
		 */
		function get func():Function;
		
		function set func(f:Function):void;
		
		/**
		 * 得到逆函数 x=f<sup>-1</sup>(y)，
		 * 函数的的格式为 <em>function(y:NUmber):SlovingResult</em>。
		 * @param args 参数
		 * @return 逆函数
		 */
		function createSolvingFunction(...args):Function;
	}
}