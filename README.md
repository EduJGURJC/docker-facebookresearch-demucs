# Introduction
This repository only includes a Dockerfile to create a working Docker image of the [Facebookresearch Demucs tool](https://github.com/facebookresearch/demucs)

## How to build the docker image
There is already a built image in [my DockerHub repository](https://hub.docker.com/r/edujg/facebookresearch-demucs), but you can build it yourself if you want.

1. Clone this repository:
    `git clone edujgurjc/docker-facebookresearch-demucs`

2. Open a terminal and navigate (cd,dir) to cloned repository folder
3. Run the following command (you need to have docker installed):
    `docker image build -t edujg/facebookresearch-demucs .`

## How to Use

To run demucs in a container, it is necessary to pass a series of mandatory arguments to the docker run command:

- Input Folder as Volume: `-v "MY/INPUT/PATH:/input"` replace _MY/INPUT/PATH_ with the full path of the folder where you have the audio you want to separate by tracks.
- Output Folder as Volume: `-v "MY/OUTPUT/PATH:/input"` replace _MY/OUTPUT/PATH_ with the full path of the folder where you want the audio tracks to be saved.
- Audio name as environment variable: `-e "AUDIO_NAME=MY_SONG.mp3"` replace _MY_SONG.mp3_ with the complete audio name

Also, you can pass other optional environment variables:
- Add more arguments to the demucs command such as "-d cpu" or others ([See official documentation](https://github.com/facebookresearch/demucs)): `-e "OTHER_ARGS=-d cpu"`
- Change the default container input folder: `-e "INPUT_PATH=/input"`
- Change the default container output folder: `-e "OUTPUT_PATH=/output"`

Run docker command like the following:

`docker run --rm --name demucs -v "MY/INPUT/PATH:/input" -v "MY/OUTPUT/PATH:/output" -e "AUDIO_NAME=MY_SONG.mp3" edujg/facebookresearch-demucs`