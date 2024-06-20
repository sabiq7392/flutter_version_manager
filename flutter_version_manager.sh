MAC_PATH="/Users/sabiqmuhammad"
MAC_TOOLS_PATH="$MAC_PATH/Documents/tools"
EX_PATH="/Volumes/externalstorage"
EX_TOOLS_PATH="$EX_PATH/Documents/tools"

use_flutter_version() {
  # Check if version number is provided
  if [ $# -eq 0 ]; then
    echo "❌ Error: Version number not provided."
    return 1
  fi

  local version=$1
  local flutter_path=""

  # Check different paths for Flutter binaries
  if [ -d "$EX_PATH" ]; then
    echo "👀 Looking in 'externalstorage'"
    flutter_path="$EX_TOOLS_PATH/flutter/$version/bin"
  else
    echo "👀 Looking in 'macstorage'"
    flutter_path="$MAC_TOOLS_PATH/flutter/$version/bin"
  fi

  # Check if Flutter path exists
  if [ -d "$flutter_path" ]; then
    export PATH="$flutter_path:$PATH"
    hash -r
    echo "✅ Success changed to Flutter $version"
  else
    echo "❌ Flutter version does not exist: $flutter_path"
    return 1
  fi
}


list_flutter_version() {
  flutter_path="$EX_TOOLS_PATH/flutter"
  if [ -d "$flutter_path" ]; then
    echo "👀 Looking in 'externalstorage'"
    flutter_path="$EX_TOOLS_PATH/flutter"
  else
    echo "👀 Looking in 'macstorage'"
    flutter_path="$MAC_TOOLS_PATH/flutter"
  fi
  find "$flutter_path" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
  echo "change flutter version with command: use_flutter_version <version>"
}
