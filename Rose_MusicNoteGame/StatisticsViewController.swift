//
//  StatisticsViewController.swift
//  MusicNoteGame
//
//  Created by Tyler Rose on 2/21/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

	@IBOutlet weak var highLbl: UILabel!
	@IBOutlet weak var lowLbl: UILabel!
	@IBOutlet weak var latestLbl: UILabel!
	@IBOutlet weak var numGamesLbl: UILabel!
	
	@IBAction func resetStats(_ sender: UIButton) {
		let stats = UserDefaults.standard
		stats.removeObject(forKey: "HighestScore")
		stats.removeObject(forKey: "LowestScore")
		stats.removeObject(forKey: "LatestScore")
		stats.set(0, forKey: "NumOfGames")
		displayStats()
	}
	
	private func displayStats() {
		let stats = UserDefaults.standard
		if stats.integer(forKey: "NumOfGames") > 0 {
			highLbl.text = String(stats.integer(forKey: "HighestScore"))
			lowLbl.text = String(stats.integer(forKey: "LowestScore"))
			latestLbl.text = String(stats.integer(forKey: "LatestScore"))
			numGamesLbl.text = String(stats.integer(forKey: "NumOfGames"))
		} else {
			highLbl.text = "-"
			lowLbl.text = "-"
			latestLbl.text = "-"
			numGamesLbl.text = "0"
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		displayStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
