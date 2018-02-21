//
//  TimeManager.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 18/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Foundation

class TimeManager {
    
    public var currentTask: Task?;
    public var currentEvent: Event?;
    
    init() {
    }
    
    public func selectTask(task: Task) {
        if (self.currentTask != nil) {
            stopEvent();
        }
        self.currentTask = task;
        startEvent();
    }
    
    private func startEvent() {
        self.currentEvent = Event(task: self.currentTask!, start: Int(Date().timeIntervalSince1970), stop: 0);
    }
    
    private func stopEvent() {
        self.currentEvent?.stop = Int(Date().timeIntervalSince1970);
        print(self.currentEvent ?? "NaN");
        DataManager.addEvent(event: self.currentEvent!);
        self.currentEvent = nil;
    }
    
    public func toggle() {
        if (self.currentTask != nil) {
            if (self.currentEvent == nil) {
                startEvent();
            } else {
                stopEvent();
            }
        }
    }
    
    public func isPlaying() -> Bool {
        return (self.currentEvent != nil);
    }
    
    public func getCurrentTask() -> Task? {
        return (self.currentTask);
    }
    
    public func getElapsedTime() -> Int? {
        if (self.currentEvent != nil) {
            return (Int(Date().timeIntervalSince1970) - (self.currentEvent?.start)!);
        }
        return (nil);
    }

}
