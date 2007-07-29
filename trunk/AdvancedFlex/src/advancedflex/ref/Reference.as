package advancedflex.ref {
	public class Reference implements IReference {
		private var _target:*;
		public function Reference(target:*) {
			_target = target;
		}
		public function get target():* {
			return _target;
		}
		public function set target(v:*):void {
		 	_target = v;
		}
	}
}