package advancedflex.async.events {
	import flash.events.Event;
	import advancedflex.async.IAsyncTask;

	public class AsyncTaskEvent extends Event {
		
		public static const START:String = "start";
		
		public static const COMPLETE:String = "complete";
		
		public var task:IAsyncTask;
		
		public function AsyncTaskEvent(type:String) {
			super(type, false, false);
		}
	}
}