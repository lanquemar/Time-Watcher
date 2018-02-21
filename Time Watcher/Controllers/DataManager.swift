//
//  DataManager.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 21/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Foundation

class DataManager {
    
    private static var eventList = Array<Event>();
    private var updateTimer = Timer();
    private let dumpingRate: Double = 1 * 60 * 5; // 5 minutes
    
    init() {
        self.updateTimer = Timer.scheduledTimer(withTimeInterval: dumpingRate, repeats: true, block: DataManager.dumpData);
        RunLoop.main.add(self.updateTimer, forMode: .commonModes);
    }
    
    public static func addEvent(event: Event) {
        self.eventList.append(event);
    }
    
    private static func readLastList() -> Array<Event>? {
        do {
            let rawString = try FileHelper.readDataFile();
            let decoder = JSONDecoder();
            let decodedList = try decoder.decode(Array<Event>.self, from: rawString.data(using: .utf8)!);
            
            return (decodedList);
        } catch {
            print(error);
        }
        
        return (nil);
    }
    
    private static func writeNewList(list: Array<Event>) {
        do {
            let encoder = JSONEncoder();
            let encodedData = try encoder.encode(list);
            let encodedString = String(data: encodedData, encoding: .utf8);
            try FileHelper.writeDataFile(content: encodedString!);
        } catch {
            print(error);
        }
    }
    
    @objc public static func dumpData(timer: Timer) -> Void {
        if (eventList.count > 0) {
            if var fileList = readLastList() {
                fileList.append(contentsOf: eventList);
                self.eventList = fileList;
            }
            
            writeNewList(list: self.eventList);
            self.eventList.removeAll();
        }
    }

}
