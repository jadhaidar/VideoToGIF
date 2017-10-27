class Toolbar implements MouseActions {
  // ================ private fields ================ //
  private int x, y, w, h;

  // ================ public fields ================ //
  Slider slider;
  Button openVideo, stopVideo, exportVideo;
  ToggleButton playPauseToggle, loopToggle;

  // ================= constructors ================= //
  // default
  Toolbar() {
    this(0, height-100, width, 100);
  }
  // overloaded
  Toolbar(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    slider = new Slider(x, y, w, 40);
    openVideo = new Button(x+5, y+45, 120, 50, loadImage("icons/search-folder.png"));
    exportVideo = new Button(w-125, y+45, 120, 50, loadImage("icons/export.png"));
    playPauseToggle = new ToggleButton(w/2-40, y+45, 80, 50, loadImage("icons/play.png"), loadImage("icons/pause.png"));
    stopVideo = new Button(w/2+50, y+50, 40, 40, loadImage("icons/stop.png"));
    loopToggle = new ToggleButton(w/2-90, y+50, 40, 40, loadImage("icons/loop.png"));
  }

  // ==================== display =================== //
  void Display() {
    fill(255);
    rect(x, y, w, h);
    slider.Display();
    openVideo.Display();
    exportVideo.Display();
    playPauseToggle.Display();
    stopVideo.Display();
    loopToggle.Display();
  }

  // ==================== utils ===================== //
  void UpdateSlider(float curr, float len) {
    slider.Update(curr, len);
  }
  void ResetSlider() {
    slider.Reset();
  }
  float SliderValue() {
    return slider.GetValue()/100;
  }

  // ================= MouseActions ================= //
  void MouseMoved() {
    slider.MouseMoved();
    openVideo.MouseMoved();
    exportVideo.MouseMoved();
    playPauseToggle.MouseMoved();
    stopVideo.MouseMoved();
    loopToggle.MouseMoved();
  }
  void MousePressed() {
    slider.MousePressed();
    openVideo.MousePressed();
    exportVideo.MousePressed();
    playPauseToggle.MousePressed();
    stopVideo.MousePressed();
    loopToggle.MousePressed();
  }
  void MouseDragged() {
    slider.MouseDragged();
  }
  void MouseReleased() {
    slider.MouseReleased();
    openVideo.MouseReleased();
    exportVideo.MouseReleased();
    playPauseToggle.MouseReleased();
    stopVideo.MouseReleased();
    loopToggle.MouseReleased();
  }
  // =============================================== //
}