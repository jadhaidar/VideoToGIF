class ToggleButton implements MouseActions {
  // ================== constants  ================== //
  private final PFont font = createFont("calibri", 18);
  private final color blue_primary = color(53, 122, 232);
  private final color blue_hover = color(18, 98, 225);
  private final color blue_click = color(8, 75, 180);

  // ================ private fields ================ //
  private int x, y, w, h;
  private String text, textToggled, currentTextState;
  private PImage icon, iconToggled, currentIconState;
  private boolean isToggled;
  private color currentColorState;

  // ================= constructors ================= //
  private ToggleButton(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    currentColorState = blue_primary;
    textFont(font);
    textAlign(CENTER, CENTER);
  }
  ToggleButton(int x, int y, int w, int h, String text, String textToggled) {
    this(x, y, w, h);
    this.text = text;
    this.textToggled = textToggled;
    currentTextState = text;
  }
  ToggleButton(int x, int y, int w, int h, PImage icon, PImage iconToggled) {
    this(x, y, w, h);
    this.icon = icon;
    this.iconToggled = iconToggled;
    currentIconState = icon;
  }
  ToggleButton(int x, int y, int w, int h, String text) {
    this(x, y, w, h, text, text);
  }
  ToggleButton(int x, int y, int w, int h, PImage icon) {
    this(x, y, w, h, icon, icon);
  }
  // ==================== display =================== //
  void Display() {
    fill(currentColorState);
    noStroke();
    rect(x, y, w, h);

    if (text != null) {
      fill(255);
      text(currentTextState, x+w/2, y+h/2);
    }
    if (icon != null) {
      image(currentIconState, x+w/2-icon.width/2, y+h/2-icon.height/2);
    }
  }

  // ==================== utils ===================== //
  boolean IsMouseOver() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      currentColorState = isToggled ? blue_click : blue_hover;
      return true;
    } else {
      currentColorState = isToggled ? blue_click : blue_primary;
      return false;
    }
  }
  void SetToggled(boolean b) {
    isToggled = b;
    currentTextState = isToggled ? textToggled : text;
    currentIconState = isToggled ? iconToggled : icon;
  }

  // ================= MouseActions ================= //
  void MouseMoved() {
    IsMouseOver();
  }
  void MousePressed() {
    if (IsMouseOver()) {
      isToggled = !isToggled;
      currentTextState = isToggled ? textToggled : text;
      currentIconState = isToggled ? iconToggled : icon;
      currentColorState = blue_click;
    }
  }
  void MouseDragged() {
    return;
  }
  void MouseReleased() {
    if (IsMouseOver()) currentColorState = isToggled ? blue_click : blue_hover;
  }
}