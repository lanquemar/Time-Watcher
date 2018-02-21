//
//  PlayButton.swift
//  Time Watcher
//
//  Created by Adrien Vasseur on 14/02/2018.
//  Copyright © 2018 Adrien Vasseur. All rights reserved.
//

import Cocoa
import Foundation

class PlayButton: NSImageView {
    
    private let imgPlay = NSImage(named: NSImage.Name.touchBarPlayTemplate);
    private let imgPause = NSImage(named: NSImage.Name.touchBarPauseTemplate);
    
    init() {
        super.init(frame: NSZeroRect);
        self.frame.size.height = 40;
        self.imgPlay?.size.width = 21;
        self.imgPlay?.size.height = 45;
        self.imgPause?.size.width = 21;
        self.imgPause?.size.height = 45;
        self.image = imgPlay;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update() {
        let app = NSApplication.shared.delegate as! AppDelegate;

        if (app.timeManager.isPlaying()) {
            self.image = imgPause;
        } else {
            self.image = imgPlay;
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        let app = NSApplication.shared.delegate as! AppDelegate;

        app.timeManager.toggle();
        update();
    }

}
