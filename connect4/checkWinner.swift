//
//  checkwinner.swift :)
//  connect4
//
//  Created by Jared Walton on 5/18/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import Foundation


class checkWinner {
    
    class func checkWinner(moves: [Bool], loc: Int) -> Bool{
        //1  2  3  4  5  6  |1
        //7  8  9  10 11 12 |2
        //13 14 15 16 17 18 |3
        //19 20 21 22 23 24 |4
        //25 26 27 28 29 30 |5
        //31 32 33 34 35 36 |6
        //37 38 39 40 41 42 |7
        
        /* based off of move. */
        
        
        /* check adjacent spots in rows.
           the location % 6 gives the location of the move horizontally.
           (if the result is 0, its on the far left(0)) */
        var horizontalLocation = loc % 6;
        if (horizontalLocation == 0) { horizontalLocation = 6; }
        if (horizontalLocation < 4){ // if less than four check to the right.
            if (moves[loc-1] == true && moves[loc  ] == true &&
                moves[loc+1] == true && moves[loc+2] == true){ print ("winner"); return true; }
        }
        if (horizontalLocation > 3){ // if greater than three check to the left.
            if (moves[loc-1] == true && moves[loc-2] == true &&
                moves[loc-3] == true && moves[loc-4] == true){ print ("winner"); return true; }
        }
        
        /* check the adjacent spots in the columns.
           the location % 6 + 1 (if not on the far right) gives the correct row. */
        var verticalLocation = (loc / 6);
        if (loc % 6 != 0) { verticalLocation += 1 }
        if (verticalLocation < 5){ // if less that 5, check down the column.
            if (moves[loc-1] == true && moves[loc+5] == true &&
                moves[loc+11] == true && moves[loc+17] == true){ print ("winner"); return true; }
        }
        if (verticalLocation > 3){ // if less that 5, check down the column.
            if (moves[loc-1] == true && moves[loc-7] == true &&
                moves[loc-13] == true && moves[loc-19] == true){ print ("winner"); return true; }
        }
        
        /* check the diagonals */
        
        
        
        
        
        return false;
    }
}