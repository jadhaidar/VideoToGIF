import java.util.concurrent.TimeUnit;

static class TimeParser {
  static String Parse(int time) {
    int hours = (int) TimeUnit.SECONDS.toHours(time);
    int minutes = (int) (TimeUnit.SECONDS.toMinutes(time)-(TimeUnit.SECONDS.toHours(time) * 60));
    int seconds = (int) (TimeUnit.SECONDS.toSeconds(time)-(TimeUnit.SECONDS.toMinutes(time) * 60));
    if (hours > 0) return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    else return String.format("%02d:%02d", minutes, seconds);
  }
}