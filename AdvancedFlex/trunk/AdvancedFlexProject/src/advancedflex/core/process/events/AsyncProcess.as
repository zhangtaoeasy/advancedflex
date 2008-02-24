package advancedflex.core.process.events {
	
	import flash.events.Event;

	public class AsyncProcess extends Event {
		
		public static const START:String = "stare";
		public static const END:String = "end";
		public static const ERROR:String = "error";
		
		public function AsyncProcess(type:String) {
			super(type);
		}
	}
}