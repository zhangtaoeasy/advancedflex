package advancedflex.math.geom.collections {
	import advancedflex.math.geom.IArea2d;
	import advancedflex.math.geom.Rect2d;
	import advancedflex.math.geom.Vector2d;
	import advancedflex.math.geom.Circle2d;

	public class QuadTree2d implements IPointCollection2d {
		
		protected var root:QTree;
		
		public function remove(p:Vector2d):IPointCollection2d {
			return null;
		}
		
		public function add(p:Vector2d):IPointCollection2d {
			return null;
		}
		
		public function update(p:Vector2d):IPointCollection2d {
			return null;
		}
		
		public function queryRect(rect:Rect2d, mode:int):Array {
			return null;
		}
		
		public function updateArea():IGeomCollection2d {
			return null;
		}
		
		public function queryCircle(circle:Circle2d):Array {
			return null;
		}
		
		public function addArea2d(area:IArea2d):IGeomCollection2d {
			add(Vector2d(area));
			return this;
		}
		
		public function removeArea2d(area:IArea2d):IGeomCollection2d {
			remove(Vector2d(area));
			return this;
		}
		
	}
}
	import advancedflex.math.geom.Vector2d;
	import advancedflex.utils.IFlyWeightObject;
	
class QTree {
	
}
class QNode implements IFlyWeightObject {
	
	internal var nodeCount:int = 0;
	
	internal var parent:QNode;
	
	internal var center:Vector2d;
	
	internal var q1:QNode;
	
	internal var q2:QNode;
	
	internal var q3:QNode;
	
	internal var q4:QNode;
	
	internal var value:Vector2d;
	
	public function QNode(
		center:Vector2d = null, parent:QNode = null,
		q1:QNode = null, q2:QNode = null,
		q3:QNode = null, q4:QNode = null)
	{
		this.parent = parent;
		this.center = center || Vector2d.ZERO;
		this.q1 = q1 || (nodeCount++, null);
		this.q2 = q2 || (nodeCount++, null);
		this.q3 = q3 || (nodeCount++, null);
		this.q4 = q4 || (nodeCount++, null);
	}
	public function add(v:Vector2d):void {
		if(!value) {
			
		}
	}
	public function setupFlyWeight(args:Array):void {
		
	}
	
	public function teardownFlyWeight(args:Array):void {
		value = null;
		parent = q1 = q2 = q3 = q4 = null;
	}
}












