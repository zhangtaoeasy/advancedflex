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
	
	import advancedflex.debugger.TimeGetter;
	import advancedflex.debugger.aut.framework.errors.AssertionError;
	import advancedflex.debugger.aut.framework.ns.*;
	import advancedflex.debugger.aut.io.AUTOutput;
	
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	use namespace aut_internal;
	
	/**
	 * Test case
	 * @example <pre><code>
	 * //TestCaseSample1.as
	 * package {
	 * 	import advancedflex.debugger.aut.framework.TestCase;
	 * 	import advancedflex.debugger.aut.framework.ns.*;
	 * 
	 * 	public class TestCaseSample1 extends TestCase {
	 * 		//test only.
	 * 		test function a():void {
	 * 			console.print("aa");
	 * 		}
	 * 		//test and check time if it is timeout.
	 * 		time function b():int {
	 * 			console.print("bb");
	 * 			//if used time > return value,it will throw error.
	 * 			return 10;
	 * 		}
	 * 	}
	 * }
	 * <code></pre>
	 * @author WeiHe
	 * 
	 */
	public class TestCase implements Test {
		
		/**
		 * <p>The output of test.</p>
		 * <p>测试的输出。</p>
		 */
		protected var out:AUTOutput;
		
		/**
		 * <p>get the list of what it will test.</p>
		 * <p>得到测试列表。</p>
		 * 
		 * @param isHead If it is head. 是否为头元素。
		 * @return List. 列表。
		 */
		public function getTestHeader(isHead:Boolean = true):XML {
			setUpTestsSync();
			var result:XML = 
				<TestCase name="">
				</TestCase>;
			result.@name = getQualifiedClassName(this);
			if(isHead) {
				result = XML(
					<aut-list>
					</aut-list>
				).appendChild(result);
			}
			var item:XML;
			var name:String;
			var method:XML;
			for each(item in testSet) {
				method = <method name="" type="test" />;
				method.@name = item.@name;
				result.appendChild(method);
			}
			for each(item in timeSet) {
				method = <method name="" type="time" />;
				method.@name = item.@name;
				result.appendChild(method);
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
			setUpTestsSync();
			testSync();
		}
		
		/*describeType(this)*/
		private var reflect:XML;
		
		/*The list of test mode Tests*/
		private var testSet:XMLList;
		
		/*The list of time mode Tests*/
		private var timeSet:XMLList;
		
		/*set up info for testting.*/
		private function setUpTestsSync():void {
			if(!reflect) {
				reflect = describeType(this);
				testSet = reflect.method.(attribute("uri") == Namespace(test).uri);
				timeSet = reflect.method.(attribute("uri") == Namespace(time).uri && @returnType == "int");
				total = testSet.length() + timeSet.length();
			}
		}
		
		/*Test this TestCase*/
		private function testSync():void {
			/* reflect = describeType(this);
			testSet = reflect.method.(attribute("uri") == Namespace(test).uri);
			timeSet = reflect.method.(attribute("uri") == Namespace(time).uri && @returnType == "int");
			total = testSet.length() + timeSet.length(); */
			
			out.printTestCaseHeader(this);
				setUpClass();
					//doTest
					var item:XML;
					for each(item in testSet) {
						doTest(item.@name);
					}
					//doTimeTest
					for each(item in timeSet) {
						doTimeTest(item.@name);
					}
				tearDownClass();
			out.printTestCaseFooter(this, success, failure, error);
		}
		
		/*The count all test*/
		private var total:int;
		
		/*The count all success test*/
		private var success:int = 0;
		
		/*The count all failure test*/
		private var failure:int = 0;
		
		/*The count all error test*/
		private var error:int = 0;
		/*The position of tests*/
		private var pos:int = 0;
		
		/*do test by test mode*/
		private function doTest(name:String):void {
			var state:String;
			pos++;
			out.printMethodHeader(name, "test", total, pos);
				setUp();
					try {
						this.test::[name]();
						//success
						success++;
						state = "Success";
					} catch (e:AssertionError) {
						//failure
						out.printStackTrace(e);
						failure++;
						state = "Failure";
					} catch (e:Error) {
						//error
						out.printStackTrace(e);
						error++;
						state = "Error";
					}
				tearDown();
			out.printMethodFooter(name, state);
		}
		
		/*do test by time mode*/
		private function doTimeTest(name:String):void {
			var state:String;
			pos++;
			out.printMethodHeader(name, "time", total, pos);
				setUp();
					try {
						var timegetter:TimeGetter = new TimeGetter();
						var excepted:int = this.time::[name]();
						if(excepted < timegetter.time) {
							throw new AssertionError("Timeout-Maxnum Time:<" + excepted + ">But was:<" + timegetter.time +">");
						}
						//success
						success++;
						state = "Success";
					} catch (e:AssertionError) {
						//failure
						out.printStackTrace(e);
						failure++;
						state = "Failure";
					} catch (e:Error) {
						//error
						out.printStackTrace(e);
						error++;
						state = "Error";
					}
				tearDown();
			out.printMethodFooter(name, state);
		}
		
		/**
		 * <p>Run before each test.</p>
		 * <p>在每一个测试前执行。</p>
		 */
		protected function setUp():void {
		}
		
		/**
		 * <p>Run after each test.</p>
		 * <p>在每一个测试后执行。</p>
		 */
		protected function tearDown():void {
		}
		
		/**
		 * <p>Run before first test.</p>
		 * <p>在第一个测试前执行。</p>
		 */
		protected function setUpClass():void {
		}
		
		/**
		 * <p>Run after last test.</p>
		 * <p>在最后一个测试后执行。</p>
		 */
		protected function tearDownClass():void {
		}
	}
}