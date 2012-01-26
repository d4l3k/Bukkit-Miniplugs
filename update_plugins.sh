version=latest
#version=recommended

mkdir plugins/update/
cd plugins/update/
axel -a http://spout.undergroundminer.com/SpoutPlugin/$version/spoutplugin-dev-SNAPSHOT.jar
