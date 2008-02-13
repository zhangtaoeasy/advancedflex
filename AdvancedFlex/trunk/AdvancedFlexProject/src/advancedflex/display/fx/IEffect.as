package advancedflex.display.fx
{
	import flash.display.DisplayObject;
	
	public interface IEffect
	{
		function applay(displayObject:DisplayObject):void;
		function remove():void;
	}
}