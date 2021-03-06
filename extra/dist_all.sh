#!/bin/bash -ex

cd $(dirname $0)

# Server setup
SERVER="socialsoulserver.local"
LOGIN="socialsoulserver@$SERVER"
ssh -o "StrictHostKeyChecking no" $LOGIN "cd /socialsoul && git fetch && git reset --hard origin/master"
ssh -o "StrictHostKeyChecking no" $LOGIN < systemsettings.sh
ssh -o "StrictHostKeyChecking no" $LOGIN "sudo launchctl unload -w /Library/LaunchDaemons || true"
ssh -o "StrictHostKeyChecking no" $LOGIN "sudo rm -rf /Library/LaunchDaemons /Users/socialsoulserver/Desktop"
rsync --delete -r -e ssh LaunchDaemons.server "$LOGIN:/tmp/"
rsync --delete -r -e ssh Desktop.server "$LOGIN:/tmp/"
ssh -o "StrictHostKeyChecking no" $LOGIN "sudo mv /tmp/LaunchDaemons.server /Library/LaunchDaemons"
ssh -o "StrictHostKeyChecking no" $LOGIN "sudo chown -R root /Library/LaunchDaemons"
ssh -o "StrictHostKeyChecking no" $LOGIN "mv /tmp/Desktop.server /Users/socialsoulserver/Desktop"
ssh -o "StrictHostKeyChecking no" $LOGIN "sudo launchctl load -w /Library/LaunchDaemons"

# Client setup
for i in {0..4} ; do
	SERVER="socialsoul${i}.local"
	LOGIN="socialsoul@$SERVER"
	ssh -o "StrictHostKeyChecking no" $LOGIN < systemsettings.sh
	ssh -o "StrictHostKeyChecking no" $LOGIN "sudo launchctl unload -w /Library/LaunchDaemons || true"
	ssh -o "StrictHostKeyChecking no" $LOGIN "sudo rm -rf /Library/LaunchDaemons /Users/socialsoul/Desktop"
	rsync --delete -r -e ssh LaunchDaemons.screen "$LOGIN:/tmp/"
	rsync --delete -r -e ssh Desktop.screen "$LOGIN:/tmp/"
	ssh -o "StrictHostKeyChecking no" $LOGIN "sudo mv /tmp/LaunchDaemons.screen /Library/LaunchDaemons"
	ssh -o "StrictHostKeyChecking no" $LOGIN "sudo chown -R root /Library/LaunchDaemons"
	ssh -o "StrictHostKeyChecking no" $LOGIN "mv /tmp/Desktop.screen /Users/socialsoul/Desktop"
	ssh -o "StrictHostKeyChecking no" $LOGIN "sudo launchctl load -w /Library/LaunchDaemons"
done
