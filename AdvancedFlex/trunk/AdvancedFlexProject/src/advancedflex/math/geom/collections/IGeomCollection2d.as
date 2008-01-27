package advancedflex.math.geom.collections {
	import advancedflex.math.geom.IArea2d;
	import advancedflex.math.geom.Rect2d;
	import advancedflex.math.geom.Circle2d;
	
	public interface IGeomCollection2d {
		function addArea2d(area:IArea2d):IGeomCollection2d;
		function removeArea2d(area:IArea2d):IGeomCollection2d;
		function queryRect(rect:Rect2d, mode:int):Array;
		function queryCircle(circle:Circle2d):Array;
		function updateArea():IGeomCollection2d;
	}
}