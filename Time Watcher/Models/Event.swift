//
//  Event.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 20/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Foundation

struct Event: Codable {
    var task: Task;
    var start: Int;
    var stop: Int;
}
