package advancedflex.js {
	import flash.events.IEventDispatcher;
	import mx.core.IMXMLObject;
	import flash.events.EventDispatcher;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;

	[DefaultProperty("source")]
	public class JavaScript extends EventDispatcher implements IMXMLObject {
		
		public var autoRun:Boolean = false;
		
		private var src:String;
		
		public function JavaScript() {
			super(this);
		}
		
		public function initialized(document:Object, id:String):void {
			if(autoRun) {
				run();
			}
		}
		public function run():void {
			var u:URLRequest = new URLRequest ("javascript:eval('" + src + "');");
			navigateToURL(u,"_self");
		}
		public function set source(src:String):void {
			if (src != null) {
				var commentPattern:RegExp = /(\/\*([^*]|[\r\n]|(\*+([^*\/]|[\r\n])))*\*+\/)|((^|[^:\/])(\/\/.*))/g;
				this.src = src.replace (commentPattern, "");
			}
		}
	}
}