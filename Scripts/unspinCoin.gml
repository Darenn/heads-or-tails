/// unspinCoin(coinInstanceID)
// unSpin the piece by change its sprite and size

argument0.image_xscale /= 2;
argument0.image_yscale /= 2;
argument0.sprite_index = sp_coin;
audio_play_sound(coinLanding, 10, false);

