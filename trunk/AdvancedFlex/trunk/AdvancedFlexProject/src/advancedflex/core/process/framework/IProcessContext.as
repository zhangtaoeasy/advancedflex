package advancedflex.core.process.framework {
	
	public interface IProcessContext {
		
		function queryProcess(identifier:*):IProcess;
		
		function queryNext(now:*, next:*):IProcess;
		
		function get resource():IProcessResource
		
		function set resource(resource:IProcessResource):void;
		
		function get context():*;
		
		function set context(value:*):void;
	}
}