package advancedflex.debugger {
	import flash.display.Stage;
	
	public class PerformanceReport {
		
		private var $queue:Array;
		private var $maxTimeout:int;
		
		public function PerformanceReport(stage:Stage, maxTimeout:int = 0) {
			if(maxTimeout <= 0) {
				maxTimeout = 800 / stage.frameRate;
			}
			$maxTimeout = maxTimeout;
		}
		
		public function traceReport():void {
			//Todo
		}
		public function sendReport():void {
			//Todo
		}
		public function add(thisObject:*, func:Function, ...args):void {
			$queue.push(new ReportItem(thisObject, func, args));
		}
	}
}

class ReportItem {
	internal var $self:*;
	internal var $func:Function;
	internal var $args:Array;
	public function ReportItem(self:*, func:Function, args:Array) {
		$self = self;
		$func = func;
		$args = args;
	}
}