all: build

copy-references:
	mkdir -p copied-references
	cp "/Applications/Hearthstone/Hearthstone.app/Contents/Resources/Data/Managed/Assembly-CSharp.dll" copied-references/.

build: copy-references
	/Applications/Xamarin\ Studio.app/Contents/MacOS/mdtool build -c:Release\|x86 -t:Build hearthstone-tags-to-json.sln

run: build
	mono ./hearthstone-tags-to-json/bin/Release/hearthstone-tags-to-json.exe GAME_TAG TAG_ZONE > tags.json

.PHONY: build run