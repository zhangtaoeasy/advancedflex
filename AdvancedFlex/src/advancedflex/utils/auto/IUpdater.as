package advancedflex.utils.auto {
	
	import flash.events.IEventDispatcher;
	
	public interface IUpdater implements IEventDispatcher {
		function update():void;
	}
}