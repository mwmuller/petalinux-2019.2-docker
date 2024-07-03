# petalinux-2019.2-docker
Maintains the docker image for petalinux 2019.2 which is based on ubuntu 18.04.02

### Creating OS Docker image
1) Find and download the desired distribution's ISO
2) Provide this as an input to the ```create_os_docker_image.sh``` using the following args:
> - ```-i``` ISO image name
> - ```-u``` Custom docker user -> ```<user>/docker_image_name``` (default ```darknessoup```)
> - ```-d``` Docker image name
> - ```create_os_docker_image.sh -i ubuntu.18_04_02.iso -u darknessoup -d petalinux_2019.2```
- This will take some time as it parses the file system and creates the docker image

### Building a new docker image
1) Provide an updated image tag to ```initializeCommand.sh``` -> ```${DOCKER_IMAGE_NAME}:"<mytag>" .```
2) Update the same tag in the ```.devcotnainer.json``` ```"image:"``` field. ```"image": "darknessoup/petalinux-2019.2:<mytag>",```
3) Add any additional packages to the Dockerfile you wish to add.
4) run ```./initializeCommand.sh```

### Testing the image
1) ```CTRL + SHIFT + P``` -> ```Dev Containers: Rebuild Without Cache and open in Container```
2) Check any package updates or scripts

### Pushing the image
Once the image is built, you can push it to the respective repo with a new tag: ```user/imageName:<mytag>```
- Default repo ```darknessoup/petalinux-2019.2:<mytag>```
1) run ```docker push <dockerimage:<mnytag>```
- ex. ```docker push darknessoup/petalinux-2019.2:20240703_1``` 
