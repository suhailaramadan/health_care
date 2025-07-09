class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return "البريد الإلكتروني مطلوب";
    } else if (emailRegex.hasMatch(val) == false) {
      return "يرجى إدخال بريد الكتروني صحيح";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).*$');
    //  RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return 'كلمة المرور مطلوبة';
    } else if (val.isEmpty) {
      return 'كلمة المرور مطلوبة';
    } else if (!passwordRegex.hasMatch(val)) {
      return 'يجب أن تحتوي كلمة المرور على 10 أحرف على الأقل(أرقام وحروف)';
    } else {
      return null;
    }
  }

  // static String? validateConfirmPassword(String? val, String? password) {
  //   if (val == null || val.isEmpty) {
  //     return 'يرجى تأكيد كلمة المرور';
  //   } else if (val != password) {
  //     return 'كلمة المرور غير متطابقة';
  //   } else {
  //     return null;
  //   }
  // }

  // static String? validateUsername(String? val) {
  //   final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
  //   if (val == null) {
  //     return 'this field is required';
  //   } else if (val.isEmpty) {
  //     return 'this field is required';
  //   } else if (!usernameRegex.hasMatch(val)) {
  //     return 'enter valid username';
  //   } else {
  //     return null;
  //   }
  // }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'الاسم مطلوب';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    final RegExp phoneNumber = RegExp(r'/^(?:\+20|0)1[0-25]\d{8}$/');
    // const String phonePattern = r'/^(?:\+20|0)1[0-25]\d{8}$/';

    // if (val == null || val.isEmpty) {
    //   return "Enter your phone number";
    // // } else if (!phoneNumber.hasMatch(val)) {
    // //   return "Enter a correct number";
    // }
    // return null;
    if (val == null) {
      return 'رقم الهاتف مطلوب';
    } else if (val.isEmpty) {
      return 'رقم الهاتف مطلوب';
    } else if (val.trim().length != 11) {
      // return "يرجى إدخال رقم هاتف مصرى صالح";
      return 'يجب أن تحتوي كلمة المرور على 10 أحرف على الأقل(أرقام وحروف)';
    } else {
      return null;
    }

    // if (val == null || int.tryParse(val.trim()) == null) {
    //   return 'رقم الهاتف مطلوب';
    // } else if (val.trim().length != 11) {
    //   return 'يرجى إدخال رقم هاتف صحيح مكون من 11 رقم';
    // } else {
    //   return null;
    // }
  }

  static String? validateNationalId(String? val) {
    if (val == null || int.tryParse(val.trim()) == null) {
      return 'الرقم القومي مطلوب';
    } else if (val.trim().length != 14) {
      return 'يرجى أدخال رقم قومي صحيح مكون من 14 رقم';
    } else {
      return null;
    }
  }
}
