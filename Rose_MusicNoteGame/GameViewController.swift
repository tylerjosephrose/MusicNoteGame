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

	@IBOutlet weak var RoundLbl: UILabel!
	@IBOutlet weak var AnswerLbl: UILabel!
	private var note: String!
	private var round = 1
	
	@IBAction func noteBtnPressed(_ sender: UIButton) {
		print(sender.titleLabel!)
		
		if evaluate(guess: sender.currentTitle!) {
			AnswerLbl.text = "Correct!"
			AnswerLbl.textColor = UIColor.green
		} else {
			AnswerLbl.text = "Incorrect"
			AnswerLbl.textColor = UIColor.red
		}
		round += 1
		playGame()
	}
	
	private func evaluate(guess: String) -> Bool {
		if guess == note {
			return true
		}
		return false
	}
	
	private func playGame() {
		if round <= 5 {
			RoundLbl.text = String(round)
			note = randomNote()
			print(note)
			playNote()
		}
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
