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

package advancedflex.math.geom {
	
	import advancedflex.utils.CompareUtil;
	import advancedflex.utils.FloatUtil;
	
	/**
	 * Rect2d 对象是一个扩展了的矩形。它允许长、宽为负数。
	 * Rect2d 对象是按其位置（由它左上角的点 (x, y)）以及宽度和高度定义的矩形区域。
	 * Rect2d 类的 x、y、width 和 height 属性相互独立；
	 * 更改一个属性的值不会影响其它属性。
	 * 但是，right 和 bottom 属性与这四个属性是整体相关的。
	 * 例如，如果更改 right 属性的值，则 width 属性的值将发生变化；
	 * 如果更改 bottom 属性，则 height 属性的值将发生变化。
	 */
	public class Rect2d implements IArea2d {
		
		protected var _dest:Vector2d;
		
		/**
		 * 矩形左上角的 x 坐标。
		 */
		public final function get x():Number {
			return _dest.x;
		}
		
		public final function set x(v:Number):void {
			_dest.x = v;
		}
		
		/**
		 * 矩形左上角的 y 坐标。
		 */
		public final function get y():Number {
			return _dest.y;
		}
		
		public final function set y(v:Number):void {
			_dest.y = v;
		}
		
		/**
		 * 矩形的宽度。它可以为负数。
		 * <p><img src="rect2d.png" alt="[rect2d.png]"/></p>
		 */
		public var width:Number;
		
		/**
		 * 矩形的高度。它可以为负数。
		 */
		public var height:Number;
		
		/**
		 * 创建一个新 Rect2d 对象，
		 * 其左上角由 x 和 y 参数指定，并具有指定的 width 和 height 参数。
		 * 
		 * @param x 矩形左上角的 x 坐标。
		 * @param y 矩形左上角的 y 坐标。
		 * @param width 矩形的宽度。它可以为负数。
		 * @param height 矩形的高度。它可以为负数。
		 */
		public function Rect2d(dest:Vector2d = null, width:Number = 0, height:Number = 0) {
			_dest = dest || new Vector2d();
			this.width = width;
			this.height = height;
		}
		
		/**
		 * 得到一个能完全包含该对象的最小的矩形。实际上它返回自身及的副本。
		 * 
		 * @return 自身及的副本。
		 */
		public final function get rect():Rect2d {
			return clone() as Rect2d;
		}
		
		public function get area():Number {
			return width*height;
		}
		
		/**
		 * 矩形左上角的 x 坐标。
		 * 
		 * @return 矩形左上角的 x 坐标。
		 */
		public final function get left():Number {
			return x;
		}
		
		public final function set left(v:Number):void {
			x = v;
		}
		
		/**
		 * x 和 width 属性的和。
		 * 
		 * @return x 和 width 属性的和。
		 * 
		 */
		public final function get right():Number {
			return x+width;
		}
		
		public final function set right(v:Number):void {
			width = v - x;
		}
		
		/**
		 * 矩形左上角的 y 坐标。
		 * 
		 * @return 矩形左上角的 y 坐标。
		 */
		public final function get top():Number {
			return y
		}
		
		public final function set top(v:Number):void {
			y = v;
		}
		
		/**
		 * y 和 height 属性的和。
		 * 
		 * @return y 和 height 属性的和。
		 */
		public final function get bottom():Number {
			return y+width
		}
		
		public final function set bottom(v:Number):void {
			height = v - y;
		}
		
		/**
		 * 矩形的左上角的位置。
		 * 
		 * @return 矩形的左上角的位置。
		 */
		public final function get topLeft():Vector2d {
			return new Vector2d(x, y);
		}
		
		public final function set topLeft(v:Vector2d):void {
			x = v.x;
			y = v.y;
		}
		
		/**
		 * 矩形的右上角的位置。
		 * 
		 * @return 矩形的右上角的位置。
		 */
		public final function get topRight():Vector2d {
			return new Vector2d(x+width, y);
		}
		
		public final function set topRight(v:Vector2d):void {
			top = v.y;
			right = v.x;
		}
		
		/**
		 * 矩形的左下角的位置。
		 * 
		 * @return 矩形的左下角的位置。
		 */
		public final function get bottomLeft():Vector2d {
			return new Vector2d(left, bottom);
		}
		
		public final function set bottomLeft(v:Vector2d):void {
			left = v.x;
			bottom = v.y;
		}
		
		/**
		 * 矩形的右下角的位置。
		 * 
		 * @return 矩形的右下角的位置。
		 */
		public final function get bottomRight():Vector2d {
			return new Vector2d(right, bottom);
		}
		
		public final function set bottomRight(v:Vector2d):void {
			right = v.x;
			bottom = v.y;
		}
		
		/**
		 * Rect2d 对象的大小，该对象表示为具有 width 和 height 属性的值的 Point 对象。
		 * 
		 * @return Rect2d 对象的大小。
		 */
		public final function get size():Vector2d {
			return new Vector2d(width, height);
		}
		
		public final function set size(v:Vector2d):void {
			width = v.x;
			height = v.y;
		}
		
		/**
		 * 中心，即Rect2d 对象的两条对角线的交点。
		 * 
		 * @return 中心。
		 */
		public function get center():Vector2d {
			return new Vector2d(x + width/2, y + height/2);
		}
		
		public function set center(v:Vector2d):void {
			offsetTo(new Vector2d().sub(v, center));
		}
		
		/**
		 * 确定由此 Rect2d 对象定义的矩形区域内是否包含指定的点。
		 * 
		 * @param v 点。
		 * @return 如果 Rect2d 对象包含指定的点，则值为 true；否则为 false。
		 */
		public final function contains(v:Vector2d):Boolean {
			return x<=v.x && v.x<=x+width
				&& y<=v.y && v.y<=y+height;
		}
		
		/**
		 * 确定此 Rect2d 对象内是否包含由 rect 参数指定的 Rect2d 对象。
		 * 如果一个 Rect2d 对象完全在另一个 Rect2d 的边界内(包含边界)，
		 * 我们说第二个 Rect2d 包含第一个 Rectangle。
		 * 
		 * @param rect 所检查的 Rect2d 对象。
		 * @return 如果此 Rect2d 对象包含您指定的 Rect2d 对象，
		 * 则返回 true 值，否则返回 false。
		 */
		public final function containsRect(rect:Rect2d):Boolean {
			return 	left <= rect.left
				&&	right >= rect.right
				&&	top <= rect.top
				&&	bottom >= rect.bottom;
		}
		
		/**
		 * 按指定量增加该 Rect2d 对象的大小。 
		 * 保持 Rect2d 对象的左上角不变，
		 * 使用 v.x 值横向增加它的大小，使用 v.y 值纵向增加它的大小。
		 * 
		 * @param v 此 Vector2d 对象的 x 属性用于增加 Rect2d 对象的水平尺寸。
		 * y 属性用于增加 Rect2d 对象的垂直尺寸。
		 * @return 自己
		 */
		public function inflateTo(v:Vector2d):Rect2d {
			//TODO
			width += v.x;
			height += v.y;
			return this;
		}
		
		/**
		 * 按指定量增加指定的 Rect2d 对象的大小，再把结果返回给自己。 
		 * 保持 Rect2d 对象的左上角不变，
		 * 使用 v.x 值横向增加它的大小，使用 v.y 值纵向增加它的大小。
		 * 
		 * @param v 此 Vector2d 对象的 x 属性用于增加 Rect2d 对象的水平尺寸。
		 * y 属性用于增加 Rect2d 对象的垂直尺寸。
		 * @return 自己
		 */
		public function inflate(rect:Rect2d, v:Vector2d):Rect2d {
			width = rect.width + v.x;
			height = rect.height + v.y;
			return this;
		}
		
		/**
		 * 平移该 Rect2d 对象。
		 * 
		 * @param dxy 偏移量的 (dx,dy)。
		 * @return 自己。
		 */
		public function offsetTo(dxy:Vector2d):Rect2d {
			x += dxy.x;
			y += dxy.y;
			return this;
		}
		
		/**
		 * 平移指定的 Rect2d 对象，再把结果返回给自己。
		 * 
		 * @param dxy 偏移量的 (dx,dy)。
		 * @param rect 指定的 Rect2d 对象。
		 * @return 自己。
		 */
		public function offset(dxy:Vector2d, rect:Rect2d):Rect2d {
			x = rect.x + dxy.x;
			y = rect.x + dxy.y;
			return this;
		}
		
		/**
		 * 确定在 toCompare 参数中指定的对象是否等于此 Rect2d 对象。
		 * 此方法将某个对象的 x、y、width 和 height 属性
		 * 与此 Rect2d 对象所对应的相同属性进行比较。
		 * @param toCompare 要与此 Rect2d 对象进行比较的矩形。
		 * @param tol 浮点小数允许的最大误差。
		 * @return 如果对象具有与此 Rect2d 对象完全相同的
		 *  x、y、width 和 height 属性值，则返回 true 值，否则返回 false。
		 * 
		 */
		public function equals(toCompare:*, tol:Number = 1e-12):Boolean {
			return 	_dest.equals(toCompare._dest, tol)
				&&	FloatUtil.equals(width, toCompare.width, tol)
				&&	FloatUtil.equals(height, toCompare.height, tol);
		}
		
		public function clone():IArea2d {
			return new Rect2d(_dest.clone() as Vector2d, width, height);
		}
	}
}