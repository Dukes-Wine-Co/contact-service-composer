runContainer(){
  CONTAINER_NAME=$1

  if [ "$(docker ps -a | grep $CONTAINER_NAME)" ];
   then
     docker restart "$CONTAINER_NAME"
   else
     docker run --name "$CONTAINER_NAME" -p 3000:3000 -d dukes-wine/"$CONTAINER_NAME"
  fi
}

"$@"
