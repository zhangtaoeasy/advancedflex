package advancedflex.core.process.context {
	
	import advancedflex.core.process.framework.IProcess;
	import advancedflex.core.process.framework.IProcessContext;
	import advancedflex.core.process.framework.IProcessResource;

	public class XMLBasedProcessContext implements IProcessContext {
		
		protected var _realContext:XML;
		
		protected var _context:XML;
		
		protected var _targetList:XMLList;
		
		protected var _resource:IProcessResource;
		
		public function XMLBasedProcessContext(context:XML) {
			this.context = context;
		}
		
		public function queryProcess(identifier:*):IProcess {
			return _resource.query(identifier);
		}
		
		public function queryNext(now:*, next:*):IProcess {
			return queryProcess(_targetList.(@id == now)[0].forwards[0].*.(@name == next)[0].@id);
		}
		
		public function get resource():IProcessResource {
			return _resource;
		}
		
		public function set resource(resource:IProcessResource):void {
			_resource = resource;
		}
		
		public function get context():* {
			return _realContext
		}
		
		public function set context(value:*):void {
			_realContext = value;
			parseRealContext();
		}
		
		protected function parseRealContext():void {
			default xml namespace = pocs;
			if(_realContext.targets == null) {
				throw new ArgumentError("This context don't have targets child.");
			}
			var targets:XMLList = _realContext.targets[0].*;
			if(_realContext["target-mapping"] == null) {
				_context = _realContext.copy();
			}else{
				var mapping:Object = createMapping(_realContext["target-mapping"]);
				for each(var v:XML in targets) {
					var realId:String = mapping[v.@id];
					if(realId != null) {
						v.@id = realId;
					}
					var forwardList:XMLList = v.forwards[0].*;
					for each(var v2:XML in forwardList) {
						realId = mapping[v2.@id];
						if(realId != null) {
							v2.@id = realId;
						}
					}
				}
			}
			_targetList = targets;
		}
		
		protected function createMapping(xmllist:XMLList):Object {
			var result:Object = {};
			for each(var v:XML in xmllist) {
				result[v.@id] = v.@identifier;
			}
			return result;
		}
	}
}