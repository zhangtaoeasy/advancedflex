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
	
	/**
	 * <p>The factory of LoopControl.
	 * You'd better use <code>LoopControlFactory.create(A,1)</code> instead of using <code>new A(1)</code>.
	 * So that you can remove all debugger code'effect by changer Namespace.</p>
	 * 
	 * <p>循环控制的工厂。你最好使用此工厂而不使用直接构造来创建循环控制的实例。
	 * 只有这样，你才可以只改变命名空间来削除调试的代码的效果。</p>
	 * 
	 * @author Stephen
	 */
	public class LoopControlFactory {
		
		use namespace debug;
		
		/**
		 * <p>Create a new LoopControl instance.</p>
		 * 
		 * <p>创建一个新的LoopControl实例</p>
		 * 
		 * @param type The Class of LoopControl. LoopControl的子类。
		 * @param args The list of Args. 参数列表。
		 * 
		 * @return LoopControl
		 */
		debug static function create(type:Class, ...args):ILoopControl {
			return new type(args);
		}
		
		use namespace release;
		release static function create(type:Class, ...args):ILoopControl {
			return new ReleaseLoopControl(args);
		}
	}
}