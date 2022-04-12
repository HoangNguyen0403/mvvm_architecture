GREEN='\033[1;32m'

echo "${GREEN}========================Setup Env Gradle ======================="
gradle -v
cd android && gradle wrapper --gradle-version 6.7.1 && cd ..
echo "========================Setup Env Gradle Finish======================="
