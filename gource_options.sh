#!/bin/bash
## make gource video from gource logfile.

# tmp output location. this example will need 13G free.
OUT_PPM="/Users/mdawg/Downloads/gource_tmp/out.ppm"
# result
OUT_MP4="dump.mp4"

# dump to $OUT_PPM
gource -1280x720 --camera-mode track --hide progress --output-ppm-stream $OUT_PPM \
       --font-colour 336699 --highlight-users --highlight-colour ff0000 \
       --auto-skip-seconds 1 --seconds-per-day 0.05 --title "hmm..." --user-scale 1 \
       --bloom-multiplier 0.5 --bloom-intensity 0.5 | ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i $OUT_PPM -vcodec libx264 -preset ultrafast \
       -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 $OUT_MP4

#works
gource -1280x720 -r 60 -e 0.5 --hide progress --hide filenames --font-size 2\
--output-ppm-stream "pandas_gource" --seconds-per-day .01 --stop-at-end --font-colour 336699 \
--highlight-users --highlight-colour 999999 --auto-skip-seconds 1 --title "Pandas Library Repo" \
-user-scale 1 --bloom-multiplier 1.0 --bloom-intensity 1.0 --key --file-idle-time 0 \
--caption-size 10 --caption-duration .01 |\
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i pandas_gource -vcodec libx264 -preset fast \
-pix_fmt yuv420p -crf 1 -threads 0 -bf 0 pandas_gource.mp4

#codec
ffmpeg -v error -i pandas_gource pandas_gource.mp4

#bitcoin
gource -1920x1080 -r 60 --seconds-per-day 0.2 --file-idle-time 0 --key \
--title "Bitcoin Core Project" --caption-file caption.txt --caption-size 24 \
--caption-duration 5 --user-image-dir avatar/ bitcoin-core-project.txt
#bitcoin render
gource -1920x1080 -r 60 --seconds-per-day 0.2 --file-idle-time 0 --key \
--title "Bitcoin Core Project" --caption-file caption.txt --caption-size 24 \
--caption-duration 5 --user-image-dir avatar/ bitcoin-core-project.txt -o - |\
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset veryfast \
-pix_fmt yuv420p -crf 1 -threads 0 -bf 0 bitcoin-core-project.mp4



# make video with ffmpeg.
ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i $OUT_PPM -vcodec libx264 -preset ultrafast \
       -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 $OUT_MP4

echo "check $OUT_MP4"
rm -f $OUT_PPM