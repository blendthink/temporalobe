FLAVOR=dev

# ios
TEAM_ID=

# android
KEY_ALIAS=
KEY_PASSWORD=
KEY_STORE_BASE64=
KEY_STORE_PASSWORD=

.PHONY: run
run:
	fvm flutter pub get
	fvm flutter pub run grinder pre-build --flavor=$(FLAVOR)
	fvm flutter run --dart-define=FLAVOR=$(FLAVOR)

.PHONY: build-ipa
build-ipa:
	flutter pub get
	flutter pub run grinder build-ipa --flavor=$(FLAVOR) --teamId=$(TEAM_ID)

.PHONY: build-aab
build-aab:
	flutter pub get
	flutter pub run grinder build-aab \
		--flavor=$(FLAVOR) \
		--keyAlias=$(KEY_ALIAS) \
		--keyPassword=$(KEY_PASSWORD) \
		--keyStoreBase64=$(KEY_STORE_BASE64) \
		--keyStorePassword=$(KEY_STORE_PASSWORD)
