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
package advancedflex.debugger.aut.framework {
	
	import advancedflex.debugger.aut.framework.ns.*;
	import advancedflex.debugger.aut.io.AUTOutput;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	use namespace aut_internal;
	[DefaultProperty("testSet")]
	/**
	 * <p>The set of Test</p>
	 * 
	 * <p>Test的集合</p>
	 * 
	 * @author Stephen
	 */
	public class TestSuite implements Test {
		
		/*holder of tests*/
		[ArrayElementType("advancedflex.debugger.aut.framework.Test")]
		public var testSet:Array;
		
		/*TestSuite's name*/
		public var name:String
		
		/*output*/
		private var out:AUTOutput;
		
		/**
		 * <p>Create TestSuite</p>
		 * <p>创建一个TestSuite</p>
		 * 
		 * @param id TestSuite's id. TestSuite的标志符。
		 */
		public function TestSuite(name:String = "TestSuite") {
			testSet = new Array();
			this.name = name;
		}
		
		/**
		 * <p>Add Test.It returns itself.</p>
		 * <p>添加一个Test。它返回TestSuite自己。</p>
		 * 
		 * @param test Test
		 * @return Itself
		 */
		public function addTest(test:Test):TestSuite {
			testSet.push(test);
			return this;
		}
		
		/**
		 * <p>get the list of what it will test.</p>
		 * <p>得到测试列表。</p>
		 * 
		 * @param isHead If it is head. 是否为头元素。
		 * @return List. 列表。
		 */
		public function getTestHeader(isHead:Boolean = true):XML {
			var result:XML = 
				<TestSuite name="">
				</TestSuite>;
			result.@name = name;
				var i:Test;
			if(isHead) {
				result = XML(
					<aut-list>
					</aut-list>
				).appendChild(result);
				var temp:XMLList = result.TestSuite;
				for each(i in testSet) {
					temp.appendChild(i.getTestHeader(false));
				}
			} else {
				for each(i in testSet) {
					result.appendChild(i.getTestHeader(false));
				}
			}
			
			return result;
		}
		
		/**
		 * <p>start Test</p>
		 * <p>开始测试</p>
		 * 
		 * @param out The output of test. 测试的输出。
		 */
		public function runTest(out:AUTOutput):void {
			this.out = out;
			testAsync();
		}
		
		/*test this TestSuite*/
		private function testAsync():void {
			out.printTestSuiteHeader(name);
			var timer:Timer = new Timer(50, testSet.length);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplateHandler);
			timer.start();
		}
		
		/*The position of testting*/
		private var pos:int = 0;
		
		/*Test timer Handler*/
		private function timerHandler(event:TimerEvent):void {
			testSet[pos].runTest(out);
			pos++;
		}
		
		/*Test timer Complate Handler*/
		private function timerComplateHandler(event:TimerEvent):void {
			out.printTestSuiteFooter(name);
		}
	}
}