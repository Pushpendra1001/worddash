// import 'package:flutter_tts/flutter_tts.dart';

// class TextToSpeechService {
//   final FlutterTts _flutterTts = FlutterTts();
//   bool _isEnabled = true;

//   TextToSpeechService() {
//     _initTts();
//   }

//   void _initTts() async {
//     await _flutterTts.setLanguage("en-US");
//     await _flutterTts.setSpeechRate(0.5); // Slower speech rate for clarity
//     await _flutterTts.setVolume(1.0);
//     await _flutterTts.setPitch(1.0);
//   }

//   Future<void> speak(String text) async {
//     if (_isEnabled) {
//       await _flutterTts.speak(text);
//     }
//   }

//   void setEnabled(bool isEnabled) {
//     _isEnabled = isEnabled;
//   }

//   bool get isEnabled => _isEnabled;
// }