import 'dart:math';

class Helpers {
 static List<T> shuffleList<T>(List<T> list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
    return list;
  }

 
  static List pickRandomItems<T>(List<T> list, int count) {
    final shuffled = shuffleList(List.from(list));
    return shuffled.take(count).toList();
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
