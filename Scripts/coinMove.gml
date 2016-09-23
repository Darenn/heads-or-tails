if (point_distance(x, y, self.targetPositionX, self.targetPositionY) > self.moveSpeed) {
    move_towards_point(self.targetPositionX, self.targetPositionY, self.moveSpeed);
} else {
    self.moveSpeed = 0;
}
