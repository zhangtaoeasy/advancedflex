package advancedflex.core.process.framework {
	public interface ISyncProcess extends IProcess {
		function forward(identifier:*, args:ProcessArgs):void;
		
		function onError(e:Error):void;
	}
}