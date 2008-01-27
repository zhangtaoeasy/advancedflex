package advancedflex.utils {
	import flash.utils.Dictionary;
	
	public class FlyWeightManager {
		
		private static const $root:Dictionary = new Dictionary(true);
		
		private var $holder:Dictionary;
		
		public function FlyWeightManager(clazz:Class) {
			$holder = 	$root[clazz] ? $root[clazz] :
						$root[clazz] = new Dictionary(true);
		}
		
		public function getInstance(...args):* {
			for(var v:* in $holder) {
				(v as IFlyWeightObject).setupFlyWeight(args);
				delete $holder[v];
				return v;
			}
		}
		public function recovery(v:IFlyWeightObject, ...args):void {
			v.teardownFlyWeight(args);
			$holder[v] = null;
		}
	}
}