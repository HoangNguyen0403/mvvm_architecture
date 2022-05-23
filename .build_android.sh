GREEN='\033[1;32m'

echo "${GREEN}========================Build Android $BUILD_FLAVOR_KEY Start======================="

if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm flutter build apk --flavor "$BUILD_FLAVOR_KEY" --build-number "$BUILD_NUMBER"
else
  echo "Using local flutter version"
  flutter build apk --flavor "$BUILD_FLAVOR_KEY" --build-number "$BUILD_NUMBER"
fi
echo "========================Build Android Finish======================="
