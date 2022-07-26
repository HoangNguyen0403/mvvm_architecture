GREEN='\033[1;32m'

echo "${GREEN}========================Code Analyze Start======================="
flutter format . --set-exit-if-changed
sh scripts/.flutter_analyze.sh
sh scripts/.format_import.sh
echo "${GREEN}========================Code Analyze Finish======================="
