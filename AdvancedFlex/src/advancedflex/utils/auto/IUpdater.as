package advancedflex.utils.auto {
	
	import flash.events.IEventDispatcher;
	
	public interface IUpdater extends IEventDispatcher {
		function update():void;
	}
}