package advancedflex.io.format {
	import flash.net.URLVariables;
	
	public class URLVariablesDecoder {
		public static function decode(str:String):URLVariables {
			return new URLVariables(str);
		}
	}
}