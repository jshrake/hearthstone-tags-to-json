using System;
using System.Reflection;
using System.Linq;

// Courtesey of http://stackoverflow.com/a/14776935
public static class EnumExtensions
{
	public static System.Collections.Generic.Dictionary<int, string> EnumToDictionary(Type type)
	{
		if (!type.IsEnum)
			throw new InvalidOperationException("enum expected");
		return Enum.GetValues(type).Cast<object>().
			ToDictionary(enumValue => (int) enumValue, enumValue => enumValue.ToString());

	}
}

namespace hearthstonetagstojson
{

	static
	class MainClass
	{

		public static void Main (string[] args)
		{
			// Grab the Assembly from a known type
			Assembly asm = typeof(GAME_TAG).Assembly;
			// Default type names when none are passed
			args = args.Length == 0 ? new [] {"GAME_TAG", "TAG_ZONE"} : args;
			// Convert command-line arguments to array of types
			Console.WriteLine (Newtonsoft.Json.JsonConvert.SerializeObject (
				args.ToDictionary (type => asm.GetType(type).Name, type => EnumExtensions.EnumToDictionary (asm.GetType(type)))
				, Newtonsoft.Json.Formatting.Indented));
		}
	}
}
