# Anime-Upscaler
An anime video upscaler that uses ffmpeg and waifu2x-caffe.

## How to use: ##

Place your desired video into the folder "Input Video". Then run one of the following Upscale_anime_CPU.bat*, Upscale_anime_GPU.bat* or Upscale_anime_CUDNN.bat*. You can then follow the instruction messages prompted.

	*READ THE IMPORTATNT MESSAGE BELOW!

## still needs to be done: ##

* Auto detection of CUDA, GPU and CPU in one batch file.
* ~~Auto detection the video frame rate, that way you wont need to input it when prompted.~~
* Recompile video with all audio, subtitles and markers when upscaled video is rendered.

## IMPORTANT: ##

There are 3 variation of the project:
* CPU based Upscale (Slow)
* GPU based Upscale (Medium)
* CUDNN based Upscale (FAST)

In most cases from what I am aware of CPU and GPU should work on most system.
In the case of CUDNN you need a nvidia card with CUDA 3.0 or higher.
If you do not have CUDA installed and you have a nvidia card download at:
https://developer.nvidia.com/cuda-90-download-archive
https://developer.nvidia.com/rdp/cudnn-download (You will need to signup to download this)

Once the files are downloaded locally, unzip them. Installing cuDNN is pretty straight forward. You just have to copy three files from the unzipped directory to CUDA 9.0 install location. For reference, NVIDIA team has put them in their own directory. So all you have to do is to copy file from :
* {unzipped dir}/bin/ --> C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin
* {unzipped dir}/include/ --> C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\include
* {unzipped dir}/lib/ --> C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\lib

	You will also need a ton of free space as the upscaled images are huge.
	The 00:40:00 anime took around 300 gigs. 00:01:40 took about 5 gigs.
	These are also dependant on the number of frames of the anime (more fames means more space).

## TEST (hh:mm:ss): ##

* 750  ti (640 CUDA cores), took about 16-18 hours to upscale a 50:00:00 minute anime from 640×480 to 1280×960.
* 1660 ti (1536 CUDA cores), took about 1 hour to upscale a 00:01:40 minute anime from 480x270 to 960x540.
