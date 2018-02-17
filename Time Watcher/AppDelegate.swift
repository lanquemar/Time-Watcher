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
    
    public let taskList: TaskList = TaskList();
    public let statusBar: StatusBarView = StatusBarView();

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBar.ready();
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}
