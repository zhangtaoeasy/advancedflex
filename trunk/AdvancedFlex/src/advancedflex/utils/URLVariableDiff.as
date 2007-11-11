package advancedflex.utils {
	import flash.net.URLVariables;
	
	public class URLVariableDiff {
		public static function compare(oldValue:String, newValue:String):IDiffSet {
			var oldv:URLVariables = new URLVariables(oldValue);
			var newv:URLVariables = new URLVariables(newValue);
			var changeList:Array = [];
			for(var v:String in oldv) {
				if(!oldv[v] && newv[v]) {
					changeList.push(new DiffMemento(v, DiffMemento.ADD, null, newv[v]));
				}
				if(!newv[v] && oldv[v]) {
					changeList.push(new DiffMemento(v, DiffMemento.REMOVE, oldv[v], null));
				}
				if(oldv[v] != newv[v]) {
					changeList.push(new DiffMemento(v, DiffMemento.CHANGE, oldv[v], newv[v]));
				}
			}
			return new URLVaribaleDiffSet(changeList);
		}
	}
}