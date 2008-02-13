package advancedflex.math.geom {
	
	public interface IArea2d {
		function get rect():Rect2d;
		
		function equals(toCompare:*, tol:Number = 1e-12):Boolean;
		
		function get area():Number;
		
		function clone():IArea2d;
	}
}