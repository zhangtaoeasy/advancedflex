package advancedflex.debugger.aut.framework {
	import flash.utils.describeType;
	import advancedflex.debugger.aut.framework.ns.*;
	import advancedflex.debugger.aut.framework.errors.AssertionError;
	import advancedflex.debugger.TimeGetter;
	
	public class TestCase implements Test {
		
		protected var console:Console;
		
		public function startTest(console:Console):void {
			this.console = console;
			testSync();
		}
		private var reflect:XML;
		private var testSet:XMLList;
		private var timeSet:XMLList;
		private function testSync():void {
			reflect = describeType(this);
			testSet = reflect.method.(attribute("uri") == Namespace(test).uri);
			timeSet = reflect.method.(attribute("uri") == Namespace(time).uri && @returnType == "int");
			total = testSet.length() + timeSet.length();
			
			console.printTestCaseHeader(this);
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
			console.printTestCaseFooter(this, success, failure, error);
		}
		private var total:int;
		private var success:int = 0;
		private var failure:int = 0;
		private var error:int = 0;
		private var pos:int = 0;
		private function doTest(name:String):void {
			var state:String;
			pos++;
			console.printMethodHeader(name, "test", total, pos);
				setUp();
					try {
						this.test::[name]();
						//success
						success++;
						state = "Success";
					} catch (e:AssertionError) {
						//failure
						console.printStackTrace(e);
						failure++;
						state = "Failure";
					} catch (e:Error) {
						//error
						console.printStackTrace(e);
						error++;
						state = "Error";
					}
				tearDown();
			console.printMethodFooter(name, state);
		}
		private function doTimeTest(name:String):void {
			var state:String;
			console.printMethodHeader(name, "time", total, pos);
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
						console.printStackTrace(e);
						failure++;
						state = "Failure";
					} catch (e:Error) {
						//error
						console.printStackTrace(e);
						error++;
						state = "Error";
					}
				tearDown();
			console.printMethodFooter(name, state);
		}
		protected function setUp():void {
			
		}
		protected function tearDown():void {
			
		}
		protected function setUpClass():void {
			
		}
		protected function tearDownClass():void {
			
		}
	}
}