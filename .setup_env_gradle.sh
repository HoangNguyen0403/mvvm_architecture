GREEN='\033[1;32m'

echo "${GREEN}========================Setup Env Gradle Start======================="
gradle -v
cd android && gradle wrapper --gradle-version 7.2 && cd ..
echo "========================Setup Env Gradle Finish======================="
