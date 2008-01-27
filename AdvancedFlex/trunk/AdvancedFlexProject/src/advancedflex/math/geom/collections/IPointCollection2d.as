package advancedflex.math.geom.collections {
	import advancedflex.math.geom.Vector2d;
	
	public interface IPointCollection2d extends IGeomCollection2d {
		function add(p:Vector2d):IPointCollection2d;
		function remove(p:Vector2d):IPointCollection2d;
		function update(p:Vector2d):IPointCollection2d;
	}
}