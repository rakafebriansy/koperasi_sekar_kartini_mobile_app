import 'dart:convert';

extension QuillDeltaExtension on String {
  String toPlainTextFromQuill() {
    try {
      final List<dynamic> ops = json.decode(this);
      final buffer = StringBuffer();

      for (final op in ops) {
        buffer.write(op['insert']);
      }

      return buffer.toString();
    } catch (e) {
      return this;
    }
  }
}
