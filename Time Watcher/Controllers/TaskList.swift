//
//  TaskList.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 11/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Foundation

class TaskList {
    
    private var data = [Task]();
    
    init() {
    }
    
    deinit {
    }
    
    public func size() -> Int {
        return (data.count);
    }

    public func get(row: Int) -> Task {
        return (data[row]);
    }
    
    public func add(newValue: Task) -> Void {
        data.append(newValue);
    }
    
    public func del(row: Int) -> Void {
        data.remove(at: row);
    }
}
