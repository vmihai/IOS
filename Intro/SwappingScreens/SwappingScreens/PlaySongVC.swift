//
//  PlaySongVC.swift
//  SwappingScreens
//
//  Created by Victor Mihaita on 15/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    @IBOutlet weak var songTitleLbl: UILabel!
    private var _selectedSong: String!
    
    var selectedSong: String {
        get {
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitleLbl.text = _selectedSong
    }
}
