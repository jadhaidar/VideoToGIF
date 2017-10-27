import gifAnimation.*;
import static javax.swing.JOptionPane.*;

class GIFExporter {
  // ================ private fields ================ //
  private GifMaker gifExport;
  private boolean isExporting;

  // ================= constructors ================= //
  GIFExporter(PApplet parent) {
    gifExport = new GifMaker(parent, "export.gif");
    gifExport.setDelay(250);
    gifExport.setRepeat(0);
  }

  // ===================== core ===================== //
  void AddFrame(PImage frame) {
    gifExport.addFrame(frame);
  }

  void Export() {
    if (gifExport.finish()) showMessageDialog(null, "GIF exported successfully.", "Success", INFORMATION_MESSAGE);
    else showMessageDialog(null, "An error has occured while trying to export video. Make sure video is loaded properly", "Error", WARNING_MESSAGE);
  }

  // ==================== utils ===================== //
  void SetExporting(boolean b) {
    this.isExporting = b;
  }
}