//
//  StatusBarView.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 11/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Cocoa
import Foundation

class StatusBarView: NSObject {

    public let statusBar = NSStatusBar.system.statusItem(withLength: -1);
    public let menuBar = NSMenu();
    
    private let playButton = PlayButton();
    private let timeText = TimeText();
    
    private var settingsWindow: NSWindowController?;

    public func ready() {
        if let button = statusBar.button {
            button.title = "Time Watcher";
        }
        
        reloadData();
        statusBar.menu = menuBar;
    }
    
    public func reloadData() {
        menuBar.removeAllItems();
        addString(string: "No current task");
        addSeparator();
        addPlayButton();
        addTimeText();
        addSeparator();
        addTasks();
        addSeparator();
        addSettingsButton();
        addSeparator();
        addQuitButton();
        playButton.frame.size.width = menuBar.size.width;
        timeText.frame.size.width = menuBar.size.width;
    }
    
    func addSeparator() {
        menuBar.addItem(NSMenuItem.separator());
    }
    
    func addString(string: String) {
        let item = NSMenuItem(title: string, action: nil, keyEquivalent: "");
        menuBar.addItem(item);
    }
    
    func addTasks() {
        let app = NSApplication.shared.delegate as! AppDelegate;
        
        for i in 0 ..< app.taskList.size() {
            addTask(task: app.taskList.get(row: i));
        }
    }
    
    func addTask(task: Task) {
        let item = NSMenuItem(title: task.name, action: #selector(StatusBarView.openTask), keyEquivalent: "");
        item.target = self;
        item.representedObject = task;
        menuBar.addItem(item);
    }
    
    func addPlayButton() {
        let menuItem = NSMenuItem()
        menuItem.view = playButton;
        menuBar.addItem(menuItem);
    }
    
    func addTimeText() {
        let menuItem = NSMenuItem()
        menuItem.view = timeText;
        menuBar.addItem(menuItem);
    }
    
    func addSettingsButton() {
        let item = NSMenuItem(title: "Settings...", action: #selector(StatusBarView.openSettings), keyEquivalent: "S");
        item.target = self;
        menuBar.addItem(item);
    }
    
    func addQuitButton() {
        let item = NSMenuItem(title: "Quit", action: #selector(StatusBarView.openQuit), keyEquivalent: "Q");
        item.target = self;
        menuBar.addItem(item);
    }
    
    @objc func openTask(sender: NSMenuItem) {
        let task = sender.representedObject as! Task;
    }
    
    @objc func openSettings(sender: NSStatusBarButton) {
        if settingsWindow == nil {
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            settingsWindow = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "MainWindow")) as? NSWindowController
        }
        if settingsWindow != nil {
            settingsWindow!.showWindow(sender);
        }
    }
    
    @objc func openQuit(sender: NSStatusBarButton) {
        NSApp.terminate(self);
    }
    
}
