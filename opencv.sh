#!/bin/bash
version=3.0.0
mkdir /home/paperscorer/
cd /home/paperscorer/
mkdir OpenCV
cd OpenCV
apt-get -qq remove  x264 libx264-dev
add-apt-repository ppa:mc3man/trusty-media
add-apt-repository ppa:mc3man/gstffmpeg-keep
apt-get update
apt-get install ffmpeg gstreamer0.10-ffmpeg
apt-get -qq install libav-tools libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev  libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils ffmpeg cmake qt5-default checkinstall
wget -O OpenCV-$version.zip http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$version/opencv-"$version".zip/download
unzip OpenCV-$version.zip
cd opencv-$version
mkdir build
cd build
ls
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j2
checkinstall
sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
ldconfig
echo "OpenCV" $version "ready to be used"

#now in /etc/environment et these paths
#JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#M2_HOME=/opt/maven
##PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$JAVA_HOME:$JRE_HOME:$M2_HOME/bin:$CATALINA_HOME$PATH"
#JAVA_OPTS="-Djava.library.path=/opt/opencv/opencv-3.0.0/build/lib"
#LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/opencv/opencv-3.0.0/build/lib"
#CATALINA_HOME="/opt/tomcat/apache-tomcat-8.5.40"


#run this command
#source /etc/environment
