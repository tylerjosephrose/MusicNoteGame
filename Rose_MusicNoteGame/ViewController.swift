//
//  ViewController.swift
//  MusicNoteGame
//
//  Created by Tyler Rose on 2/21/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	static var Notes = [String:URL]()
	static var player = AVAudioPlayer()
	
	private func loadNotes() {
		ViewController.Notes["A"] = Bundle.main.url(forResource: "A", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["A#"] = Bundle.main.url(forResource: "A#", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["B"] = Bundle.main.url(forResource: "B", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["C"] = Bundle.main.url(forResource: "C", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["C#"] = Bundle.main.url(forResource: "C#", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["D"] = Bundle.main.url(forResource: "D", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["D#"] = Bundle.main.url(forResource: "D#", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["E"] = Bundle.main.url(forResource: "E", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["F"] = Bundle.main.url(forResource: "F", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["F#"] = Bundle.main.url(forResource: "F#", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["G"] = Bundle.main.url(forResource: "G", withExtension: "mp3", subdirectory: "Notes")!
		ViewController.Notes["G#"] = Bundle.main.url(forResource: "G#", withExtension: "mp3", subdirectory: "Notes")!
	}
	
	@IBAction func noteButtonPressed(_ sender: UIButton) {
		print(sender.currentTitle!)
		play(note: sender.currentTitle!)
	}
	
	func play(note: String) {
		ViewController.player = try! AVAudioPlayer(contentsOf: ViewController.Notes[note]!)
		ViewController.player.play()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadNotes()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}

