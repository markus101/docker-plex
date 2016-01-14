VERSION=$1
PORT=$2
DIR_NAME=${PWD##*/}
WORKING_DIR=${PWD}
CONFIG = $WORKING_DIR/$VERSION/config
TRANSCODE = $WORKING_DIR/$VERSION/trancode
NAME = "plex-$VERSION"

if [ -z "$VERSION" ]; then
    echo "Version is required as the first parameter"
fi

if [ -z "$PORT" ]; then
    echo "Version is required as the second parameter"
fi

mkdir $CONFIG
mkdir $TRANSCODE

docker create \
    --name=$NAME
    --publish=32400:$PORT --restart=always \
    -e VERSION=$VERSION \
    --volume=$CONFIG:/config \
    --volume=$TRANSCODE:/transcode \
    $VERSION