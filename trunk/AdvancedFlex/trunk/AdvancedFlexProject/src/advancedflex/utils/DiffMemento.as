package advancedflex.utils {
	public class DiffMemento {
		
		public function DiffMemento(name:String, type:int, oldValue:*, newValue:*) {
			this.name = name;
			this.type = type;
			this.oldValue = oldValue;
			this.newValue = newValue;
		}
		
		public var name:String;
		public var type:int;
		public var oldValue:*;
		public var newValue:*;
		
		public static const ADD:int = 0;
		public static const REMOVE:int = 0;
		public static const CHANGE:int = 0;
	}
}