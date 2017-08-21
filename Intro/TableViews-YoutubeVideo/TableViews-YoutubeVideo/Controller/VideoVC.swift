//
//  VideoVC.swift
//  TableViews-YoutubeVideo
//
//  Created by Victor Mihaita on 17/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit
import WebKit

class VideoVC: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    
    private var _partyRock: PartyRock!
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
