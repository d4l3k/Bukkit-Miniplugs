#!/usr/bin/env ruby
require 'net/http'
require 'xmlsimple'
# version = "releases" # Stable Version
version = "snapshots" # Unstable Version
launch_command = "java -jar bukkit.jar"

base_url = 'http://repo.bukkit.org/content/repositories/'+version+'/org/bukkit/craftbukkit/'
metadata = 'maven-metadata.xml'
xml_data = Net::HTTP.get_response(URI.parse(base_url+metadata)).body
config = XmlSimple.xml_in(xml_data)
#puts config.to_s
latest_primary_version = config["versioning"][0]["latest"][0]
puts "Latest CraftBukkit Major Version: #{latest_primary_version}"
xml_data = Net::HTTP.get_response(URI.parse(base_url+latest_primary_version+"/"+metadata)).body
config = XmlSimple.xml_in(xml_data)
#puts config.to_s
latest_secondary_version = config["versioning"][0]["snapshotVersions"][0]["snapshotVersion"][0]["value"][0]
puts "Latest CraftBukkit Minor Version: #{latest_secondary_version}"
version_file = ".bukkit_version"
if File.exists?(version_file)
	File.open(version_file, "r") do |object|
		version = object.read
	end
end
cur_version = latest_primary_version+";"+latest_secondary_version
if version != cur_version
	url = base_url+latest_primary_version+"/"+"craftbukkit-"+latest_secondary_version+".jar"
	puts "New CraftBukkit version Found! \nDownload Link: "+url
	download_command = "rm bukkit_tmp.jar; axel -a -o bukkit_tmp.jar #{url};mv bukkit_tmp.jar bukkit.jar;#{launch_command}"
	File.open(version_file, "w") do |object|
		object.print cur_version
	end
	exec(download_command)
else
	puts "CraftBukkit up to date."
	exec(launch_command)
end
