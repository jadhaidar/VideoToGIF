class Button implements MouseActions {
  // ================== constants  ================== //
  private final PFont font = createFont("calibri", 18);
  private final color blue_primary = color(53, 122, 232);
  private final color blue_hover = color(18, 98, 225);
  private final color blue_click = color(8, 75, 180);

  // ================ private fields ================ //
  private int x, y, w, h;
  private String text;
  private PImage icon;
  private color currentColorState;
  private boolean isText;

  // ================= constructors ================= //
  private Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    currentColorState = blue_primary;
    textFont(font);
    textAlign(CENTER, CENTER);
  }
  Button(int x, int y, int w, int h, String text) {
    this(x, y, w, h);
    this.text = text;
    isText = true;
  }
  Button(int x, int y, int w, int h, PImage icon) {
    this(x, y, w, h);
    this.icon = icon;
  }
  Button(int x, int y, int w, int h, PImage icon, String text) {
    this(x, y, w, h);
    this.icon = icon;
    this.text = text;
  }

  // ==================== display =================== //
  void Display() {
    fill(currentColorState);
    noStroke();
    rect(x, y, w, h);

    if (text != null && isText) {
      fill(255);
      text(text, x+w/2, y+h/2);
    } else if (icon != null) {
      image(icon, x+w/2-icon.width/2, y+h/2-icon.height/2);
    }
  }

  // ==================== utils ===================== //
  boolean IsMouseOver() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      currentColorState = blue_hover;
      return true;
    } else {
      currentColorState = blue_primary;
      return false;
    }
  }
  void SetText(String text) {
    this.text = text;
    isText = true;
  }
  void SetIcon(PImage icon) {
    this.icon = icon;
    isText = false;
  }

  // ================= MouseActions ================= //
  void MouseMoved() {
    IsMouseOver();
  }
  void MousePressed() {
    if (IsMouseOver()) currentColorState = blue_click;
  }
  void MouseDragged() {
    return;
  }
  void MouseReleased() {
    if (IsMouseOver()) currentColorState = blue_hover;
  }
  // ================================================ //
}