# pkgl
拉取镜像
 ```
 docker run -dit \
    -p 6666:80 \
    --name pkgl \
    --hostname pkgl \
    --restart always \
    redmancy/pkgl:latest
 ```