package advancedflex.async.events {
	import flash.events.Event;
	import advancedflex.async.IAsyncTask;

	public class AsyncTaskRunnerEvent extends Event {
		
		public static const START:String = "start";
		
		public static const START_TASK:String = "startTask";
		
		public static const COMPLETE_TASK:String = "completeTask";
		
		public static const COMPLETE_ALL:String = "completeAll";
		
		public var task:IAsyncTask;
		
		public function AsyncTaskRunnerEvent(type:String) {
			super(type, false, false);
		}
	}
}