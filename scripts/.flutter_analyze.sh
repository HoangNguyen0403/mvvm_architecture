GREEN='\033[1;32m'

echo "${GREEN}========================Flutter Analyze Start======================="
if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm flutter analyze
else
  echo "Using local flutter version"
  flutter analyze
fi
echo "${GREEN}========================Flutter Analyze Finish======================="
