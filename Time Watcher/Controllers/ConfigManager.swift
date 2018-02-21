//
//  ConfigManager.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 17/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Cocoa
import Foundation

class ConfigManager {
    
    public static func loadFile() {
        print("Loading config file...");
        
        let app = NSApplication.shared.delegate as! AppDelegate;
        let decoder = JSONDecoder();
        
        do {
            let encodedString = try FileHelper.readConfigFile();
            let taskList = try decoder.decode(TaskList.self, from: encodedString.data(using: .utf8)!);
            app.taskList = taskList;
        } catch {
            print(error);
        }
    }
    
    public static func saveFile() {
        print("Saving config file...");
        
        let app = NSApplication.shared.delegate as! AppDelegate;
        let encoder = JSONEncoder();
        
        do {
            let encodedData = try encoder.encode(app.taskList);
            let encodedString = String(data: encodedData, encoding: .utf8);
            try FileHelper.writeConfigFile(content: encodedString!);
        } catch {
            print(error)
        }
    }

}
