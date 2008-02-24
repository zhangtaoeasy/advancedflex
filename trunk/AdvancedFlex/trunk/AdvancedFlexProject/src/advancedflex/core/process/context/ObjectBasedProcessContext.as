package advancedflex.core.process.context {
	
	import advancedflex.core.process.framework.IProcess;
	import advancedflex.core.process.framework.IProcessContext;
	import advancedflex.core.process.framework.IProcessResource;

	public class ObjectBasedProcessContext implements IProcessContext {
		
		protected var _context:Object;
		
		protected var _resource:IProcessResource;
		
		public function queryNext(now:*, next:*):IProcess {
			return _resource.query(
				_context[now].forwards[next]
			);
		}
		
		public function queryProcess(identifier:*):IProcess {
			return _resource.query(identifier);
		}
		
		public function get resource():IProcessResource {
			return _resource;
		}
		
		public function set resource(resource:IProcessResource):void {
			_resource = resource;
		}
		
		public function get context():* {
			return _context
		}
		
		public function set context(value:*):void {
			_context = value;
		}
	}
}