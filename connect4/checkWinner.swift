//
//  checkwinner.swift :)
//  connect4
//
//  Created by Jared Walton on 5/18/16.
//  Copyright © 2016 Jared Walton. All rights reserved.
//

import Foundation


class checkWinner {
    
    class func checkWinner(p1moves: [Bool], p2moves: [Bool], loc: Int) -> Bool{
        //  ____________________
        //  |1  2  3  4  5  6  |1
        //  |7  8  9  10 11 12 |2
        //  |13 14 15 16 17 18 |3
        //  |19 20 21 22 23 24 |4
        //  |25 26 27 28 29 30 |5
        //  |31 32 33 34 35 36 |6
        //  |37 38 39 40 41 42 |7
        //  |------------------|
        //  | 1  2  3  4  5  6 |
        //  |__________________|
        
        /* loc is based off of the lcoation of the user move.. */
        
        
        /* check adjacent spots in rows.
           the location % 6 gives the location of the move horizontally.
           (if the result is 0, its on the far left(e.g. 6 or 12)) */
        var horizontalLocation = loc % 6;
        if (horizontalLocation == 0) { horizontalLocation = 6; }
        if (horizontalLocation < 4){ // if less than four check to the right.
            if (p1moves[loc-1] == true && p1moves[loc  ] == true &&
                p1moves[loc+1] == true && p1moves[loc+2] == true){ return true; }
            if (p2moves[loc-1] == true && p2moves[loc  ] == true &&
                p2moves[loc+1] == true && p2moves[loc+2] == true){ return true; }
        }
        if (horizontalLocation > 3){ // if greater than three check to the left.
            if (p1moves[loc-1] == true && p1moves[loc-2] == true &&
                p1moves[loc-3] == true && p1moves[loc-4] == true){ return true; }
            if (p2moves[loc-1] == true && p2moves[loc-2] == true &&
                p2moves[loc-3] == true && p2moves[loc-4] == true){ return true; }
        }
        
        /* check the adjacent spots in the columns.
           the location % 6 + 1 (if not on the far right) gives the correct row. */
        var verticalLocation = (loc / 6);
        if (loc % 6 != 0) { verticalLocation += 1 }
        if (verticalLocation < 5){ // if less that 5, check down the column.
            if (p1moves[loc-1 ] == true && p1moves[loc+5 ] == true &&
                p1moves[loc+11] == true && p1moves[loc+17] == true){ return true; }
            if (p2moves[loc-1 ] == true && p2moves[loc+5 ] == true &&
                p2moves[loc+11] == true && p2moves[loc+17] == true){ return true; }
        }
        if (verticalLocation > 3){ // if less that 5, check down the column.
            if (p1moves[loc-1 ] == true && p1moves[loc-7 ] == true &&
                p1moves[loc-13] == true && p1moves[loc-19] == true){ return true; }
            if (p2moves[loc-1 ] == true && p2moves[loc-7 ] == true &&
                p2moves[loc-13] == true && p2moves[loc-19] == true){ return true; }
        }
        
        /* check the diagonals */
        
        /* a diagonal win must include atleast one move on the middle line */
        if(checkDiagonals(p1moves) || checkDiagonals(p2moves)){ return true; }
        
        return false;
    }
    class func checkDiagonals(moves: [Bool]) -> Bool {
        if (moves[18] == true){
            
            /* checking ' / ' diagonal */
            if (moves[03] == true && moves[08] == true  && moves[13] == true){ return true; }
            
            /* checking ' \ ' diagonal */
            if (moves[25] == true && moves[32] == true  && moves[39] == true){ return true; }
        }
        if (moves[19] == true){
            
            /* checking ' / ' diagonal */
            if (moves[04] == true && moves[09] == true  && moves[14] == true){ return true; }
            if (moves[09] == true && moves[14] == true  && moves[24] == true){ return true; }
            
            /* checking ' \ ' diagonal */
            if (moves[12] == true && moves[26] == true  && moves[33] == true){ return true; }
            if (moves[26] == true && moves[33] == true  && moves[40] == true){ return true; }
        }
        if (moves[20] == true){
            
            /* checking ' / ' diagonal */
            if (moves[05] == true && moves[10] == true  && moves[15] == true){ return true; }
            if (moves[10] == true && moves[15] == true  && moves[25] == true){ return true; }
            if (moves[15] == true && moves[25] == true  && moves[30] == true){ return true; }
            
            /* checking ' \ ' diagonal */
            if (moves[06] == true && moves[13] == true  && moves[27] == true){ return true; }
            if (moves[13] == true && moves[27] == true  && moves[34] == true){ return true; }
            if (moves[27] == true && moves[34] == true  && moves[41] == true){ return true; }  // <---
        }
        if (moves[21] == true){
            
            /* checking ' / ' diagonal */
            if (moves[11] == true && moves[16] == true  && moves[26] == true){ return true; }
            if (moves[16] == true && moves[26] == true  && moves[31] == true){ return true; }
            if (moves[26] == true && moves[31] == true  && moves[36] == true){ return true; }
            
            /* checking ' \ ' diagonal */
            if (moves[00] == true && moves[07] == true  && moves[14] == true){ return true; }
            if (moves[07] == true && moves[14] == true  && moves[28] == true){ return true; }
            if (moves[14] == true && moves[28] == true  && moves[35] == true){ return true; }
        }
        if (moves[22] == true){
            
            /* checking ' / ' diagonal */
            if (moves[17] == true && moves[27] == true  && moves[32] == true){ return true; }
            if (moves[27] == true && moves[32] == true  && moves[37] == true){ return true; }
            
            /* checking ' \ ' diagonal */
            if (moves[01] == true && moves[08] == true  && moves[15] == true){ return true; }
            if (moves[08] == true && moves[15] == true  && moves[29] == true){ return true; }
        }
        if (moves[23] == true){
            
            /* checking ' / ' diagonal */
            if (moves[28] == true && moves[33] == true  && moves[38] == true){ return true; }
            
            /* checking ' \ ' diagonal */
            if (moves[02] == true && moves[09] == true  && moves[16] == true){ return true; }
        }
        return false;
    }
}