//
//  TaskList.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 11/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Foundation

class TaskList: Encodable, Decodable {
    
    private var data = [Task]();
    
    init() {
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init();
        var container = try decoder.unkeyedContainer();
        while (!container.isAtEnd) {
            let task = try container.decode(Task.self);
            self.data.append(task);
        }
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer();
        
        for i in 0 ..< data.count {
            try container.encode(data[i]);
        }
    }

}
