GREEN='\033[1;32m'
WARNING='\033[1;33m'

echo "${GREEN}========================Setup App Start======================="
if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm flutter doctor -v
  fvm flutter clean
  fvm flutter pub get

  # Check contain any *.g.dart cache file
  if [ "$(find . -type f -name "*.g.dart" -print | head -n 1)" ] &&  [ -d "lib/gen/" ] && [ -d "resources/langs" ]; then
    echo "${GREEN}Generated *.g.dart files exits. Using cache"
  else
    echo "${WARNING}Generated *.g.dart files not exits. Re-generate"
    dart pub global activate flutter_gen
    fvm flutter packages pub run build_runner build --delete-conflicting-outputs
    fvm flutter pub get
  fi

else
  echo "Using local flutter version"
  flutter doctor -v
  flutter clean
  flutter pub get

  # Check contain any *.g.dart cache file
  if [ "$(find . -type f -name "*.g.dart" -print | head -n 1)" ] &&  [ -d "lib/gen/" ] && [ -d "resources/langs" ]; then
    echo "${GREEN}Generated *.g.dart files exits. Using cache"
  else
    echo "${WARNING}Generated *.g.dart files not exits. Re-generate"
    dart pub global activate flutter_gen
    flutter packages pub run build_runner build --delete-conflicting-outputs
    flutter pub get
  fi
fi
echo "${GREEN}========================Setup App Finish======================="
