// Be careful : The order of dests is already switched : "1 3 2 4"
switch (self.step) {
// STEP 1 : choose the lefter + 2
    case 1 :
        self.chosenCoinID = ds_map_find_value(
        self.mapDestCoin, 
        instance_find(global.destID, 1)
        );
     break;
// STEP 2 : choose the righter - 2
    case 2 :
        self.chosenCoinID = ds_map_find_value(
        self.mapDestCoin, 
        instance_find(global.destID, self.numberPiecesToPut - 1)
        );
     break;
// STEP 3 : choose the middle if odd, else middle - 1
    case 3 :
        if (self.numberPiecesToPut % 2 != 0) {
            self.chosenCoinID = ds_map_find_value(
            self.mapDestCoin, 
            instance_find(global.destID, self.numberPiecesToPut / 2)
            );
        } else {
            self.chosenCoinID = ds_map_find_value(
            self.mapDestCoin, 
            instance_find(global.destID, (self.numberPiecesToPut / 2) + 1)
            );
        }
    break;
// STEP 4 : choose the middle if odd, else middle + 1
    case 4 :
        if (self.numberPiecesToPut % 2 != 0) {
            self.chosenCoinID = ds_map_find_value(
            self.mapDestCoin, 
            instance_find(global.destID, self.numberPiecesToPut / 2)
            );
        } else {
            self.chosenCoinID = ds_map_find_value(
            self.mapDestCoin, 
            instance_find(global.destID, (self.numberPiecesToPut / 2) - 1)
            );
        }
    break;
    default :
        show_error("Problem in chosing the coin", true);
}
global.chosenCoinID = self.chosenCoinID;
ds_map_clear(self.mapDestCoin); // Clear for next turn      
