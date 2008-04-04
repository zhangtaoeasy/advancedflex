package advancedflex.utils.overload {
	import advancedflex.utils.overload.patterns.IParamPattern;
	import advancedflex.utils.overload.patterns.RestPattern;
	import advancedflex.utils.overload.patterns.TypePattern;
	
	public class HyperOverloadSupport {
		
		/**
		 * 
		 */
		private var $map:Array;
		
		private var $mapSize:int;
		
		/**
		 * 
		 */
		private var $defaultFunctionName:String;
		
		/**
		 * 
		 * 
		 */
		public function HyperOverloadSupport() {
			$map = [null];
		}
		
		/**
		 * 
		 * @param defaultFunction
		 * @return 
		 * 
		 */
		public function setDefault(defaultFunctionName:String):HyperOverloadSupport {
			$defaultFunctionName = defaultFunctionName;
			return this;
		}
		
		/**
		 * 
		 * @param func
		 * @param types
		 * @return 
		 * 
		 */
		public function register(callback:String, ...patterns):HyperOverloadSupport {
			if(callback != null) {
				if(patterns.length == 0) {
					$map[0] = [];
					$map[0].callback = callback;
				}else{
					$putTypes(patterns, callback);
				}
				$mapSize = $map.length;
				return this;
			}
			throw new ArgumentError("Param:<callback> must not be null.");
		}
		
		private function $putTypes(patterns:Array, callback:String):void {
			var length:int = patterns.length;
			var typesArray:Array = [];
			var rest:Boolean = false;
			for(var i:int = 0; i < length; i++) {
				var tmp:Object = patterns[i];
				var pattern:IParamPattern;
				if(tmp is RestArgs || tmp is RestPattern) {
					pattern = RestPattern.REST_ARGS;
					rest = true;
				}else if(tmp is Class) {
					pattern = TypePattern.getPattern(tmp as Class);
				}else if(tmp is IParamPattern) {
					pattern = tmp as IParamPattern;
				}else{
					throw new TypeError("Param:<...patterns> must be instance of Class or IParamPattern.");
				}
				typesArray.push(pattern);
			}
			typesArray.callback = callback;
			typesArray.rest = rest;
			$map.push(typesArray);
		}
		
		public function invoke(thisObject:Object, args:Array):* {
			return (thisObject.overload::[$getFunctionName(args, args)]).apply(thisObject, args);
		}
		
		private function $getFunctionName(args:Array, resultArgs:Array):String {
			for(var i:int = 0; i < $mapSize; i++) {
				var patterns:Array = $map[i];
				if(
					(patterns.rest && $matchRest(args, patterns)) || 
					$matchNonRest(args, patterns))
				{
					return patterns.callback;
				}
			}
			if($defaultFunctionName) {
				return $defaultFunctionName;
			}
			throw new ArgumentError("No pattern can be match.");
		}
		
		private function $matchNonRest(args:Array, patterns:Array):Boolean {
			var length:int = args.length;
			if(length != patterns.length) {
				return false;
			}
			return $match(args, patterns, length);
		}
		private function $matchRest(args:Array, patterns:Array):Boolean {
			return $match(args, patterns, patterns.length - 1);
		}
		private function $match(args:Array, patterns:Array, length:int):Boolean {
			for(var i:int = 0; i < length; i++) {
				if(!IParamPattern(patterns[i]).matchs(args[i])) {
					return false;
				}
			}
			return true;
		}
	}
}