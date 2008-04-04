package advancedflex.utils.overload.patterns
{
	public class TruePattern implements IParamPattern
	{
		public function matchs(arg:*):Boolean
		{
			return Boolean(arg);
		}
		
	}
}