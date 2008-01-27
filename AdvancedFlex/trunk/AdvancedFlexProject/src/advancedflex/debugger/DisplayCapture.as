////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://advancedflex.googlecode.com/. 
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package advancedflex.debugger {
	
	import flash.display.BitmapData;
	import flash.display.IBitmapDrawable;
	import flash.geom.Rectangle;

	/**
	 * @private
	 * 画面的抓捕工具。可以抓捕画面的变化。
	 */
	internal class DisplayCapture implements IDisplayCapture {
		
		private var $buffer:Array;
		
		/**
		 * @private
		 * 创建 DisplayCapture。
		 */
		public function DisplayCapture() {
			$buffer = new Array();
		}
		
		/**
		 * @private
		 * 抓捕画面。
		 * 
		 * @param drawable 画面。
		 * @param rect 定义画面大小和位置的矩形。
		 * @param alias 别名。
		 */
		public function capture(
			drawable:IBitmapDrawable, 
			rect:Rectangle,
			alias:String=""
			):void 
		{
			var buf:BitmapData = new BitmapData(rect.width, rect.height);
			buf.draw(drawable, null, null, null, rect);
			$buffer.push(buf);
		}
		
		/**
		 * @private
		 * 释放用来存储 BitmapData 对象的内存。
		 * 对此 IDisplayCapture 实例的方法或属性的所有后续调用都将失败，并引发异常。
		 */
		public function dispose():void {
			for each(var v:BitmapData in $buffer) {
				v.dispose();
			}
			$buffer = null;
		}
		
		/**
		 * @private
		 * 发送抓捕的画面到控制端。
		 */
		public function send():void {
			// TODO
		}
	}
}