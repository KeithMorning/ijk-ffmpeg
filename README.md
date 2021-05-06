# ijk-ffmpeg
ffmpeg compile by ijkplayer's repo

# use ffmpeg and ijk

I modify the compile code script for [ijkplayer](https://github.com/bilibili/ijkplayer). And now we can compile the ffmpeg with ijkplayer, this scripts only build arm64 && x86_64.

# how to use
copy the ./Script to the ijkplayer code folder. Replace the `./ios/compile-ffmpeg.sh`  `./init-ios.sh`  `./ios/tools/do-compile-ffmpeg.sh`. copy the `module-lite.sh` to `./config` and replace the old one. Then cd to `./ios` folder, run `./compile-ffmpeg.sh all`. 
After you complie finish, use my include header replace the old one. (This one is ijkplayer ff4.0--ijk0.8.8--20201130--001)
