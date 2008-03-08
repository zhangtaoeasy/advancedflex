package advancedflex.js {
	
	import flash.events.EventDispatcher;
	
	import mx.core.IMXMLObject;

	[DefaultProperty("source")]
	public class JavaScript extends EventDispatcher implements IMXMLObject {
		
		/**
		 * If true,eval expression on this instance created,otherwise do nothing.
		 */
		public var autoEval:Boolean = false;
		
		private var src:String;
		
		/**
		 * Create JavaScript.
		 */
		public function JavaScript() {
			super(this);
		}
		
		/**
		 * @private
		 */
		public function initialized(document:Object, id:String):void {
			if(autoEval) {
				eval();
			}
		}
		
		/**
		 * Eval the Java script is given.<br/>
		 * 执行给予的JavaScript。
		 */
		public function eval():void {
			JS.eval(src);
		}
		
		/**
		 * The JacaScript source.
		 */
		public function set source(src:String):void {
			this.src = src
		}
		
		public function get source():String {
			return src;
		}
	}
}