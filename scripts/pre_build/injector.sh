#!/bin/bash

# Define the dependency and version
DEPENDENCY="google_maps_flutter: ^2.9.0

"

# File to update
PUBSPEC_FILE="../../pubspec.yaml"

# Check if the dependency already exists
if grep -q "^  $(echo $DEPENDENCY | cut -d: -f1):" $PUBSPEC_FILE; then
    echo "Dependency already exists in $PUBSPEC_FILE"
else
    # Add the dependency under 'dependencies:'
    sed -i.bak '/^dependencies:/a\
  '"$DEPENDENCY" $PUBSPEC_FILE

    echo "Dependency added to $PUBSPEC_FILE"

    # Clean up backup file created by sed (on macOS and Linux)
    rm -f pubspec.yaml.bak

    # Run flutter pub get to update the project
    flutter pub get

    flutter packages get
fi
