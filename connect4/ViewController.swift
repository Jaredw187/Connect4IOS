//
//  ViewController.swift
//  connect4
//
//  Created by Jared Walton on 5/17/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var currentPlayer = 1;
    var image = UIImage(named: "peice.png") as UIImage? // declare image as the default board image.
    var moves =   [Bool](count: 42, repeatedValue: false); // arrays to store the moves :)
    var p1moves = [Bool](count: 42, repeatedValue: false);
    var p2moves = [Bool](count: 42, repeatedValue: false);

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // add peices to the board
    @IBAction func updateBoard(sender: AnyObject) {
        // get the board location of player move as integer
        let location = ((sender as! UIButton).titleLabel!.text!);
        let loc = Int(location);
        // see if it is a valid move and if so.. plot it.
        if (checkValidMove.checkIfValid(loc!, moves: moves)){
            
            // set the general move.
            moves[loc! - 1] = true;
            
            // change the background of the button to mirror that of the players peice.
            if (currentPlayer == 1){ image = UIImage(named: "peice3.png") as UIImage?;}
            else { image = UIImage(named: "peice2.png") as UIImage?;}
            (sender as! UIButton).setBackgroundImage(image, forState: UIControlState.Normal)
            
            if (currentPlayer == 1) { p1moves[loc! - 1] = true; }
            else                 { p2moves[loc! - 1] = true; }

            
            // check if winner. if so.. update the label and throw an alert.
            if(checkWinner.checkWinner(p1moves, p2moves: p2moves, loc: loc!) == true){
                changeLabel(2);
                
                //define an alert.
                let alertController = UIAlertController(title: "Player " + String(currentPlayer) + " Wins!",
                                                        message:"Play again?", preferredStyle: UIAlertControllerStyle.Alert)
                
                // add play again option. upon click.. board is reset.
                let playAgain = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default) {
                    UIAlertAction in self.resetBoard();
                }
                // add quit option. user is taken to home screen upon click.
                let quit = UIAlertAction(title: "No ", style: UIAlertActionStyle.Cancel) {
                    action in self.dismissViewControllerAnimated(true, completion:nil);
                }                
                // add the actions to the view.
                alertController.addAction(quit);
                alertController.addAction(playAgain);
                
                // show the view.
                self.presentViewController(alertController, animated: true, completion: nil);
            }
            else{
                // switch player turn and mark their moves in the array.
                if (currentPlayer == 1) { p1moves[loc! - 1] = true; currentPlayer = 2; }
                else                    { p2moves[loc! - 1] = true; currentPlayer = 1; }
                changeLabel(1);
            }
          }
    }
    
    // change the label.
    @IBOutlet var infoLabel: UILabel!
        func changeLabel(option: Int){
        
        // update the label to notify the current player.
        if (option == 1){
            self.infoLabel.text = "Player " + String(currentPlayer) + "'s Turn";
        }
        // update the label to nofify winner.
        if (option == 2){
            self.infoLabel.text = "Player " + String(currentPlayer) + " Wins";
        }
        else{ /*do nothing.*/}
    }
    
    //clear the board.
    func resetBoard(){
        // set the image to the "blank" peice.
        image = UIImage(named: "peiceblank.png") as UIImage?;
        
        // iterate through all content of the board. if its a button..
        // set it's bacground to the blank peice.
        for view in self.view.subviews as [UIView] {
            if let button = view as? UIButton {
                button.setBackgroundImage(image, forState: UIControlState.Normal);
            }
        }
        
        // resetting the arrays containing the player moves.
        for (index, _) in p1moves.enumerate(){ p1moves[index] = false; }
        for (index, _) in p2moves.enumerate(){ p2moves[index] = false; }
        for (index, _) in   moves.enumerate(){   moves[index] = false; }
    }
}

