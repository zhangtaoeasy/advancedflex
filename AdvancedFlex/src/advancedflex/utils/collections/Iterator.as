/////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
package advancedflex.utils.collections {
	/**
	 * 对 collection 进行迭代的迭代器。
	 * 
	 * 迭代器允许调用者利用定义良好的语义在迭代期间从迭代器所指向的 collection 移除元素。 
	 * 此接口是 Advanced Flex Collections Framework 的成员。
	 */
	public interface Iterator {
		/**
		 * 返回迭代的下一个元素。
		 * 
		 * @return 迭代的下一个元素。
		 * @throw advancedflex.errors.NoSuchItemError
		 */
		function next():*;
		/**
		 * 如果仍有元素可以迭代，则返回 true。（换句话说，如果 next 返回了元素而不是抛出异常，则返回 true）。
		 * 
		 * @return 如果迭代器具有多个元素，则返回 true。
		 */
		function hasNext():Boolean;
		/**
		 * 从迭代器指向的 collection 中移除迭代器返回的最后一个元素（可选操作）。
		 * 
		 * 每次调用 next 只能调用一次此方法。
		 * 如果进行迭代时用调用此方法之外的其他方式修改了该迭代器所指向的 collection，则迭代器的行为是不确定的。
		 */
		function remove():void;
	}
}