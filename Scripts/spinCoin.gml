/// spinPiece(coinInstanceID)
// Spin the piece by change its sprite and size

argument0.sprite_index = sp_coinSpinning;
argument0.image_xscale *= 2;
argument0.image_yscale *= 2;
audio_play_sound(coinSwip, 10, false);
