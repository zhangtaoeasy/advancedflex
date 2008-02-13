package advancedflex.core {
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * 抽象的 EventDispatcher。
	 * 实现 IEventDispatcher 接口的类的模板。
	 */
	public class AbstractEventDispatcher implements IEventDispatcher {
		protected var _listener:EventDispatcher;
		public function AbstractEventDispatcher() {
			_listener = new EventDispatcher(this);
		}
		
		public function hasEventListener(type:String):Boolean {
			return _listener.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean {
			return _listener.willTrigger(type);
		}
		
		public function addEventListener(
			type:String, listener:Function, useCapture:Boolean=false, 
			priority:int=0.0, useWeakReference:Boolean=false):void 
		{
			_listener.addEventListener(
				type, listener, useCapture,
				priority, useWeakReference);
		}
		
		public function removeEventListener(
			type:String, listener:Function, useCapture:Boolean=false):void
		{
			_listener.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean {
			return _listener.dispatchEvent(event);
		}
	}
}