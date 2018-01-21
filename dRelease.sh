dRelease() {
    if [  -z "$1" ] 
    then
        echo "Download debian installer for latest release of a github project"
        echo "Check syntax please. Are there a debian binary?"
        echo "---"
        echo "Sintax lRelease user/project"
        echo "---"
    else
        echo "Looking for $1 to dowload debian installer"
        curl --silent "https://api.github.com/repos/${1}/releases/latest" | # Check latest release
        grep '.deb' |                       # looking for debian installer
        grep  '"browser_download_url"'  |   # get url for download
        awk -F'": '  '{print $2}'       |   # extract only url
        xargs  curl -L  --remote-name       # download with remote name
    fi
}
