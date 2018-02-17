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
    
    init() {
        super.init(frame: NSZeroRect);
        textField.stringValue = "--:--:--";
        textField.isEditable = false;
        textField.isBordered = false;
        textField.isSelectable = false;
        textField.sizeToFit();
        self.addSubview(textField);
        self.frame = textField.frame;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDraw() {
        textField.setFrameOrigin(NSMakePoint(self.frame.size.width / 2 - textField.frame.size.width / 2, 0));
    }
    
}
