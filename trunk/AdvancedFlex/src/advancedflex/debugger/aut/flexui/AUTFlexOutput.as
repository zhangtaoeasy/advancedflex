package advancedflex.debugger.aut.flexui {
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.aut_internal;
	import advancedflex.debugger.aut.io.AUTOutput;
	
	import flash.utils.getQualifiedClassName;
	
	use namespace aut_internal;

	internal class AUTFlexOutput extends AUTOutput {
		
		private var runner:AUTFlexRunner;
		public function AUTFlexOutput(runner:AUTFlexRunner) {
			this.runner = runner;
		}
		
		/**
		 * @private
		 * print TestSuite's Header
		 * @param id TestSuite's id.
		 */
		aut_internal override function printTestSuiteHeader(id:String):void {
			
		}
		
		/**
		 * @private
		 * print TestSuite's Footer
		 * @param id TestSuite's id.
		 */
		aut_internal override function printTestSuiteFooter(id:String):void {
			var parent:* = path.parent();
			if(parent is XMLList) {
				var index:int = path.childIndex() + 1;
				path = parent[index];
			}
		}
		
		/**
		 * @private
		 * print TestCase's Header
		 * @param testCase the instance of TestCase
		 */
		aut_internal override function printTestCaseHeader(testCase:TestCase):void {

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
		aut_internal override function printTestCaseFooter(testCase:TestCase, success:int, failure:int, error:int):void {
			var parent:* = path.parent();
			if(parent is XMLList) {
				var index:int = path.childIndex() + 1;
				path = parent[index];
			}
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
		aut_internal override function printMethodHeader(method:String, type:String, total:int, pos:int):void {
			path = path.(@name == method);

		}
		
		/**
		 * @private
		 * 
		 * print Method's Footer
		 * 
		 * @param method method name
		 * @param state The result of test.(Success, Failure or Error)
		 */
		aut_internal override function printMethodFooter(method:String, state:String):void {
			//trace("Method:",method)
			runner.testItem(path, state);
			path = path.parent();
		}
		
		/**
		 * @private
		 * 
		 * print Stack Trace
		 * 
		 * @param error error object
		 */
		aut_internal override function printStackTrace(error:Error):void {
			runner.printStack(path, error.getStackTrace());
		}
		
		/**
		 * <p>Print Message.</p>
		 * 
		 * <p>打印输出信息。</p>
		 * 
		 * @param args message
		 */
		public override function print(...args):void {
			runner.printMsg(path, args.join(" "));
		}
		
		/**
		 * <p>Print Message and newline.</p>
		 * 
		 * <p>打印输出信息并换新行。</p>
		 * 
		 * @param args message
		 */
		public override function println(...args):void {
			runner.printMsg(path, args.join(" ") + "\n");
		}
		//private var testList:XMLList;
		private var path:*;
		//private var pos:int = -1;
		private function nextPath():void {
			if(path is XML) {//Leaves
				
			}
		}
	}
}