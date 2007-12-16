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
	 * 画面的抓捕工具。可以抓捕画面的变化。
	 */
	public interface IDisplayCapture {
		
		/**
		 * 抓捕画面。
		 * 
		 * @param drawable 画面。
		 * @param rect 定义画面大小和位置的矩形。
		 * @param alias 别名。
		 */
		function capture(
			drawable:IBitmapDrawable, 
			rect:Rectangle, 
			alias:String = ""
			):void;
		
		/**
		 * 释放用来存储 BitmapData 对象的内存。
		 * 对此 IDisplayCapture 实例的方法或属性的所有后续调用都将失败，并引发异常。
		 */
		function dispose():void;
		
		/**
		 * 发送抓捕的画面到控制端。
		 */
		function send():void;
	}
}