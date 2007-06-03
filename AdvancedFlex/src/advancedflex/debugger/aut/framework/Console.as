package advancedflex.debugger.aut.framework {
	import flash.utils.IDataOutput;
	import flash.utils.getQualifiedClassName;
	
	public class Console {
		
		internal function printTestSuiteHeader(id:String):void {
			out.writeUTFBytes(tab + "#TestSuite - " + id +": \n");
			shiftRight();
		}
		internal function printTestSuiteFooter(id:String):void {
			shiftLeft();
			out.writeUTFBytes(tab + "#End of TestSuite - " + id + " \n");
		}
		internal function printTestCaseHeader(testCase:TestCase):void {
			out.writeUTFBytes(tab + "#TestCase - " + getQualifiedClassName(testCase) +": \n");
			shiftRight();
		}
		internal function printTestCaseFooter(testCase:TestCase, success:int, failure:int, error:int):void {
			shiftLeft();
			var result:String = 	"(Total:" + (success + failure + error) +
								  " Success:" + success +
								 " Failures:" + failure +
								   " Errors:" + error + ")"
			out.writeUTFBytes(tab + "#End of TestCase - " + getQualifiedClassName(testCase) + result + " \n");
		}
		internal function printMethodHeader(method:String, type:String, total:int, pos:int):void {
			out.writeUTFBytes(tab + "#Test - " + type + "::" + method + "(" + pos + "/" + total + "): \n");
			shiftRight();
		}
		
		internal function printMethodFooter(method:String, state:String):void {
			shiftLeft();
			out.writeUTFBytes(tab + "#End of Test - " + state + " \n");
		}
		internal function printStackTrace(error:Error):void {
			out.writeUTFBytes(tab + error.getStackTrace());
		}
		public function print(...args):void {
			out.writeUTFBytes(tab + args.join(" "));
		}
		public function println(...args):void {
			out.writeUTFBytes(tab + args.join(" ") + " \n");
		}
		private var tab:String = "";
		private function shiftRight():void {
			tab += "  ";
		}
		private function shiftLeft():void {
			tab = tab.slice(0, -2);
		}
		protected function get out():IDataOutput {
			return null;
		}
	}
}