//
//  changeLabelContent.swift
//  connect4
//
//  Created by Jared Walton on 5/18/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import Foundation


class changeLabelContent {
    class func changeLabel(option: Int, currPlayer: Int){
        if (option == 1){
            self.simpleLabel.text = "Player " + currPlayer + "Wins";
            
        }
    }
}
class MyViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    func someFunction() {
        self.myLabel.text = "text"
    }
}