## About

This vim plugin will automatically refresh your Firefox after editing and
saving your HTML, CSS, Javascript, python, php, etc. It requires the [Remote
Control](https://addons.mozilla.org/en-us/firefox/addon/remote-control/) plugin for Firefox.
It _should_ work on any operating system when vim is installed with python
support.

## Getting Started

1. Download the files:
    I would recommended way installing through [Vundle](https://addons.mozilla.org/en-us/firefox/addon/remote-control/).
	However, you can simply download the repo and install directly into your vim plugin directory.

2. Turn on Remote Control in Firefox for the tab you want to automatically refresh.

3. Turn on auto-refresh in vim by using the command :StartFFRefresh. To stop
   automatically refreshing the browser, use the command :StopFFRefresh.

## Additional Configuration

If your browser isn't refreshing for the filetypes you're working on, you might
need to change the global g:firefox_refresh_files which contains a list of
extensions to monitor. Currently it defaults to

     ```vim
     g:firefox_refresh_files = '*.html,*.htm,*.php,*.py,*.css,*.js'
     ```

To change it, modify the global in your `.vimrc`:

     ```vim
     let g:firefox_refresh_files = g:firefox_refresh_files . ",*.django,*.rb"
     " Maybe I just want to refresh for html, and html only...
     let g:firefox_refresh_files = "*.html"

     ```
