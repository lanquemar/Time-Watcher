//
//  FileHelper.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 21/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Foundation

class FileHelper {
    
    private static let appDirectoryName = ".timewatcher";
    private static let dataDirectoryName = "data";
    private static let configFilename = "config";
    
    private static func getAppDirectory() throws -> URL {
        let appDirectory = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(appDirectoryName, isDirectory: true);
        try FileManager.default.createDirectory(at: appDirectory, withIntermediateDirectories: true, attributes: nil);
        return (appDirectory);
    }
    
    private static func getDataDirectory() throws -> URL {
        let dataDirectory = try FileHelper.getAppDirectory().appendingPathComponent(dataDirectoryName, isDirectory: true);
        try FileManager.default.createDirectory(at: dataDirectory, withIntermediateDirectories: true, attributes: nil);
        return (dataDirectory);
    }

    public static func readConfigFile() throws -> String {
        print("Reading config file...");
        
        let configFile = try FileHelper.getAppDirectory().appendingPathComponent(configFilename).appendingPathExtension("json");
        return (try String(contentsOf: configFile));
    }
    
    public static func writeConfigFile(content: String) throws {
        print("Writing config file...");
        
        let configFile = try FileHelper.getAppDirectory().appendingPathComponent(configFilename).appendingPathExtension("json");
        try content.write(to: configFile, atomically: true, encoding: .utf8);
    }
    
    public static func readDataFile() throws -> String {
        print("Reading data file...");
        
        let dataFile = try FileHelper.getDataDirectory().appendingPathComponent(generateDataFilename()).appendingPathExtension("json");
        return (try String(contentsOf: dataFile));
    }
    
    public static func writeDataFile(content: String) throws {
        print("Writing data file...");
        
        let dataFile = try FileHelper.getDataDirectory().appendingPathComponent(generateDataFilename()).appendingPathExtension("json");
        try content.write(to: dataFile, atomically: true, encoding: .utf8);
    }
    
    private static func formatDate(date: Date) -> String {
        let calendar = Calendar.current;
        let year = String(format: "%02d", calendar.component(.year, from: date));
        let month = String(format: "%02d", calendar.component(.month, from: date));
        let day = String(format: "%02d", calendar.component(.day, from: date));
        
        return (year + "-" + month + "-" + day);
    }
    
    private static func generateDataFilename() -> String {
        let lastMonday = Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()));
        let nextMonday = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: lastMonday!);
        
        return (formatDate(date: lastMonday!) + "_to_" + formatDate(date: nextMonday!));
    }

}
