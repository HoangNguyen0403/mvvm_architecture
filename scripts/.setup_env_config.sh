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
echo Branch name "$COMMIT_BRANCH"
echo Commit title "$COMMIT_TITLE"
echo User name "$COMMIT_AUTHOR"
{
echo BRANCH_NAME="$COMMIT_BRANCH"
echo COMMIT_TITLE="$COMMIT_TITLE"
echo USER_PERFORM="$COMMIT_AUTHOR"
} >>fastlane/.env."$BUILD_FLAVOR_KEY"

echo "========================Env $BUILD_FLAVOR_KEY File======================="
cat fastlane/.env."$BUILD_FLAVOR_KEY"
echo "========================Setup Env Finish======================="
