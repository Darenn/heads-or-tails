// First choose a coin
chooseCoin();

// Draw a message below the cowboy
drawMessageBox("Heads or Tails ?", 0.5, 150, 150);

// Spin the chosen coin
spinCoin(self.chosenCoinID);

// Draw choices box
drawChoiceButtons();

self.turn++;
self.step++;
// If we did the last step, go back to ther first step
if (self.step == 5) {
    self.step = 1;
}
