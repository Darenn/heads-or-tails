/// event_endOfTurn()
if (self.step == 3 && self.numberPiecesToPut < 11) { // will add a piece at step 3
    self.numberPiecesToPut++;
}
with(all) {
    event_user(2);
}
alarm[9] = 30 * 3;
