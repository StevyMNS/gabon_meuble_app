class GMValidator {
  /// Empty Text Validator
  static String? validateEmptyText(String? firstName, String? value) {
    if (value == null || value.isEmpty) {
      return '$firstName est requis.';
    }

    return null;
  }

  /// Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'e-mail est requis.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Adresse e-mail invalide.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Le mot de passe doit contenir au moins une lettre majuscule.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Le mot de passe doit contenir au moins un chiffre.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Le mot de passe doit contenir au moins un caractère spécial.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro de téléphone est requis.';
    }

    // Expression régulière pour un numéro gabonais local à 9 chiffres, débutant par 01, 06 ou 07
    final phoneRegExp = RegExp(r'^(01|06|07)\d{7}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Numéro de téléphone invalide. Format attendu : 06XXXXXXX.';
    }

    return null;
  }
}
