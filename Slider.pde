class Slider implements MouseActions {
  // ================== constants  ================== //
  private final color blue_primary = color(53, 122, 232);
  private final PFont font = createFont("calibri", 18);

  // ================ private fields ================ //
  private int x, y, w, h;
  private int curr, len;
  boolean isInvalidated;
  private Knob knob;

  // ================= constructors ================= //
  Slider(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    curr = 0;
    len = 0;
    textFont(font);
    textAlign(CENTER, CENTER);
    knob = new Knob(x+65, y+(h/2), 20);
    knob.SetConstrains(x+65, w-65+x);
  }

  // ==================== display =================== //
  void Display() {
    fill(blue_primary);
    rect(x, y, w, h);
    fill(255);
    rect(x+65, y+15, w-130, 10, 30);
    text(TimeParser.Parse(curr), x+30, y+18);
    text(TimeParser.Parse(len), x+w-30, y+18);
    knob.Display();
  }

  // ===================== core ===================== //
  void Update(float curr, float len) {
    if (!isInvalidated) {
      this.curr = (int) curr;
      this.len = (int) len;
      knob.Update(curr, len);
    }
  }
  void Reset() {
    knob.Reset();
  }

  // ==================== utils ===================== //
  boolean IsMouseOver() {
    return knob.IsMouseOver();
  }
  float GetValue() {
    return knob.value;
  }
  void SetLength(int len) {
   this.len = len; 
  }
  // ================= MouseActions ================= //
  void MouseMoved() {
    knob.IsMouseOver();
  }
  void MousePressed() {
  }
  void MouseDragged() {
    isInvalidated = true;
    knob.Drag();
  }
  void MouseReleased() {
    knob.Lock();
    isInvalidated = false;
  }
  // =============================================== //
}

private class Knob {
  // ================== constants  ================== //
  private final color blue_primary = color(90, 147, 237);
  private final color blue_secondary = color(133, 175, 242);

  // ================ private fields ================ //
  private int x, y, size;
  private int xOffset, xMin, xMax;
  private boolean isLocked;

  // ================ public fields ================ //
  float value;

  // ================= constructors ================= //
  Knob(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    isLocked = true;
  }

  // ==================== display =================== //
  void Display() {
    fill(blue_primary);
    stroke(blue_secondary);
    ellipse(x, y, size, size);
  }

  // ===================== core ===================== //
  void Drag() {
    if (!isLocked) {
      x = constrain(mouseX - xOffset, xMin, xMax);
      value = map(x, xMin, xMax, 0, 100);
    }
  }
  void Update(float curr, float len) {
    x = (int) map(curr, 0, len, xMin, xMax);
    value = map(x, xMin, xMax, 0, 100);
  }
  void Lock() {
    isLocked = true;
  }

  // ==================== utils ===================== //
  boolean IsMouseOver() {
    if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < size/2 ) {  
      isLocked = false;
      xOffset = mouseX - x;
      return true;
    } else return false;
  }  
  void SetConstrains(int min, int max) {
    xMin = min;
    xMax = max;
  }
  void Reset() {
    x = xMin;
    value = 0;
  }
  // ================================================ //
}