package advancedflex.debugger.aut.traceui {
	
	import advancedflex.debugger.aut.io.AUTOutput;
	import advancedflex.debugger.aut.framework.ns.aut_internal;
	import advancedflex.debugger.aut.framework.TestCase;
	import flash.utils.getQualifiedClassName;
	
	use namespace aut_internal;

	public class AUTTraceOutput extends AUTOutput {
		/**
		 * @private
		 * print TestSuite's Header
		 * @param id TestSuite's id.
		 */
		aut_internal override function printTestSuiteHeader(name:String):void {
			trace(tab + "#TestSuite - " + name +":");
			shiftRight();
		}
		
		/**
		 * @private
		 * print TestSuite's Footer
		 * @param id TestSuite's id.
		 */
		aut_internal override function printTestSuiteFooter(name:String):void {
			shiftLeft();
			trace(tab + "#End of TestSuite - " + name);
		}
		
		/**
		 * @private
		 * print TestCase's Header
		 * @param testCase the instance of TestCase
		 */
		aut_internal override function printTestCaseHeader(testCase:TestCase):void {
			trace(tab + "#TestCase - " + getQualifiedClassName(testCase) +":");
			shiftRight();
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
			shiftLeft();
			var result:String = 	"(Total:" + (success + failure + error) +
								  " Success:" + success +
								 " Failures:" + failure +
								   " Errors:" + error + ")"
			trace(tab + "#End of TestCase - " + getQualifiedClassName(testCase) + result);
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
			trace(tab + "#Test - " + type + "::" + method + "(" + pos + "/" + total + "):");
			shiftRight();
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
			shiftLeft();
			trace(tab + "#End of Test - " + state);
		}
		
		/**
		 * @private
		 * 
		 * print Stack Trace
		 * 
		 * @param error error object
		 */
		aut_internal override function printStackTrace(error:Error):void {
			trace(tab + error.getStackTrace());
		}
		
		/**
		 * <p>Print Message.</p>
		 * 
		 * <p>打印输出信息。</p>
		 * 
		 * @param args message
		 */
		public override function print(...args):void {
			trace(tab + args.join(" "));
		}
		
		/**
		 * <p>Print Message and newline.</p>
		 * 
		 * <p>打印输出信息并换新行。</p>
		 * 
		 * @param args message
		 */
		public override function println(...args):void {
			trace(tab + args.join(" "));
		}
		/*tab*/
		private var tab:String = "";
		
		private function shiftRight():void {
			tab += "  ";
		}
		private function shiftLeft():void {
			tab = tab.slice(0, -2);
		}
	}
}