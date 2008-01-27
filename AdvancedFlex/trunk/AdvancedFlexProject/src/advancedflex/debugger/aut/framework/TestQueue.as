package advancedflex.debugger.aut.framework {
	import advancedflex.debugger.aut.io.AUTOutput;
	import flash.errors.IllegalOperationError;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class TestQueue {
		private var tasks:Array;
		private var running:Boolean = false;
		private var pos:int = 0;
		private var timer:Timer;
		private var out:AUTOutput;
		public function TestQueue() {
			tasks = [];
		}
		public function addTask(task:Test):void {
			tasks.push(task);
		}
		public function runSync(out:AUTOutput):void {
			if(running) {
				throw new IllegalOperationError("It is busy now.");
			}
			for each(var v:Test in tasks) {
				v.runTest(out);
			}
		}
		public function runAsync(out:AUTOutput):void {
			if(running) {
				throw new IllegalOperationError("It is busy now.");
			}
			running = true;
			timer = new Timer(50, tasks.length);
			timer.addEventListener(TimerEvent.TIMER, onTimer, false, 0, true);
		}
		private function onTimer(event:TimerEvent):void {
			Test(tasks[pos++]).runTest(out);
		}
	}
}