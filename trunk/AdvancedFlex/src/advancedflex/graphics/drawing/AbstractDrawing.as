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

package advancedflex.graphics.drawing {
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.display.Graphics;

	public class AbstractDrawing implements IDrawing {
		
		protected var g:Graphics;
		
		public function beginFill(color:uint, alpha:Number=1.0):void {
			g.beginFill(color, alpha);
		}
		
		public function lineTo(x:Number, y:Number):void {
			g.lineTo(x, y);
		}
		
		public function endFill():void {
			g.endFill();
		}
		
		public function drawRect(
			x:Number, y:Number, 
			width:Number, height:Number):void 
		{
			g.drawRect(x, y, width, height);
		}
		
		public function lineStyle(
			thickness:Number, 
			color:uint=0, 
			alpha:Number=1.0, 
			pixelHinting:Boolean=false, 
			scaleMode:String="normal", 
			caps:String=null, 
			joints:String=null, 
			miterLimit:Number=3):void 
		{
			g.lineStyle(
				thickness, color, alpha, 
				pixelHinting, scaleMode, caps, 
				joints, miterLimit
			);
		}
		
		public function clear():void
		{
			g.clear();
		}
		
		public function drawCircle(x:Number, y:Number, radius:Number):void {
			g.drawCircle(x, y, radius);
		}
		
		public function get graphics():Graphics
		{
			return g;
		}
		
		public function beginBitmapFill(
			bitmap:BitmapData, matrix:Matrix=null, 
			repeat:Boolean=true, smooth:Boolean=false):void
		{
			g.beginBitmapFill(bitmap, matrix, repeat, smooth);
		}
		
		public function curveTo(
			controlX:Number, controlY:Number, 
			anchorX:Number, anchorY:Number):void
		{
			g.curveTo(controlX, controlY, anchorX, anchorY);
		}
		
		public function moveTo(x:Number, y:Number):void {
			g.moveTo(x, y);
		}
		
		public function drawEllipse(
			x:Number, y:Number, width:Number, height:Number):void
		{
			g.drawEllipse(x, y, width, height);
		}
		
		public function lineGradientStyle(
			type:String, colors:Array, alphas:Array, ratios:Array, 
			matrix:Matrix=null, spreadMethod:String="pad", 
			interpolationMethod:String="rgb", focalPointRatio:Number=0):void
		{
			g.lineGradientStyle(
				type, colors, alphas, ratios, 
				matrix, spreadMethod, interpolationMethod, focalPointRatio
			);
		}
		
		public function drawRoundRect(
			x:Number, y:Number, width:Number, height:Number, 
			ellipseWidth:Number, ellipseHeight:Number):void
		{
			g.drawRoundRect(x, y, width, height, ellipseWidth, ellipseHeight);
		}
		
		public function beginGradientFill(
			type:String, colors:Array, alphas:Array, ratios:Array, 
			matrix:Matrix=null, spreadMethod:String="pad", 
			interpolationMethod:String="rgb", focalPointRatio:Number=0):void
		{
			g.beginGradientFill(
				type, colors, alphas, ratios,
				matrix, spreadMethod,
				interpolationMethod, focalPointRatio
			);
		}
		
	}
}