
dir=`dirname "$0"`
if [ -e "$dir/settings.sh" ]; then
    . "$dir/settings.sh"
elif [ -e "$dir/../xcodepkgtool_settings.sh" ]; then
    . "$dir/../xcodepkgtool_settings.sh"
else
    echo "settings.sh not found"
    exit 1
fi