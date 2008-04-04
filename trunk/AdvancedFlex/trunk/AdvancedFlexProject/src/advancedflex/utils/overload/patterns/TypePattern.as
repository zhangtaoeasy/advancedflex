package advancedflex.utils.overload.patterns {
	import flash.utils.Dictionary;
	
	public final class TypePattern implements IParamPattern {
		
		private var $type:Class;
		
		private static const $map:Dictionary = new Dictionary();
		public static function getPattern(type:Class):TypePattern {
			if($map[type] != null)
				return $map[type];
			return $map[type] = new TypePattern(type);
		}
		public function TypePattern(type:Class) {
			$type = type;
		}

		public function matchs(arg:*):Boolean {
			return arg is $type;
		}
	}
}