import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';

class TTSHelper {
  final FlutterTts flutterTts = FlutterTts();

  String detectLanguage(String text) {
    if (text.isEmpty) return 'en-US';

    // Count character types
    int cyrillicCount = 0;
    int latinCount = 0;

    for (var char in text.runes) {
      if (char >= 0x0400 && char <= 0x04FF) {
        cyrillicCount++; // Cyrillic (Russian, Uzbek)
      } else if ((char >= 0x0041 && char <= 0x005A) ||
          (char >= 0x0061 && char <= 0x007A)) {
        latinCount++; // Latin
      }
    }

    int totalLetters = cyrillicCount + latinCount;
    if (totalLetters == 0) return 'en-US';

    // If more than 30% Cyrillic, it's Russian or Uzbek in Cyrillic script
    if (cyrillicCount / totalLetters > 0.3) {
      return 'ru-RU'; // Use Russian TTS for both Russian and Uzbek Cyrillic
    }

    // For Latin script, check for Uzbek-specific patterns
    if (_isUzbek(text)) {
      return 'ru-RU'; // Since uz-UZ is not available, use Russian for Uzbek
    }

    return 'en-US'; // Default to English
  }

  bool _isUzbek(String text) {
    // Only use UZBEK-SPECIFIC characters and words
    // Don't use 'sh', 'ch', 'ng' as they're common in English!

    String lowerText = text.toLowerCase();

    // Uzbek-specific special characters (with apostrophes)
    List<String> uzbekSpecialChars = [
      'oʻ', 'gʻ', // Unicode apostrophe
      'o\'', 'g\'', // Regular apostrophe
    ];

    // Check for Uzbek special characters first
    for (var char in uzbekSpecialChars) {
      if (lowerText.contains(char)) {
        return true; // Definitely Uzbek if it has these characters
      }
    }

    // Common Uzbek words (be more specific)
    List<String> uzbekWords = [
      'respublika',
      'uzbekistan',
      'qonun',
      'huquq',
      'davlat',
      'xalq',
      'qilish',
      'uchun',
      'bilan',
    ];

    // Count Uzbek-specific words
    int uzbekWordCount = 0;
    for (var word in uzbekWords) {
      RegExp wordRegex = RegExp(r'\b' + word + r'\b', caseSensitive: false);
      if (wordRegex.hasMatch(lowerText)) {
        uzbekWordCount++;
      }
    }

    // Need at least 2 Uzbek-specific words to be confident
    return uzbekWordCount >= 2;
  }

  Future<void> speakWithAutoLanguage(String text) async {
    String language = detectLanguage(text);

    log('Detected language: $language for text: ${text.substring(0, text.length > 50 ? 50 : text.length)}...');

    await flutterTts.setLanguage(language);
    await flutterTts.speak(text);
  }

  // Optional: Initialize TTS settings
  Future<void> initialize() async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    // Check if Uzbek is available
    List<dynamic> languages = await flutterTts.getLanguages;
    log('Available TTS languages: $languages');

    // Check if uz-UZ is available
    bool hasUzbek = languages.contains('uz-UZ');
    log('Uzbek TTS available: $hasUzbek');
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }
}
