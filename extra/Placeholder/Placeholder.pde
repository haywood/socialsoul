size(480, 480);
stroke(255);
strokeWeight(4);
noFill();
background(0);
float p = 10;
rect(p, p, width - 2*p, height - 2*p);
line(p, p, width - p, height - p);
line(width - p, p, p, height - p);
saveFrame("placeholder.png");
