# hearthstone-tags-to-json

Extracts enums from the Hearthstone game client C# assembly `Assembly-CSharp.dll` and converts them to JSON
## Usage

Use the [Makefile](Makefile):
`make run`

or run it manaully and specify a list of enumeration type names:
`mono ./hearthstone-tags-to-json/bin/Release/hearthstone-tags-to-json.exe GAME_TAG TAG_ZONE`

The enumeration type names specified must be defined in the C# assembly `Assembly-CSharp.dll`.

## Dependencies

Requires [mono](http://www.mono-project.com/) and [xamarin](https://xamarin.com/):

```bash
brew install mono
brew cask install xamarin
```