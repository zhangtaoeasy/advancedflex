package advancedflex.io.codec {
	import flash.utils.describeType;
	
	public class URLVariablesEncoder {
		public static function encode(o:Object):String {
			var varList:XMLList = describeType(o).variable;
			var result:String = "";
			for(var i:String in o) {
				result += encodeURIComponent(i) + "=" + encodeURIComponent(o[i]) + "&";
			}
			for each(var v:XML in varList) {
				result += encodeURIComponent(v.@name) + "=" + encodeURIComponent(o[v.@name]) + "&";
			}
			return result.substring(0, result.length-1);
		}
	}
}