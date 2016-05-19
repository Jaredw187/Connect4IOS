//
//  checkValidMove.swift
//  connect4
//
//  Created by Jared Walton on 5/18/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import Foundation


class checkValidMove {
    // if first row, let them place it there.
    // if second row or above.. check first row or row below for a place below.
    // if array value of location passed + 6 == true (a move has been made there)
    // then the move is valid. allow it. otherwise, say no! and return false.
    

    class func checkIfValid(loc: Int, moves: [Bool]) -> Bool {
        if (loc >= 37){
            return true;
        }
        if (moves[loc+6-1] == true){ /* is played upon.. */
            return true;
        }
        return false;
    }
}