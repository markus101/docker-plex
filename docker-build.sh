#Use dir name as image name
DIR_NAME=${PWD##*/}
docker build -t $DIR_NAME .
