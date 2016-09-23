/// Put Pieces on the table
// This script put one piece on the table relative to the current step.
// It calls himself at the end with an alarm set to 1 second to put the next piece.
// When enough pieces are put, it stops, and call AskPlayer script.

var coinID = 0; // The instance ID of the piece to put on table

// Be careful : The order of dests is already switched : "1 3 2 4"

// Do actions relative to current step in game (4 steps)
switch (self.step) {
// STEP 1 : Take one Tails, one Heads         
    case 1 :
        if (self.numberHeadsPiecesPutOnTable < self.numberTailsPiecesPutOnTable) {
            coinID = instance_find(global.headsCoinId, self.numberHeadsPiecesPutOnTable); 
            self.numberHeadsPiecesPutOnTable++;
        } else {
            coinID = instance_find(global.tailsCoinId, self.numberTailsPiecesPutOnTable);
            self.numberTailsPiecesPutOnTable++;
        }
    break;
// STEP 2 : Take one Heads, one Tails
    case 2 :
        if (self.numberHeadsPiecesPutOnTable <= self.numberTailsPiecesPutOnTable) {
            coinID = instance_find(global.headsCoinId, self.numberHeadsPiecesPutOnTable);
            self.numberHeadsPiecesPutOnTable++; 
        } else {
            coinID = instance_find(global.tailsCoinId, self.numberTailsPiecesPutOnTable);
            self.numberTailsPiecesPutOnTable++;
        }
    break;
// STEP 3 : Take two Tails, one Heads
    case 3 :
        if (self.numberHeadsPiecesPutOnTable < self.numberTailsPiecesPutOnTable - 1) {
            coinID = instance_find(global.headsCoinId, self.numberHeadsPiecesPutOnTable);
            self.numberHeadsPiecesPutOnTable++; 
        } else {
            coinID = instance_find(global.tailsCoinId, self.numberTailsPiecesPutOnTable);
            self.numberTailsPiecesPutOnTable++;
        }
    break;
// STEP 4 : Take two Heads, one Tails
    case 4 :
        if (self.numberHeadsPiecesPutOnTable < self.numberTailsPiecesPutOnTable) {
            coinID = instance_find(global.headsCoinId, self.numberHeadsPiecesPutOnTable);
            self.numberHeadsPiecesPutOnTable++; 
        } else {
            coinID = instance_find(global.tailsCoinId, self.numberTailsPiecesPutOnTable);
            self.numberTailsPiecesPutOnTable++;
        }
    break;
    default :
        show_error("Error while put coins", true);
}

numberPiecesOnTable = self.numberHeadsPiecesPutOnTable + self.numberTailsPiecesPutOnTable;
var destID = instance_find(global.destID, numberPiecesOnTable);
moveCoin (coinID, destID.x, destID.y, 10);
ds_map_add(self.mapDestCoin, destID, coinID);

if (numberPiecesOnTable == self.numberPiecesToPut) {
    // Wait numberPieces time, and call AskPlayer script.
    alarm[1] = global.FPS * self.numberPiecesToPut;
} else {
    // Wait 1 second and recall this script 
    alarm[0] = global.FPS * 1;
}


