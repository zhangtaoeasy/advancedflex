package advancedflex.debugger.aut.framework {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class TestSuite implements Test {
		[ArrayElementType("advancedflex.debugger.aut.framework.Test")]
		private var testSet:Array;
		private var id:String
		public function TestSuite(id:String = "TestSuite") {
			testSet = new Array();
			this.id = id;
		}
		
		public function addTest(test:Test):TestSuite {
			testSet.push(test);
			return this;
		}
		private var console:Console;
		public function startTest(console:Console):void {
			this.console = console;
			testAsync();
		}
		
		private function testAsync():void {
			console.printTestSuiteHeader(id);
			var timer:Timer = new Timer(50, testSet.length);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplateHandler);
			timer.start();
		}
		private var pos:int = 0;
		private function timerHandler(event:TimerEvent):void {
			testSet[pos].startTest(console);
			pos++;
		}
		private function timerComplateHandler(event:TimerEvent):void {
			console.printTestSuiteFooter(id);
		}
	}
}