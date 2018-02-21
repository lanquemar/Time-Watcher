//
//  TimeText.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 14/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Cocoa
import Foundation

class TimeText: NSView {
    
    private let textField = NSTextField();
    private var updateTimer = Timer();

    init() {
        super.init(frame: NSZeroRect);
        textField.stringValue = "--:--:--";
        textField.isEditable = false;
        textField.isBordered = false;
        textField.isSelectable = false;
        textField.isBezeled = false;
        textField.drawsBackground = false;
        textField.sizeToFit();
        self.addSubview(textField);
        self.frame = textField.frame;
        self.updateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeText.updateTime), userInfo: nil, repeats: true);
        RunLoop.main.add(self.updateTimer, forMode: .commonModes);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        textField.setFrameOrigin(NSMakePoint(self.frame.size.width / 2 - textField.frame.size.width / 2, 0));
    }
    
    @objc public func updateTime() {
        let app = NSApplication.shared.delegate as! AppDelegate;
        
        if let elapsed = app.timeManager.getElapsedTime() {
            let hours = String(format: "%02d", elapsed / 60 / 60);
            let minutes = String(format: "%02d", elapsed / 60 % 60);
            let seconds = String(format: "%02d", elapsed % 60);
            
            self.textField.stringValue = hours + ":" + minutes + ":" + seconds;
            self.textField.sizeToFit();
        } else {
            self.textField.stringValue = "--:--:--";
            self.textField.sizeToFit();
        }
    }

}
