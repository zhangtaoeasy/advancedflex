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
	
	/**
	 * <p>The control of loop.It can check if application has infinite-loop.
	 * If the loop will be an infinite-loop, it can throw error to break loop.
	 * This sub class'constructor mast be <code>_(args:Array)</code></p>
	 * 
	 * <p>循环控制。它可以检测死循环。如果循环将成为死循环，它将会抛出一个错误。它的子类的构造函数必须是<code>_(args:Array)</code></p>
	 * 
	 * @author Stephen
	 */
	public interface ILoopControl {
		
		/**
		 * <p>Check if the loop is an infinite-loop.You'd better call this method once a loop.
		 * (If you call this twice or other times it won't work well.)</p>
		 * 
		 * <P>检查是否将会进入死循环。除了特殊情况，一般在循环里调用此方法一次。(如果调用多次，有可能会出问题)</P>
		 */
		function run():void;
		
		/**
		 * <p>Distory the LoopControl.It will make this be unable to throw error.</p>
		 * 
		 * <p>破坏循环控制。他将不会抛出错误。(慎用)</p>
		 */
		function distory():void;
		
		/**
		 * <p>Reset the LoopControl. It will make the counter to empty etc.</p>
		 * 
		 * <p>重置循环控制。</p>
		 */
		function reset():void;
	}
}