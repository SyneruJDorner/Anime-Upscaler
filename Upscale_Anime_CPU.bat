@echo off
set /p START_KEY=Hit Enter To Start...

echo Creating Required Folders...

If not Exist "Frames" MkDir "Frames"
If not Exist "Frames/Extracted" MkDir "Frames/Extracted"
If not Exist "Frames/Created" MkDir "Frames/Created"

echo Folders Created.

set root_folder=%~dp0
set execpath=%root_folder%waifu2x-caffe/waifu2x-caffe-cui.exe

echo Extracting Frames from Video.
IF EXIST "./Input Video/*.mkv" (
	for %%f in ("./Input Video/*.mkv") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)
ELSE IF EXIST "./Input Video/*.mp4" (
	for %%f in ("./Input Video/*.mp4") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)
ELSE IF EXIST "./Input Video/*.avi" (
	for %%f in ("./Input Video/*.avi") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)
ELSE IF EXIST "./Input Video/*.flv" (
	for %%f in ("./Input Video/*.flv") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)
ELSE IF EXIST "./Input Video/*.ogm" (
	for %%f in ("./Input Video/*.ogm") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)
ELSE IF EXIST "./Input Video/*.3gp" (
	for %%f in ("./Input Video/*.3gp") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)
ELSE IF EXIST "./Input Video/*.wmv"(
	for %%f in ("./Input Video/*.wmv") do (
		ffmpeg -i "%root_folder%Input Video\%%f" "Frames\Extracted\frame_%%08d.bmp"
	)
)

echo Extracted Frames.
echo Improving All Frame Quality.
@echo off

set totalCnt=0
for /r %%i in (*) do set /a totalCnt+=1
echo File count = %totalCnt%

set /a cnt=0
set /a percent=0
set /a Fraction=0

setlocal ENABLEDELAYEDEXPANSION
for /r %%i in (*) do (
	if not exist "%root_folder%Frames\Created\%%~nxi" (
		%execpath% -y upconv_7_anime_style_art_rgb --tta 0 -p cpu -n 3 -s 2.00 -m noise_scale -q 0 -no_overwrite 1 -i "%root_folder%Frames\Extracted\%%~nxi" -e bmp -o "%root_folder%Frames\Created\%%~nxi" >nul
		cls
	) else (
		ECHO "Skipping file (already exists) %%~nxi"
	)

	SET /A "cnt=cnt+1"
	Set /A "percent = 100 * !cnt! / !totalCnt!"
	Set /A "Fraction = !cnt! %% 1000"
	echo !percent!.!Fraction!%% Complete
)
setlocal DisableDelayedExpansion

echo Converting Images to Video

set /p framerate=Enter framerate:
"ffmpeg.exe" -threads 4 -r %framerate% -f image2 -s 1920x1080 -i "Frames/Created/frame_%%08d.bmp" -aspect 16:9 -b 2M -vcodec libx264 -crf 25  -pix_fmt yuv420p "Output Video\video.mkv"

PAUSE