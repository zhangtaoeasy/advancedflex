package advancedflex.core.process.framework {
	public interface IProcessRunner {
		
		function get startProcess():*;
		
		function set startProcess(identifier:*):void;
		
		function get context():IProcessContext;
		
		function set context(value:IProcessContext):void;
		
		function get resource():IProcessResource;
		
		function set resource(value:IProcessResource):void;
		
		function start(...args):*;
	}
}