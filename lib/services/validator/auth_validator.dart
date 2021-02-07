class Validator {
  static Pattern _email =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  static String emailValidator(val) {
    if (!RegExp(_email).hasMatch(val)) {
      return "Please Enter valid email";
    }
    return null;
  }

  static String passwordValidator(val) {
    if (val.length < 5) {
      return "Please Enter more than 6 char";
    }
    return null;
  }

  static String nameValidator(val) {
    if (val.length < 4) {
      return "Please Enter your name";
    }
    return null;
  }
}
