TEAM_ID=$1
BUNDLE_ID=$2
PROFILE_NAME=$3

cat > "$(PWD)/ExportOptions.plist" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
   <dict>
      <key>destination</key>
      <string>export</string>
      <key>method</key>
      <string>app-store</string>
      <key>teamID</key>
      <string>${TEAM_ID}</string>
      <key>uploadBitcode</key>
      <false/>
      <key>uploadSymbols</key>
      <true/>
      <key>provisioningProfiles</key>
      <dict>
        <key>${BUNDLE_ID}</key>
        <string>${PROFILE_NAME}</string>
      </dict>
      <key>signingCertificate</key>
      <string>iPhone Distribution</string>
      <key>signingStyle</key>
      <string>manual</string>
      <key>stripSwiftSymbols</key>
      <true/>
   </dict>
</plist>
