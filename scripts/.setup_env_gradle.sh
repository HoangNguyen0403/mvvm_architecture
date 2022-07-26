GREEN='\033[1;32m'

echo "${GREEN}========================Setup Env Gradle Start======================="
cd android && gradle wrapper --gradle-version 7.2 && cd ..
gradle -v
echo "========================Setup Env Gradle Finish======================="
