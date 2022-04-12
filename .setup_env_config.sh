GREEN='\033[1;32m'

echo "${GREEN}========================Setup Env Config $BUILD_FLAVOR_KEY======================="
flavor="Development"

#Check prefix and set flavor config
if [ "$BUILD_FLAVOR_KEY" = "staging" ]; then
  flavor="Staging"
elif [ "$BUILD_FLAVOR_KEY" = "production" ]; then
  flavor="Production"
fi

echo Flavor "$flavor"
echo Branch name "$CI_COMMIT_BRANCH"
echo Commit title "$CI_COMMIT_TITLE"
echo User name "$CI_COMMIT_AUTHOR"
{
echo BRANCH_NAME="$CI_COMMIT_BRANCH"
echo COMMIT_TITLE="$CI_COMMIT_TITLE"
echo USER_PERFORM="$CI_COMMIT_AUTHOR"
} >>fastlane/.env."$BUILD_FLAVOR_KEY"

echo "========================Env $BUILD_FLAVOR_KEY File======================="
cat fastlane/.env."$BUILD_FLAVOR_KEY"
echo "========================Setup Env Finish======================="
