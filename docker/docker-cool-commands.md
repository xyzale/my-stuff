## Docker cool commands

#### List dangling images 

`docker images -f dangling=true`

#### Remove all dangling images

`docker rmi $(docker images -f dangling=true -q)`

#### Remove containers according to a pattern

`docker images | grep "pattern" | awk '{print $1}' | xargs docker rm`

#### Remove images according to a pattern

`docker ps -a | grep "pattern" | awk '{print $3}' | xargs docker rmi`
