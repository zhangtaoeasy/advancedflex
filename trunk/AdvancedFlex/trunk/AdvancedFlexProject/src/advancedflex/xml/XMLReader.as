package advancedflex.xml {
	public class XMLReader {
		private var _src:XML;
		private var _p:XML;
		public function XMLReader(source:XML) {
			_src = _p = source;
		}
		public function get value():XML {
			return _p;
		}
		public function root():XMLReader {
			_p = _src;
			return this;
		}
		public function parent(index:int):XMLReader {
			var _parent:* = _p.parent();
			if(_parent is XMLList) {
				_p = _parent.parent()
			}
			return this;
		}
		public function child(index:int):XMLReader {
			_p = _p.children()[index];
			return this;
		}
		public function firstChild():XMLReader {
			_p = _p.children()[0];
			return this;
		}
		public function lastChild():XMLReader {
			var children:XMLList = _p.children();
			_p = children[children.length() - 1];
			return this;
		}
		public function next():XMLReader {
			var index:int = _p.childIndex();
			_p = _p.parent().children()[index + 1];
			return this;
		}
		public function hasNext():Boolean {
			var index:int = _p.childIndex();
			if(index == _p.parent().children().length() - 1) {
				return false;
			}
			return true;
		}
		public function prev():XMLReader {
			var index:int = _p.childIndex();
			_p = _p.parent().children()[index - 1];
			return this;
		}
		public function hasPrev():Boolean {
			var index:int = _p.childIndex();
			if(index == 0) {
				return false;
			}
			return true;
		}
	}
}