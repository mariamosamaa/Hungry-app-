/// Reusable form validators.
/// كل شروط الـ validation في مكان واحد — لو حبيتي تغيري شرط
/// (زي طول الباسورد أو صيغة الرقم) غيريه هنا بس وهيتطبق في كل الفورمز.
class Validators {
  /// شرط عام: الحقل مش فاضي
  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// الاسم: مش فاضي + 3 أحرف على الأقل
  static String? name(String? value) {
    final err = required(value, fieldName: 'Name');
    if (err != null) return err;
    if (value!.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  /// الإيميل: مش فاضي + صيغة إيميل صحيحة (فيها @ و . بعدها)
  static String? email(String? value) {
    final err = required(value, fieldName: 'Email');
    if (err != null) return err;
    final emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// رقم الموبايل المصري: 11 رقم بالظبط، يبدأ بـ 010 / 011 / 012 / 015
  /// غيري الـ Regex هنا لو محتاجة صيغة دولة تانية
  static String? egyptianPhone(String? value) {
    final err = required(value, fieldName: 'Phone number');
    if (err != null) return err;
    final phone = value!.trim();
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (!phoneRegex.hasMatch(phone)) {
      return 'Enter a valid 11-digit phone number (e.g. 01012345678)';
    }
    return null;
  }

  /// الباسورد: 6 أحرف/أرقام على الأقل
  static String? password(String? value, {int minLength = 6}) {
    final err = required(value, fieldName: 'Password');
    if (err != null) return err;
    if (value!.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }
}
