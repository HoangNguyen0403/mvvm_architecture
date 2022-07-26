GREEN='\033[1;32m'

echo "${GREEN}========================Format Import Start======================="
if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm flutter pub run import_sorter:main
else
  echo "Using local flutter version"
  flutter pub run import_sorter:main
fi
echo "${GREEN}========================Format Import Finish======================="
