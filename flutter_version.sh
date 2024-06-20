use_flutter_version() {
  if [ $# -eq 0 ]; then
    echo "❌ Error: Version number not provided."
    return 1
  fi

  local version=$1

  if [ -d "$EX_PATH" ]; then
    echo "👀 Looking in 'externalstorage'"
    local flutter_path="$EX_TOOLS_PATH/flutter/flutter_$version/bin"
    if [ -d "$flutter_path" ]; then
      export PATH="$flutter_path:$PATH"
      hash -r
      echo "✅ Success change to flutter $version"
    else
      echo "❌ Flutter path not exist"
    fi
  else
    echo "👀 Looking in 'macstorage'"
    local flutter_path="$MAC_TOOLS_PATH/flutter/flutter_$version/bin"
    if [ -d "$flutter_path" ]; then
      export PATH="$flutter_path:$PATH"
      hash -r
      echo "✅ Success change to flutter $version"
    else
      echo "❌ Flutter path not exist"
    fi
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
