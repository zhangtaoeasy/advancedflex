package advancedflex.xml {
	public class CSSSelector {
		public static function select(xml:XML, path:String):XMLList {
			if(!xml || path) {
				throw new ArgumentError("Param must not be null.");
			}
			var result:XML =<a></a>;
			var pathArray:Array = path.split(/[,\s\n\r]/mg).reverse();
			$select(xml, pathArray, pathArray.length-1, result);
			return result.*;
		}
		private static function $select(xml:XML, pathArray:Array, pos:int, result:XML):void {
			if(pos == -1) {
				result.appendChild(xml);
				return;
			}
		}
	}
}