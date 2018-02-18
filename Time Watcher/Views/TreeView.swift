//
//  TreeView.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 11/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Cocoa
import AppKit

class TreeView: NSViewController, NSTableViewDataSource, NSTextFieldDelegate {
    
    @IBOutlet weak var inputField: NSTextField!
    @IBOutlet weak var treeView: NSTableView!

    let app = NSApplication.shared.delegate as! AppDelegate;

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return (app.taskList.size());
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let task = app.taskList.get(row: row);

        return (task.name);
    }
    
    func createNewTask(name: String) -> Task {
        var task = Task();
        
        task.uuid = UUID().uuidString;
        task.name = name;
        
        return (task);
    }
    
    @IBAction func addButton(_ sender: Any?) {
        let newValue = inputField.stringValue;
        if (newValue.count > 0) {
            app.taskList.add(newValue: createNewTask(name: newValue));
            inputField.stringValue.removeAll();
            treeView.reloadData();
            app.statusBar.reloadData();
        }
    }

    @IBAction func delButton(_ sender: Any?) {
        if (treeView.selectedRow >= 0) {
            app.taskList.del(row: treeView.selectedRow);
            treeView.reloadData();
            app.statusBar.reloadData();
        }
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        addButton(nil);
    }
}
