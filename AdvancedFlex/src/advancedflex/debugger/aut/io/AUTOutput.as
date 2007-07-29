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
package advancedflex.debugger.aut.io {
	
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.aut_internal;
	import advancedflex.errors.AbstractMethodError;
	
	use namespace aut_internal;
	
	/**
	 * <p>Abstract AUT Output.</p>
	 * <p>抽象的AUT输出。</p>
	 * 
	 * @author Stephen
	 */
	public class AUTOutput {
		
		/**
		 * @private
		 * print TestSuite's Header
		 * @param id TestSuite's id.
		 */
		aut_internal function printTestSuiteHeader(id:String):void {
			throw new AbstractMethodError("AUTOutput.printTestSuiteHeader(String) is abstract method.");
		}
		
		/**
		 * @private
		 * print TestSuite's Footer
		 * @param id TestSuite's id.
		 */
		aut_internal function printTestSuiteFooter(id:String):void {
			throw new AbstractMethodError("AUTOutput.printTestSuiteFooter(String) is abstract method.");
		}
		
		/**
		 * @private
		 * print TestCase's Header
		 * @param testCase the instance of TestCase
		 */
		aut_internal function printTestCaseHeader(testCase:TestCase):void {
			throw new AbstractMethodError("AUTOutput.printTestCaseHeader(TestCase) is abstract method.");
		}
		
		/**
		 * @private
		 * 
		 * print TestCase's Footer
		 * 
		 * @param testCase the instance of TestCase
		 * @param success The count of success
		 * @param failure The count of failure
		 * @param error The count of error
		 */
		aut_internal function printTestCaseFooter(testCase:TestCase, success:int, failure:int, error:int):void {
			throw new AbstractMethodError("AUTOutput.printTestCaseHeader(TestCase,int,int,int) is abstract method.");
		}
		
		/**
		 * @private
		 * 
		 * print Method's Header
		 * 
		 * @param method method name
		 * @param type test type(test or time)
		 * @param total The count of total test
		 * @param pos The position of test
		 */
		aut_internal function printMethodHeader(method:String, type:String, total:int, pos:int):void {
			throw new AbstractMethodError("AUTOutput.printMethodHeader(String,String,int,int) is abstract method.");
		}
		
		/**
		 * @private
		 * 
		 * print Method's Footer
		 * 
		 * @param method method name
		 * @param state The result of test.(Success, Failure or Error)
		 */
		aut_internal function printMethodFooter(method:String, state:String):void {
			throw new AbstractMethodError("AUTOutput.printMethodFooter(String,String) is abstract method.");
		}
		
		/**
		 * @private
		 * 
		 * print Stack Trace
		 * 
		 * @param error error object
		 */
		aut_internal function printStackTrace(error:Error):void {
			throw new AbstractMethodError("AUTOutput.printStackTrace(Error) is abstract method.");
		}
		
		/**
		 * <p>Print Message.</p>
		 * 
		 * <p>打印输出信息。</p>
		 * 
		 * @param args message
		 */
		public function print(...args):void {
			throw new AbstractMethodError("AUTOutput.print(...) is abstract method.");
		}
		
		/**
		 * <p>Print Message and newline.</p>
		 * 
		 * <p>打印输出信息并换新行。</p>
		 * 
		 * @param args message
		 */
		public function println(...args):void {
			throw new AbstractMethodError("AUTOutput.println(...) is abstract method.");
		}
	}
}