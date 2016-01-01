all: build

copy-references:
	mkdir -p copied-references
	cp "/Applications/Hearthstone/Hearthstone.app/Contents/Resources/Data/Managed/Assembly-CSharp.dll" copied-references/.

build: copy-references
	/Applications/Xamarin\ Studio.app/Contents/MacOS/mdtool build -c:Release\|x86 -t:Build hearthstone-tags-to-json.sln

run: build
	mono ./hearthstone-tags-to-json/bin/Release/hearthstone-tags-to-json.exe ACCOUNT_TAG GAME_TAG TAG_CARD_SET TAG_CARDTYPE TAG_CLASS TAG_ENCHANTMENT_VISUAL TAG_FACTION TAG_GOLD_REWARD_STATE TAG_MULLIGAN TAG_PLAYSTATE TAG_PREMIUM TAG_RACE TAG_RARITY TAG_STATE TAG_STEP TAG_TYPE TAG_ZONE SpellZoneTag CHOICE_TYPE AttackType ActorStateType UIEventType Locale > tags.json

.PHONY: build run