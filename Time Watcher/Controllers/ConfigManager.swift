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
    
    private static let filename = "config";
    
    private static func readFile() throws -> String {
        print("Reading config file...");
        
        let appDirectory = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(".timewatcher", isDirectory: true);

        try FileManager.default.createDirectory(at: appDirectory, withIntermediateDirectories: true, attributes: nil);
            
        let configFile = appDirectory.appendingPathComponent(filename).appendingPathExtension("json");
            
        let content = try String(contentsOf: configFile);
            
        return (content);
    }
    
    private static func writeFile(content: String) throws {
        print("Writing config file...");
        
        let appDirectory = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(".timewatcher", isDirectory: true);
        
        try FileManager.default.createDirectory(at: appDirectory, withIntermediateDirectories: true, attributes: nil);
        
        let configFile = appDirectory.appendingPathComponent(filename).appendingPathExtension("json");
        
        try content.write(to: configFile, atomically: true, encoding: .utf8);
    }
    
    public static func loadFile() {
        print("Loading config file...");
        
        let app = NSApplication.shared.delegate as! AppDelegate;
        let decoder = JSONDecoder();
        
        do {
            let encodedString = try ConfigManager.readFile();
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
            try writeFile(content: encodedString!);
        } catch {
            print(error)
        }
    }

}
