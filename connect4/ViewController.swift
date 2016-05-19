//
//  ViewController.swift
//  connect4
//
//  Created by Jared Walton on 5/17/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var playerTurn = 1;
    var image = UIImage(named: "peice.png") as UIImage? // declare image as the default board image.
    var moves = [Bool](count: 42, repeatedValue: false);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBoard(sender: AnyObject) {
        // get the board location of player move as integer
        let location = ((sender as! UIButton).titleLabel!.text!);
        let loc = Int(location);

        // see if it is a valid move and if so.. plot it.
        if (checkValidMove.checkIfValid(loc!, moves: moves)){
            moves[loc!-1] = true;
            
            // change the background of the button to mirror that of the players peice.
            if (playerTurn == 1){ image = UIImage(named: "peice3.png") as UIImage?;}
            else { image = UIImage(named: "peice2.png") as UIImage?;}
            (sender as! UIButton).setBackgroundImage(image, forState: UIControlState.Normal)
            
            //check if winner. if so.. update the label.
            if(checkWinner.checkWinner(moves, loc: loc!) == true){
                changeLabel(2);
            }
            else{
                // switch player turn
                if (playerTurn == 1) { playerTurn = 2}
                else { playerTurn = 1 }
                changeLabel(1);
            }
        }
    }
    
    // label update
    @IBOutlet var infoLabel: UILabel!
    func changeLabel(option: Int){
        
        // update the label to notify the current player.
        if (option == 1){
            self.infoLabel.text = "Player " + String(playerTurn) + "'s Turn";
        }
        // update the label to nofify winner.
        if (option == 2){
            self.infoLabel.text = "Player " + String(playerTurn) + " Wins";
        }
        else{ /*do nothing.*/}
    }
    
    
}

