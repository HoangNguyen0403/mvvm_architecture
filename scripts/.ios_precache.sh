GREEN='\033[1;32m'

echo "${GREEN}========================Flutter Pre-cache IOS Start======================="
if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm flutter precache --ios
else
  echo "Using local flutter version"
  flutter precache --ios
fi

#Use to write authenticate content to env file for fastlane ios authenticate
echo "$KEY_FILE" | base64 -d > ios/AuthKey.p8
echo "${GREEN}========================Flutter Pre-cache IOS Finish======================="
