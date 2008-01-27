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
	import flash.utils.getTimer;
	
	public class DichotomySolving implements ISolving {
		
		private var f:Function;
		
		public function solveTill(n:Number, range:ResultRange = null,
			tol:Number=1e-12, ms:int=4048, ...args):SlovingResult 
		{
			//TODO: implement function
			return null;
		}
		
		public function solveAllTimes(n:Number, range:ResultRange = null,
			times:int=128, ...args):SlovingResult 
		{
			//TODO: implement function
			return null;
		}
		
		public function get func():Function {
			//TODO: implement function
			return null;
		}
		
		public function set func(f:Function):void {
			//TODO: implement function
		}
		
		public function solveAllTill(n:Number, range:ResultRange = null,
			tol:Number=1e-12, ms:int=4048, ...args):SlovingResult
		{
			//TODO: implement function
			return null;
		}
		
		public function solveTimes(n:Number, range:ResultRange = null,
			times:int=128, ...args):SlovingResult
		{
			//TODO: implement function
			return null;
		}
		
		public function createSolvingFunction(...args):Function
		{
			//TODO: implement function
			return null;
		}
		private function $sloveTill(l:Number, r:Number, n:Number,
			tol:Number, leftTime:int):Number 
		{
			var t:int = getTimer();
			var fr:Number, fl:Number;
			fl = f(l);
			fr = f(r);
			if((fl-n) * (fr-n)<0) {
				
			}
			return 0;//TODO
		}
	}
}