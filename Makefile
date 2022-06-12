FLAVOR=dev
TEAM_ID=

.PHONY: run
run:
	fvm flutter pub get
	fvm flutter pub run grinder pre-build --flavor=$(FLAVOR)
	fvm flutter run --dart-define=FLAVOR=$(FLAVOR)


.PHONY: build-ipa
build-ipa:
	flutter pub get
	flutter pub run grinder build-ipa --flavor=$(FLAVOR) --teamId=$(TEAM_ID)