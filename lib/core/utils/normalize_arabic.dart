/// A RegExp that matches Arabic diacritics (Tashkeel).
final RegExp _arabicDiacritics =
    RegExp(r'[\u0617-\u061A\u064B-\u0652\u0657-\u065F\u0670\u06D6-\u06ED]');

/// Normalizes Arabic text by:
/// 1. Removing diacritics (Tashkeel)
/// 2. Converting variant forms of letters to a standard form
/// 3. Converting Arabic and Persian digits to Western digits
/// 4. Normalizing whitespace
/// 
/// Example usage:
/// ```dart
/// final normalized = normalizeArabic("هٰذَا نَصّ ١٢٣");
/// print(normalized); // Output: هذا نص 123
/// ```
String normalizeArabic(String? text) {
  if (text == null || text.isEmpty) return '';

  String result = text;

  result = result.replaceAll(_arabicDiacritics, '');

  const replacements = <String, String>{
    // Alef variants
    'أ': 'ا',
    'إ': 'ا',
    'آ': 'ا',
    'ٱ': 'ا',

    // Yeh & Alef Maqsura
    'ى': 'ي',
    'ئ': 'ي',
    'يٰ': 'ي',

    // Teh Marbuta
    'ة': 'ه',
    'ۀ': 'ه',

    // Waw + Hamza
    'ؤ': 'و',

    // Kaf variants
    'ك': 'ك',
    'ﮎ': 'ك',
    'ﮏ': 'ك',
    'ﮐ': 'ك',
    'ﮑ': 'ك',

    // Heh variants
    'ھ': 'ه',
    'ہ': 'ه',

    // Lam Alef ligatures
    'ﻻ': 'لا',
    'ﻷ': 'لا',
    'ﻹ': 'لا',
    'ﻵ': 'لا',

    // Tatweel
    'ـ': '',

    // Arabic digits → Western digits
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',

    // Persian digits → Western digits
    '۰': '0',
    '۱': '1',
    '۲': '2',
    '۳': '3',
    '۴': '4',
    '۵': '5',
    '۶': '6',
    '۷': '7',
    '۸': '8',
    '۹': '9',
  };

  replacements.forEach((from, to) {
    result = result.replaceAll(from, to);
  });

  return result.replaceAll(RegExp(r'\s+'), ' ').trim();
}
