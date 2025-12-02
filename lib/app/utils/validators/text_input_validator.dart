extension TextInputValidator on String? {
  String? isRequired(String fieldName) {
    if (this == null || this!.trim().isEmpty) {
      return "$fieldName tidak boleh kosong.";
    }
    return null;
  }

  String? minLength(int length, String fieldName) {
    if ((this ?? '').trim().length < length) {
      return "$fieldName memiliki minimal $length karakter.";
    }
    return null;
  }

  String? maxLength(int length, String fieldName) {
    if ((this ?? '').trim().length > length) {
      return "$fieldName memiliki maksimal $length karakter.";
    }
    return null;
  }

  String? exactLength(int length, String fieldName) {
    if ((this ?? '').trim().length != length) {
      return "$fieldName memiliki tepat $length karakter.";
    }
    return null;
  }

  String? isEmail() {
    final value = this?.trim() ?? "";
    const pattern =
        r'^[\w\.-]+@[\w\.-]+\.\w+$';
    if (!RegExp(pattern).hasMatch(value)) {
      return "Format email tidak valid.";
    }
    return null;
  }

  String? isUsername() {
    final value = this?.trim() ?? "";
    const pattern = r'^[a-zA-Z0-9._]{3,}$';
    if (!RegExp(pattern).hasMatch(value)) {
      return "Username hanya boleh huruf, angka, titik, dan underscore.";
    }
    return null;
  }

  String? isPasswordStrong({String? fieldName}) {
    final value = this ?? "";
    const pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]+$';
    if (!RegExp(pattern).hasMatch(value)) {
      return "${fieldName ?? 'Kata sandi'} harus memiliki huruf besar, kecil, dan angka.";
    }
    return null;
  }

  String? isNumeric(String fieldName) {
    if (!RegExp(r'^[0-9]+$').hasMatch(this ?? "")) {
      return "$fieldName hanya boleh berisi angka.";
    }
    return null;
  }

  String? isAlphabet(String fieldName) {
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(this ?? "")) {
      return "$fieldName hanya boleh berisi huruf.";
    }
    return null;
  }

  String? isPhoneNumber() {
    final value = this ?? "";
    if (!RegExp(r'^(?:\+62|62|0)?[0-9]{9,13}$').hasMatch(value)) {
      return "Nomor telepon tidak valid.";
    }
    return null;
  }

  String? matchRegex(String pattern, String errorMessage) {
    if (!RegExp(pattern).hasMatch(this ?? "")) {
      return errorMessage;
    }
    return null;
  }

  String? isNationalId() {
    if (!RegExp(r'^[0-9]{16}$').hasMatch(this ?? "")) {
      return "NIK harus 16 digit angka.";
    }
    return null;
  }

  String? isCapitalized(String fieldName) {
    final value = this?.trim() ?? "";
    if (value.isNotEmpty && value[0] != value[0].toUpperCase()) {
      return "$fieldName harus diawali huruf kapital.";
    }
    return null;
  }

  String? confirmWith(String? otherPassword) {
    if ((this ?? "") != (otherPassword ?? "")) {
      return "Konfirmasi password tidak cocok.";
    }
    return null;
  }
}
