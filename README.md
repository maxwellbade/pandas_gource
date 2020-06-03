# pandas_gource
Visualization of the Pandas GitHub Repository using Gource

```
gource -1280x720 -r 60 -e 0.5 --hide progress --hide filenames --font-size 2\
--output-ppm-stream "pandas_gource" --seconds-per-day .01 --stop-at-end --font-colour 336699 \
--highlight-users --highlight-colour 999999 --auto-skip-seconds 1 --title "Pandas Library Repo" \
-user-scale 1 --bloom-multiplier 1.0 --bloom-intensity 1.0 --key --file-idle-time 0 \
--caption-size 10 --caption-duration .01 |\
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i pandas_gource -vcodec libx264 -preset fast \
-pix_fmt yuv420p -crf 1 -threads 0 -bf 0 pandas_gource.mp4
```
