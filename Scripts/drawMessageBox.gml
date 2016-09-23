/// drawMessageBox ("Text", speed, x, y)

var txt = instance_create(argument2, argument3, obj_text);
with (txt) {

    self.padding = 16;
    self.maxLength = view_wview[0];
    self.text = argument0;
    self.spd = argument1;
    self.font = fnt;
    
    self.textLength = string_length(text);
    self.font_size = font_get_size(font);
    
    self.textWidth = string_width_ext(self.text, self.font_size + (self.font_size / 2), self.maxLength);
    self.textHeight = string_height_ext(text, self.font_size + (self.font_size / 2), self.maxLength);
    
    self.boxWidth = self.textWidth + (self.padding * 2);
    self.boxHeight = self.textHeight + (self.padding * 2);
}
