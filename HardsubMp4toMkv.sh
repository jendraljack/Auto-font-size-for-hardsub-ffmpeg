#!/system/bin/sh
media="$(dirname $(realpath $0))"
if [ -z "$1" ]
then
echo "Gunakan sh $0 /path/video /path/subrip"
kill -9 $$
fi
echo $1 > $media/vidcek
##
if [ -z "$(cat $media/vidcek|grep -i mp4)" ]
then
busybox echo -e "Masukan mp4 yg benar atau hilangkan spasi nama\nurutan benar: sh $0 /path/video /path/subrip\n"
kill -9 $$
fi

echo $2 > $media/srtcek
##
if [ -z "$(cat $media/srtcek|grep -i srt)" ]
then
busybox echo -e "Masukan srt yg benar atau hilangkan spasi nama\nurutan benar: sh $0 /path/video /path/subrip\n"
kill -9 $$
fi
funcKnow (){
echo "I dont really like this function"
}

funcKnow
busybox echo -e "Memulai hardsub $1\n"
sleep 3
ffmpeg -i "$1" 2>&1|busybox egrep -i "SAR"|busybox cut -d ' ' -f 1- > $media/infoMedia.log
cat $media/infoMedia.log|busybox tr ',' '\n' > $media/infoMedia2.log
cat $media/infoMedia2.log|grep -i "SAR"|busybox awk '{print $1}' > $media/res1
cat $media/res1|busybox tr 'x' '/' > $media/res2
font="$(cat $media/res2)"
echo "busybox awk 'BEGIN {print $font*12}' > $media/res3" > $media/02-$(basename $0)
sh $media/02-$(basename $0)
sizefont=$(cat $media/res3)
echo "Auto fontsize from res is: $sizefont"
busybox echo -e "#!/system/bin/sh\nffmpeg -i \"$(dirname $(realpath $1))/$(basename $1)\" -vf subtitles=\"$(dirname $(realpath $2))/$(basename $2)\":force_style='fontsize=$sizefont' -preset veryfast $(dirname $1)/$(date +%s).mkv" > $media/03-$(basename $0)
sleep 2
echo "$(basename $0) is done"
