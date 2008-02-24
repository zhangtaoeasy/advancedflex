package advancedflex.core.process.framework {
	
	import flash.events.IEventDispatcher;
	
	/**
	 * 
	 */
	[Event(name="start", type="advancedflex.core.process.events.AsyncProcess")]
	
	/**
	 * 
	 */
	[Event(name="end", type="advancedflex.core.process.events.AsyncProcess")]
	
	/**
	 * 
	 */
	[Event(name="error", type="advancedflex.core.process.events.AsyncProcess")]
	
	/**
	 * 
	 * @author WeiHe
	 * 
	 */
	public interface IAsyncProcess extends IProcess, IEventDispatcher {
		
	}
}