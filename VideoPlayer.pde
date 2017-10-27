import processing.video.*;

class VideoPlayer {
  // ================ private fields ================ //
  private Movie mov;
  private int w, h;
  private float ratio;
  private boolean init;
  private String path;

  // ================= constructors ================= //
  VideoPlayer(PApplet parent, String path) {
    this.mov = new Movie(parent, path);
    this.mov.frameRate(30);
    this.path = path;
  }

  // ==================== display =================== //
  void Display() {
    imageMode(CENTER);
    image(mov, width/2, height/2-50, w, h);
    imageMode(CORNER);
  }

  // ===================== core ===================== //
  void Play() {
    mov.play();
    if (!init) init = true;  // workaround for weird loading behavior
  }
  void Pause() {
    mov.pause();
  }  
  void Jump(float f) {
    mov.jump(f);
  }  
  void Stop() {
    mov.jump(0);
    mov.pause();
  }

  // ==================== utils ===================== //
  Movie GetMovie() {
    return mov;
  }
  String GetPath() {
    return path;
  }
  float GetDuration() {
    return mov.duration();
  }
  float GetTime() {
    return mov.time();
  }
  void SetLoop(boolean b) {
    if (b) mov.loop();
    else mov.noLoop();
  }

  // workaround to load the first frame
  // and get video dimensions
  void LoadFirstFrame() {
    mov.play();
    mov.stop();
    mov.jump(0);

    ratio = (float)(mov.width)/mov.height;

    float widthScale = (float)(width) / mov.width;
    float heightScale = (float)(height) / mov.height;

    float scale = min(widthScale,heightScale);

    w = (int) (mov.width * scale); 
    h = (int) (mov.height * scale); 

  }
  // ================================================ //
}