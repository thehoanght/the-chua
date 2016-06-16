//
//  TimeOut.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/23/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation

/// Timeout wrapps a callback deferral that may be cancelled.
///
/// Usage:
/// Timeout(1.0) { println("1 second has passed.") }
///
class Timeout: NSObject
{
    private var timer: NSTimer?
    private var callback: (Void -> Void)?
    
    init(_ delaySeconds: Double, _ callback: Void -> Void)
    {
        super.init()
        self.callback = callback
        self.timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(delaySeconds),
                                                            target: self, selector: #selector(Timeout.invoke), userInfo: nil, repeats: false)
    }
    
    func invoke()
    {
        self.callback?()
        // Discard callback and timer.
        self.callback = nil
        self.timer = nil
    }
    
    func cancel()
    {
        self.timer?.invalidate()
        self.timer = nil
    }
}