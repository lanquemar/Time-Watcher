//
//  AppDelegate.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 11/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    public var taskList: TaskList = TaskList();
    public let statusBar: StatusBarView = StatusBarView();

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        ConfigManager.loadFile();
        statusBar.ready();
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        ConfigManager.saveFile();
    }

}
