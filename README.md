Timelapse-Scripts
=================
A collection of scripts for managing timelapse data through dropbox and automatically restarting EOS utility.  The "capture" and "upload" scripts can be run as scheduled tasks on a Windows computer running EOS utility and cygwin.  The "video" and "monitoring" scripts are designed to download images and create videos using avconv in linux (potentially on a separate computer).

Dropbox access is achieved by using the mosboston fork of Andrea Fabrizi's awesome Dropbox-Uploader script.  The fork adds local file deletion with the -x flag for continuous uploading:
https://github.com/mosboston/Dropbox-Uploader

Requirements for upload computer
--------------------------------
* https://github.com/mosboston/Dropbox-Uploader 
* EOS Utility v3.1 (autohotkey script restarts running timelapse)
* Autohotkey 
* Cygwin

Requirements for video creation
-------------------------------
* https://github.com/mosboston/Dropbox-Uploader 
* avconv command for making videos



