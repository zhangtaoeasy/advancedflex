package advancedflex.js {
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public final class JS {
		/**
		 * Eval the Java script is given.<br/>
		 * 执行给予的JavaScript。
		 * @param src javaScript
		 */
		public static function eval(src:String):void {
			if (src != null) {
				var commentPattern:RegExp = /(\/\*([^*]|[\r\n]|(\*+([^*\/]|[\r\n])))*\*+\/)|((^|[^:\/])(\/\/.*))/g;
				src = src.replace (commentPattern, "");
			}
			var u:URLRequest = new URLRequest ("javascript:eval('" + src + "');");
			navigateToURL(u,"_self");
		}
	}
}