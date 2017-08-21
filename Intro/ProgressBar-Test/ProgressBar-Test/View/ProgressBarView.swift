//
//  ProgressBarView.swift
//  ProgressBar-Test
//
//  Created by Victor Mihaita on 21/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {

    private var _innerProgress: CGFloat = 0.0
    
    var progress: CGFloat {
        set(newProgress){
            if (newProgress>1.0) {
                _innerProgress = 1.0
            } else if (newProgress < 0.0) {
                _innerProgress = 0.0
            } else {
                _innerProgress = newProgress
            }
            setNeedsDisplay()
        }
        get {
            return _innerProgress * bounds.width
        }
    }
    
    override func draw(_ rect: CGRect) {
        StyleKit.drawProgressBar(frame: bounds, progress: progress)
    }

}
