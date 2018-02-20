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
    public let timeManager: TimeManager = TimeManager();

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let center = DistributedNotificationCenter.default();
        
        center.addObserver(self, selector: #selector(AppDelegate.onScreenLock), name: NSNotification.Name(rawValue: "com.apple.screenIsLocked"), object: nil);
        center.addObserver(self, selector: #selector(AppDelegate.onScreenUnlock), name: NSNotification.Name(rawValue: "com.apple.screenIsUnlocked"), object: nil);
        ConfigManager.loadFile();
        statusBar.ready();
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        ConfigManager.saveFile();
    }
    
    @objc func onScreenLock() {
        print("onScreenLock");
    }
    
    @objc func onScreenUnlock() {
        print("onScreenUnlock");
    }

}
