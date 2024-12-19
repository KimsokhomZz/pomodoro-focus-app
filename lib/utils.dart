//email validation
String? userEmailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your email';
  }
  // Regular expression to check for valid email format
  String pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value.trim())) {
    return 'Please enter a valid email address';
  }

  return null;
}

//password validation
String? passwordValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }

  return null;
}
