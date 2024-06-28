Perintah hardsub untuk ffmpeg kira-kira
dijalankan begini<br/>
 <pre>ffmpeg -i input.mp4 -vf subtitles="input.srt":force_style='fontsize=20' -preset veryfast output.mkv</pre>
 <br/><br/>
 Namun untuk beberapa yang suka hardsub ke banyak video
mungkin resolusi video semua tidak sama, dan ukuran font harus disesuaikan.
jadi saya temukan solusi cara menghitung ukuran sesuai resolusinya.
paket ffmpeg bisa kamu unduh di <a href="https://www.johnvansickle.com/ffmpeg/">www.johnvansickle.com/ffmpeg/</a><br/>
Terima kasih.
