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
	
	@IBAction func noteBtnPressed(_ sender: UIButton) {
		print(sender.titleLabel!)
	}
	
	func randomNote() -> String {
		return Array(ViewController.Notes.keys)[Int(arc4random_uniform(UInt32(ViewController.Notes.count)))]
	}
	
	func play(note: String) {
		ViewController.player = try! AVAudioPlayer(contentsOf: ViewController.Notes[note]!)
		ViewController.player.play()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let note = randomNote()
		print(note)
		play(note: note)
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
