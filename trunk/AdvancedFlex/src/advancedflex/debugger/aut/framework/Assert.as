/////////////////////////////////////////////////////////////////////////////
//Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
/////////////////////////////////////////////////////////////////////////////
package advancedflex.debugger.aut.framework {
	
	import advancedflex.debugger.aut.framework.errors.AssertionError;
	
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	
	import mx.utils.ObjectUtil;

	/**
	 * <p>A set of assertion methods useful for writing tests. 
	 * Only failed assertions are recorded. 
	 * These methods can be used directly: Assert.assertEquals(...), however, 
	 * they read better if they are referenced through static import:
	 * import static org.junit.Assert.*;
	 * ...
	 * assertEquals(...);</p>
	 * 
	 * <p>一个用于测试的方法集合。</p>
	 * 
	 * @langversion ActionScript 3.0
	 * 
	 * @playerversion Flash 9
	 * 
	 * @see advancedflex.debugger.aut.errors.AssertionError
	 * @author Stephen
	 */
	public final class Assert {
		
		/**
		 * <p>Asserts that two objects are equal.It uses <code>ObjectUtil.compare</code> to conpare</p>
		 * 
		 * <p>测试两个对象是否相等。它用<code>ObjectUtil.compare</code>来比较。</p>
		 * 
		 * @see mx.utils.ObjectUtil#compare
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param expected Expected value.Not be null. 期待的对象（不能为 null ）。
		 * @param actual The value to check against expected. 事实上得到的对象。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function equals(expected:*, actual:*, message:String = ""):void {
			if(expected == null)
				errorMessage(message, "Expected is null.");
			if(actual == null)
				errorMessage(message, "Actual is null.");
			if(ObjectUtil.compare(expected, actual, -1) != 0) {
				errorMessage(message, "expected:<" + expected + "> but was:<" + actual + ">");
			}
		}
		
		/**
		 * <p>Asserts that two objects are not equal.It uses <code>ObjectUtil.compare</code> to conpare</p>
		 * 
		 * <p>测试两个对象是否不同。它用<code>ObjectUtil.compare</code>来比较。</p>
		 * 
		 * @see mx.utils.ObjectUtil#compare
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param expected Expected value.Not be null. 期待的对象（不能为 null ）。
		 * @param actual The value to check against expected. 事实上得到的对象。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function notEquals(expected:*, actual:*, message:String = ""):void {
			if(expected == null)
				errorMessage(message, "Expected is null.");
			if(actual == null)
				errorMessage(message, "Actual is null.");
			if(ObjectUtil.compare(expected, actual, -1) == 0) {
				errorMessage(message, "expected:<" + expected + "> but was:<" + actual + ">");
			}
		}
		
		/**
		 * <p>Asserts that a condition is true.</p>
		 * 
		 * <p>测试是否为 true。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param condition condition to be checked 需要检查的状态。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function isTrue(condition:Boolean, message:String = ""):void {
			if(!condition) {
				errorMessage(message, "expected true but was false");
			}
		}

		/**
		 * <p>Asserts that a condition is false.</p>
		 * 
		 * <p>测试是否为 false。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param condition condition to be checked 需要检查的状态。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function isFalse(condition:Boolean, message:String = ""):void {
			if(condition) {
				errorMessage(message, "expected false but was true");
			}
		}
		
		/**
		 * <p>Asserts that an object is null.</p>
		 * 
		 * <p>测试对象是否为 null。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param condition condition to be checked 需要检查的对象。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function isNull(object:*, message:String = ""):void {
			if(object != null) {
				errorMessage(message, "object was not null: " + object);
			}
		}
		
		/**
		 * <p>Asserts that an object isn't null.</p>
		 * 
		 * <p>测试对象是否不是 null。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param object condition to be checked 需要检查的对象。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function isNotNull(object:*, message:String = ""):void {
			if(object == null) {
				errorMessage(message, "object was null: " + object);
			}
		}

		/**
		 * <p>Asserts that two objects refer to the same object.It uses <code>==</code> to compare</p>
		 * 
		 * <p>测试两个对象是否是同一个对象(地址相同)。它用 <code>==</code> 来比较。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param expected the expected object 期待的对象（不能为 null ）。
		 * @param actual the object to compare to expected 事实上得到的对象。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function isSame(expected:*, actual:*, message:String = ""):void {
			if(expected == null)
				errorMessage(message, "Expected is null.");
			if(actual == null)
				errorMessage(message, "Actual is null.");
			if(expected != actual) {
				errorMessage(message, "expected:<" + expected + "> but not equals:<" + actual + ">");
			}
		}

		 /**
		 * <p>Asserts that two objects do not refer to the same object.It uses <code>!=</code> to compare</p>
		 * 
		 * <p>测试两个对象是否不是同一个对象(地址相同)。它用 <code>!=</code> 来比较。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param expected the object you don't expect 不期待的对象（不能为 null ）。
		 * @param actual the object to compare to unexpected 事实上得到的对象。
		 * @param message the identifying message for the AssertionError 错误信息。
		 */
		public static function isNotSame(unexpected:*, actual:*, message:String = ""):void {
			if(unexpected == null)
				errorMessage(message, "Unexpected is null.");
			if(actual == null)
				errorMessage(message, "Actual is null.");
			if(unexpected == actual)
				errorMessage(message, "unexpected:<" + unexpected + "> but equals:<" + actual + ">");
		}
		
		/**
		 * <p>Fails a test.</p>
		 * 
		 * <p>让测试失败。</p>
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param message the identifying message or null for the AssertionError 错误信息。
		 */
		public static function fail(message:String = ""):void {	
				errorMessage(message, "Fail");
		}
		
		/*
		 * throw AssertionError
		 * 
		 * @throws advancedflex.debugger.aut.framework.errors.AssertionError On error. 当出错时。
		 * 
		 * @param userMsg the message of user entered.
		 * @param sysMsg the message of system(Assert) entered.
		 */
		private static function errorMessage(userMsg:String, sysMsg:String):void {
			throw new AssertionError((userMsg.length > 0 ? userMsg + "-" : "") + sysMsg);
		}
	}
}