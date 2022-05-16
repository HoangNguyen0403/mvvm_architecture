echo "========================Building $1======================="
echo "Setup build......"
flutter clean
flutter pub get
flutter pub global run intl_utils:generate
dart pub global activate flutter_gen
flutter packages pub run build_runner build --delete-conflicting-outputs
#echo "IOS build:"
#flutter build ios --flavor "$1"
#echo "IOS build done!"
echo "Adroid build:"
flutter build apk --flavor "$1"
echo "========================build done======================="