//
//  RoundedImageView.swift
//  mvc-test
//
//  Created by Victor Mihaita on 21/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
