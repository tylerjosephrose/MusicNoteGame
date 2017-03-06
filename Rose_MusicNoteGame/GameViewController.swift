//
//  GameViewController.swift
//  MusicNoteGame
//
//  Created by Tyler Rose on 2/21/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

	@IBOutlet weak var ABtn: UIButton!
	@IBOutlet weak var AsBtn: UIButton!
	@IBOutlet weak var BBtn: UIButton!
	@IBOutlet weak var CBtn: UIButton!
	@IBOutlet weak var CsBtn: UIButton!
	@IBOutlet weak var DBtn: UIButton!
	@IBOutlet weak var DsBtn: UIButton!
	@IBOutlet weak var EBtn: UIButton!
	@IBOutlet weak var FBtn: UIButton!
	@IBOutlet weak var FsBtn: UIButton!
	@IBOutlet weak var GBtn: UIButton!
	@IBOutlet weak var GsBtn: UIButton!
	@IBOutlet weak var RoundLbl: UILabel!
	@IBOutlet weak var AnswerLbl: UILabel!
	@IBOutlet weak var CorrectAnswerLbl: UILabel!
	private var note: String!
	private var round = 1
	private var score = 0
	
	@IBAction func noteBtnPressed(_ sender: UIButton) {
		print(sender.titleLabel!)
		if round > 5 {
			return
		}
		
		/*if readyForAnswer == false {
			return
		}*/
		
		if evaluate(guess: sender.currentTitle!) {
			AnswerLbl.text = "Correct!"
			AnswerLbl.textColor = UIColor.green
		} else {
			AnswerLbl.text = "Incorrect"
			AnswerLbl.textColor = UIColor.red
		}
		round += 1
		Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector (GameViewController.playGame), userInfo: nil, repeats: false)
	}
	
	private func disableButtons() {
		ABtn.isEnabled = false
		AsBtn.isEnabled = false
		BBtn.isEnabled = false
		CBtn.isEnabled = false
		CsBtn.isEnabled = false
		DBtn.isEnabled = false
		DsBtn.isEnabled = false
		EBtn.isEnabled = false
		FBtn.isEnabled = false
		FsBtn.isEnabled = false
		GBtn.isEnabled = false
		GsBtn.isEnabled = false
	}
	
	private func enableButtons() {
		ABtn.isEnabled = true
		AsBtn.isEnabled = true
		BBtn.isEnabled = true
		CBtn.isEnabled = true
		CsBtn.isEnabled = true
		DBtn.isEnabled = true
		DsBtn.isEnabled = true
		EBtn.isEnabled = true
		FBtn.isEnabled = true
		FsBtn.isEnabled = true
		GBtn.isEnabled = true
		GsBtn.isEnabled = true
	}
	
	private func evaluate(guess: String) -> Bool {
		disableButtons()
		if guess == note {
			CorrectAnswerLbl.text = note
			score += 1
			return true
		}
		CorrectAnswerLbl.text = note
		return false
	}
	
	func resetRound() {
		CorrectAnswerLbl.text = ""
		AnswerLbl.text = ""
	}
	
	func playGame() {
		resetRound()
		if round <= 5 {
			RoundLbl.text = String(round)
			note = randomNote()
			print(note)
			playNote()
			enableButtons()
		} else {
			updateStats()
			let message = "Score: " + String(score) + "\nPlay Again?"
			let endGameAlert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
			let yes = UIAlertAction(title: "Yes", style: .default, handler: newGame)
			let no = UIAlertAction(title: "No", style: .default, handler: endGame)
			endGameAlert.addAction(yes)
			endGameAlert.addAction(no)
			present(endGameAlert, animated: true, completion: nil)
		}
	}
	
	private func updateStats() {
		let stats = UserDefaults.standard
		stats.set(stats.integer(forKey: "NumOfGames") + 1, forKey: "NumOfGames")
		stats.set(score, forKey: "LatestScore")
		// If this is the first game played, we need to set the high and low scores automatically
		if stats.integer(forKey: "NumOfGames") == 1 {
			stats.set(score, forKey: "HighestScore")
			stats.set(score, forKey: "LowestScore")
		} else {
			if score > stats.integer(forKey: "HighestScore") {
				stats.set(score, forKey: "HighestScore")
			} else if score < stats.integer(forKey: "LowestScore") {
				stats.set(score, forKey: "LowestScore")
			}
		}
	}
	
	func endGame(alertAction: UIAlertAction) {
		_ = navigationController?.popViewController(animated: true)
	}
	
	func newGame(alertAction: UIAlertAction) {
		round = 1
		score = 0
		playGame()
	}
	
	private func randomNote() -> String {
		return Array(ViewController.Notes.keys)[Int(arc4random_uniform(UInt32(ViewController.Notes.count)))]
	}
	
	private func playNote() {
		ViewController.player = try! AVAudioPlayer(contentsOf: ViewController.Notes[note]!)
		ViewController.player.play()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		playGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
