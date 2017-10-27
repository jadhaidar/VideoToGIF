Toolbar tb;
VideoPlayer vp;
GIFExporter gifExporter;

int currentKnobPosition;

// ================================================ //
void settings() {
  size(displayWidth-200, displayHeight-200);
}
void setup() {
  background(0);
  surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);

  tb = new Toolbar();
}
void draw() {
  if (vp != null) {
    vp.Display();
    if (vp.init)
      tb.UpdateSlider(vp.GetTime(), vp.GetDuration());

    if (gifExporter != null && gifExporter.isExporting) {
      gifExporter.AddFrame(vp.GetMovie().get());
      if (vp.GetTime() >= vp.GetDuration()-1) {
        gifExporter.SetExporting(false);
        gifExporter.Export();
        tb.exportVideo.SetIcon(loadImage("icons/export.png"));
        tb.playPauseToggle.SetToggled(false);
        vp.Stop();
        cursor(ARROW);
      }
    }
  }

  tb.Display();
}

// ================= MouseActions ================= //
void mouseMoved() {
  tb.MouseMoved();
}
void mousePressed() {
  tb.MousePressed();

  if (tb.openVideo.IsMouseOver()) {
    selectInput("Select a video:", "fileSelected");
    while (vp == null) noLoop();
    loop();
  }

  if (vp != null) {
    if (tb.playPauseToggle.IsMouseOver()) {            // play
      if (tb.playPauseToggle.isToggled) vp.Play();
      else vp.Pause();
    }
    if (tb.stopVideo.IsMouseOver()) {                  // stop
      vp.Stop();
      tb.playPauseToggle.SetToggled(false);
    }
    if (tb.loopToggle.IsMouseOver()) {                 // loop
      vp.SetLoop(tb.loopToggle.isToggled);
    }
    if (tb.exportVideo.IsMouseOver()) {                // export
      gifExporter = new GIFExporter(this);
      tb.exportVideo.SetText("Exporting...");
      gifExporter.SetExporting(true);
      tb.playPauseToggle.SetToggled(true);
      vp.Play();
      cursor(WAIT);
    }
  }
}
void mouseDragged() {
  tb.MouseDragged();
}
void mouseReleased() {
  if (vp != null && tb.slider.isInvalidated)
    vp.Jump(tb.SliderValue() * vp.GetDuration());

  tb.MouseReleased();
}

// ==================== utils ===================== //
void fileSelected(File selection) {
  if (selection == null) return;
  else {
    vp = new VideoPlayer(this, selection.getAbsolutePath());
    vp.LoadFirstFrame();
    tb.ResetSlider();
  }
}

void movieEvent(Movie m) {
  m.read();
}
// ================================================ //