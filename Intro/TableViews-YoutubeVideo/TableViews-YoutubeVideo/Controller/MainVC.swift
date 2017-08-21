//
//  ViewController.swift
//  TableViews-YoutubeVideo
//
//  Created by Victor Mihaita on 17/08/2017.
//  Copyright © 2017 Victor Mihaita. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var partyRocks = [PartyRock]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let p1 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/b/b7/Redfoo-Let%27s-Get-Ridiculous.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        let p2 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/2/21/Redfoo_-_Juicy_Wiggle_%28cover%29.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        let p3 = PartyRock(imageURL: "https://images.genius.com/167bda6593eac3e129070fea7604c510.600x600x1.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/NDnW_9JLfig\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sock It To Ya")
        let p4 = PartyRock(imageURL: "http://direct.rhapsody.com/imageserver/images/Alb.192567432/500x500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TrVLu9p65a0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where the Sun Goes")
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/7/76/Sexy_and_I_Know_It_-_Single.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wyx6JDQCslE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sexy and I Know It")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

