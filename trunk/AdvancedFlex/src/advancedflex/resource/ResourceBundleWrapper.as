package advancedflex.resource {
	import mx.resources.ResourceBundle;
	import flash.utils.*;
	import flash.errors.IllegalOperationError;

	use namespace flash_proxy;
	
	internal class ResourceBundleWrapper extends Proxy {
		private var content:ResourceBundle;
		public function ResourceBundleWrapper(resource:ResourceBundle) {
			super();
			content = resource;
		}
		flash_proxy override function getProperty(name:*):* {
			return content.getString(name);
		}
		
		flash_proxy override function setProperty(name:*,value:*):void {
			throw new IllegalOperationError("This Object is readonly.");
		}
		
		flash_proxy override function deleteProperty(name:*):Boolean {
			return false
		}
		
		flash_proxy override function hasProperty(name:*):Boolean {
			throw new IllegalOperationError("Unsupport Method");
		}
	}
}