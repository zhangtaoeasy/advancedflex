package advancedflex.display {
	
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class ImageLoader extends Loader {
		
		private var $stream:URLStream;
		private var $buffer:ByteArray;
		
		public override function load(
			request:URLRequest, 
			context:LoaderContext=null
			):void 
		{
			unload();
			$stream = new URLStream();
			$stream.addEventListener(ProgressEvent.PROGRESS, $progressHandler);
			$stream.addEventListener(Event.COMPLETE, $completeHandler);
			$stream.load(request);
			
		}
		
		public override function unload():void {
			super.unload();
			$doAfter();
		}
		
		public override function close():void {
			$doAfter();
		}
		
		private function $progressHandler(event:ProgressEvent):void {
			if($stream.bytesAvailable) {
				$doProcess();
			}
		}
		
		private function $doProcess():void {
			if($stream.connected) {
				$stream.readBytes( $buffer , $buffer.length );
				super.unload();
				super.loadBytes($buffer);
			}
		}
		
		private function $completeHandler(event:Event):void {
			$doProcess();
			$doAfter();
		}
		
		private function $doAfter():void {
			if($stream.connected) {
				$stream.close();
			}
			$stream.removeEventListener(
				ProgressEvent.PROGRESS, $progressHandler);
			$stream.removeEventListener(Event.COMPLETE, $completeHandler);
			$stream = null;
			$buffer = null;
		}
	}
}