package advancedflex.ref {
	import flash.utils.Dictionary;
	
	public class WeekReference implements IReference {
		
		private var _holder:Dictionary;
		
		public function Reference(target:*) {
			_holder = new Dictionary(true);
			_holder[target] = null;
		}
		
		public function get target():* {
			for(var i:* in _holder) {
				return i;
			}
		}
		
		public function set target(v:*):void {
			for(var i:* in _holder) {
				delete i;
			}
		 	_holder[v] = null;
		}
	}
}