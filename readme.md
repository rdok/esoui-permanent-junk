## About ESOUI Framework
Create a development environment that is enjoyable and  allowing you to quickly and easily jump in creating esoui addons using TDD approach.

Use docker to expose lua interpreter upon alpine linux, luarocks package manager, and the busted lua testing framework.

[![Build Status](https://travis-ci.org/rdok/esoui-framework.svg?branch=master)](https://travis-ci.org/rdok/esoui-framework)

![ESOUI Framework Logo](logo.jpg "ESOUI Framework Logo") 



### Developer Environment

- Setup https://docs.docker.com/install/
- Build the images:  
    - `docker-compose build lua`
    - `docker-compose build luarocks`
    - `docker-compose build busted`
- Replace `AddonName` with the addon name in `tests/bootstrap.lua`
- Execute Tests `docker-compose run --rm busted  tests -v`

### Scripts
This `scripts` folder has scripts automating tasks such as getting busted, esoui sdks. Tools such as dos2unix, and even fetching esoui globals.

### Link src to ESO path
Storing source code inside the system feels like coding on production server :mind_blown: Let's fix that by creating a symbolic link from the source code to system:
- Open `cmd` with Admin privileges
- Paste: `mklink /d "C:\Users\rdok\Documents\Elder Scrolls Online\live\AddOns\Pomodoro" "D:\Code\Pomodoro"`

### Issues
#### File Endings
> standard_init_linux.go:207: exec user process caused "no such file or directory"
Convert file endings to Unix style: 

PowerShell:
- Fetch dos2unix:  .\tools\get_dos2unix.ps1
- PowerShell:  `{dos2unix_path} {sh file path}`
 - Example: ` .\tools\dos2unix\bin\dos2unix.exe .\docker\luarocks\entry-point.sh`

 
### Docker Cleanup
> Remove any stopped containers and all unused images. 

`docker system prune -a`
