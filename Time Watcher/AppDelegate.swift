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
    public let dataManager: DataManager = DataManager();

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let center = DistributedNotificationCenter.default();
        
        center.addObserver(self, selector: #selector(AppDelegate.onScreenLock), name: NSNotification.Name(rawValue: "com.apple.screenIsLocked"), object: nil);
        center.addObserver(self, selector: #selector(AppDelegate.onScreenUnlock), name: NSNotification.Name(rawValue: "com.apple.screenIsUnlocked"), object: nil);
        ConfigManager.loadFile();
        statusBar.ready();
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        timeManager.forceStop();
        DataManager.dumpData(timer: nil);
        ConfigManager.saveFile();
    }
    
    @objc func onScreenLock() {
        print("Screen lock detected!");
        timeManager.forceStop();
    }
    
    @objc func onScreenUnlock() {
        print("Screen unlock detected!");
        timeManager.forceStart();
        statusBar.reloadData();
    }

}
