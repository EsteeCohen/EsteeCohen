String[][] strs = new String[6][2];
boolean[] heart = new boolean[6];
PFont fontMain;
PFont fontSub;
int i = 0;
boolean deleting = false;
int s = 0;
int offset = 60;

void setup() {
  size(1920, 1080);
  fontMain = createFont("SansSerif", 60);
  fontSub = createFont("SansSerif", 40);
  frameRate(30);
  strs[0][0] = "Hey there!";
  strs[0][1] = "My name is Estee Cohen.";
  strs[1][0] = "I'm a Software Engineering student";
  strs[1][1] = "at Ben-Gurion University, member of the Atidim Program.";
  strs[2][0] = "I build with React, Node.js and TypeScript";
  strs[2][1] = "and I love bringing ideas to life through code.";
  strs[3][0] = "When I'm not coding,";
  strs[3][1] = "you'll find me cooking and baking.";
  strs[4][0] = "I teach the next generation of women in tech";
  strs[4][1] = "as a QueenB instructor";
  heart[4] = true;
  strs[5][0] = "Feel free to reach out to say hi!";
  strs[5][1] = "email: esteehayacohen@gmail.com";
}

void drawSub(String full, String shown, boolean withHeart, float y) {
  textFont(fontSub);
  textSize(40);
  if (withHeart && shown.length() >= full.length()) {
    String h = "  \u2665";
    float wText = textWidth(full);
    float wHeart = textWidth(h);
    float startX = width / 2 - (wText + wHeart) / 2;
    textAlign(LEFT, CENTER);
    fill(0);
    text(full, startX, y);
    fill(255, 105, 180);
    text(h, startX + wText, y);
  } else {
    textAlign(CENTER, CENTER);
    fill(0);
    text(shown, width / 2, y);
  }
}

void draw() {
  background(255);
  if (s >= strs.length) {
    s = 0;
    i = 0;
    deleting = false;
  }
  String m = strs[s][0];
  String sub = strs[s][1];
  int maxLen = max(m.length(), sub.length());
  String mShown = m.substring(0, min(i, m.length()));
  String subShown = sub.substring(0, min(i, sub.length()));
  textFont(fontMain);
  textSize(60);
  textAlign(CENTER, CENTER);
  fill(0);
  text(mShown, width / 2, height / 2 - offset);
  drawSub(sub, subShown, heart[s], height / 2 + offset);
  if (!deleting) {
    if (i >= maxLen) {
      delay(1500);
      deleting = true;
    } else {
      i++;
    }
  } else {
    if (i <= 0) {
      deleting = false;
      s++;
    } else {
      i--;
    }
  }
}
