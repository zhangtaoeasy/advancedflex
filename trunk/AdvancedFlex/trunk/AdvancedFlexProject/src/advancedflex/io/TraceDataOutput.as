package advancedflex.io {
	import flash.utils.IDataOutput;
	import flash.utils.ByteArray;

	public class TraceDataOutput implements IDataOutput {
		public function writeDouble(value:Number):void			{trace(value);}
		
		public function writeByte(value:int):void				{trace(value);}
		
		public function writeBoolean(value:Boolean):void 		{trace(value);}
		
		public function writeFloat(value:Number):void			{trace(value);}
		
		public function writeShort(value:int):void				{trace(value);}
		
		public function writeUnsignedInt(value:uint):void		{trace(value);}
		
		public function writeObject(object:*):void				{trace(object);}
		
		public function writeUTF(value:String):void				{trace(value);}
		
		public function get endian():String						{return null;}
		
		public function set endian(type:String):void			{}
		
		public function get objectEncoding():uint				{return 0;}
		
		public function set objectEncoding(version:uint):void	{}
		
		public function writeInt(value:int):void				{trace(value);}
		
		public function writeUTFBytes(value:String):void		{
			trace(value.charAt(value.length - 1) === "\n" ? value.slice(0,-2) : value);
		}
		
		public function writeBytes(bytes:ByteArray, offset:uint=0.0, length:uint=0.0):void {
			
			var buf:ByteArray = new ByteArray();
			bytes.readBytes(buf, offset, length);
			trace(buf.toString());
		}
		
		public function writeMultiByte(value:String, charSet:String):void {
			trace(value.charAt(value.length - 1) === "\n" ? value.slice(0,-2) : value);
		}
	}
}