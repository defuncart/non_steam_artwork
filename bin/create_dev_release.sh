#!/usr/bin/env bash

# parse app version
CURRENT_VERSION_WITH_BUILDNUMBER=$(awk '/^version:/ {print $2}' pubspec.yaml)
CURRENT_VERSION=$(echo "$CURRENT_VERSION_WITH_BUILDNUMBER" | sed 's/\+.*//')
echo $CURRENT_VERSION

# generate a list of last 10 tags sorted in reverse
LATEST_TAGS_RAW=$(git describe --tags $(git rev-list --tags --max-count=10))
JOINED="${LATEST_TAGS_RAW//$'\n'/,}"
IFS=,
read -ra LATEST_TAGS <<< "$JOINED"
unset IFS

# determine if there is an existing release
PATTERN="^$CURRENT_VERSION\+dev.[0-9]+"
for element in "${LATEST_TAGS[@]}"; do
    if [[ "$element" =~ $PATTERN ]]; then
    FOUND_TAG="$element"
    break
    fi
done

# determine new build number
if [ -z "$FOUND_TAG" ]; then
    echo "No existing tag found for version $CURRENT_VERSION"
    NEW_BUILD_NUMBER=1
else
    echo "Found tag $FOUND_TAG"
    LAST_BUILD_NUMBER=$(echo $FOUND_TAG | cut -d "." -f 4)
    NEW_BUILD_NUMBER=$(($LAST_BUILD_NUMBER + 1))
fi

# create tag
NEW_TAG=$CURRENT_VERSION+dev.$NEW_BUILD_NUMBER
echo $NEW_TAG
git tag $NEW_TAG
git push --tags
