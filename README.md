# Time Watcher

Time Watcher is a very simple macOS tool designed to keep track of time spent on pre-configured tasks.

Key features:
* Simple and light process running in background without interruption
* All information are stored in open format (JSON)

Works on macOS 10.13.


### Installation

Please visit our [Releases page](https://github.com/lanquemar/Time-Watcher/releases/latest) to download our lastest dmg file. Install it like any other macOS software.


### Utilisation

Once started, the application is accessible from the system menu bar via its icon.

![Menu bar content](https://raw.githubusercontent.com/lanquemar/Time-Watcher/master/doc/Menubar-View.png)

This menu allows the user to quickly start and stop the current task as well as changing the current running task.

A settings window is accessible from the `Settings...` button:

![Settings window](https://raw.githubusercontent.com/lanquemar/Time-Watcher/master/doc/Settings-Window.png)

From the settings window, it is possible to add and remove tasks that can be launched from the menu bar.


### Log files

All events are logged in JSON files in the directory `~/.timewatcher/data/` and can be easily parsed. Each file contains about one week of event logs.

The JSON file `~/.timewatcher/config.json` stores all tasks created from the settings window.


### License

MIT License

Copyright (c) 2018 Adrien Vasseur

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
