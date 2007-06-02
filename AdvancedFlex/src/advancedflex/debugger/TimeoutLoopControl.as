/////////////////////////////////////////////////////////////////////////////
//Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
/////////////////////////////////////////////////////////////////////////////
package advancedflex.debugger {
	import flash.utils.getTimer;
	import advancedflex.debugger.errors.InfiniteLoopError;
	
	
	/**
	 * <p>Check infinite-loop by timeout.</p>
	 * 
	 * <p>以超时的方式来检查死循环。</p>
	 * 
	 * @author Stephen
	 */
	public class TimeoutLoopControl implements ILoopControl {
		
		protected var timeout:int;
		protected var timeoutTime:int;
		
		/**
		 * <p>Create new instance.</p>
		 * 
		 * <p>创建一个实例。</p>
		 * 
		 * @param args [0]:loop max times. 循环最大次数。
		 */
		public function TimeoutLoopControl(args:Array) {
			timeout = args[0];
			timeoutTime = getTimer() + timeout;
		}
		
		/**
		 * <p>Reset the LoopControl. It will make the passed time to empty.</p>
		 * 
		 * <p>重置循环控制。</p>
		 */
		public function reset():void {
			timeoutTime = getTimer() + timeout;
		}
		
		/**
		 * <p>Distory the LoopControl.It will make this be unable to throw error.</p>
		 * 
		 * <p>破坏循环控制。他将不会抛出错误。(慎用)</p>
		 */
		public function distory():void {
			timeoutTime = int.MAX_VALUE;
		}
		
		/**
		 * <p>Check if the loop is an infinite-loop by timeout.</p>
		 * 
		 * <P>以超时的方式来检查是否将会进入死循环。</P>
		 */
		public function run():void {
			if(getTimer() > timeoutTime) {
				throw new InfiniteLoopError("InfiniteLoopError TimeoutLoopControl");
			}
		}
	}
}