package advancedflex.utils {
	import flash.net.URLVariables;
	
	internal class URLVaribaleDiffSet implements IDiffSet {
		public function URLVaribaleDiffSet(src:Array) {
			this.src = src;
		}
		private var src:Array;
		public function apply(oldValue:*):* {
			var oldv:URLVariables = new URLVariables(oldValue);
			var result:URLVariables = new URLVariables(oldValue);
			for each(var v:DiffMemento in src) {
				switch(v.type) {
					case DiffMemento.CHANGE :
						result[v.name] = v.newValue;
						break;
					case DiffMemento.ADD :
						result[v.name] = v.newValue;
						break;
					case DiffMemento.REMOVE :
						delete result[v.name];
				}
			}
			return result.toString();
		}
		
		public function recovery(newValue:*):* {
			var newv:URLVariables = new URLVariables(newValue);
			var result:URLVariables = new URLVariables(newValue);
			for each(var v:DiffMemento in src) {
				switch(v.type) {
					case DiffMemento.CHANGE :
						result[v.name] = v.oldValue;
						break;
					case DiffMemento.ADD :
						delete result[v.name];
						break;
					case DiffMemento.REMOVE :
						result[v.name] = v.oldValue;
				}
			}
			return result.toString();
		}
		
		public function get source():Array {
			return src;
		}
		
	}
}