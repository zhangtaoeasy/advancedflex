package {
	
	import flash.display.*;
	
	public class AdvancedFlex extends Sprite {
		public function AdvancedFlex() {
			
		}
		public function foo(x:int, y:int):int {
			return 	x>0 ? (
						y>0 ? 1 :
						y<0 ? 4 :
						-1
					):
					x<0 ? (
						y>0 ? 2 :
						y<0 ? 3 :
						-1
					):
					-1;
		}
	}
}
