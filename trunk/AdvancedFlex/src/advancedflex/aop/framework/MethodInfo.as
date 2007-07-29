package advancedflex.aop.framework {
	public class MethodInfo {
		public var target:*;
		public var name:*;
		public var args:Array;
		public var result:*;
		
		public function MethodInfo(name:*, args:Array, target:*) {
			this.name = name;
			this.args = args;
			this.target = target;
			result = null;
		}
		
		public function invoke():* {
			result = target[name].apply(target, args);
			return result;
		}
		
		public function clone():MethodInfo {
			var result:MethodInfo = new MethodInfo(name, args.slice(), target);
			result.result = this.result;
			return result;
		}
	}
}