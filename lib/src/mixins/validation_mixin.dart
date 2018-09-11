// DEPENDENCIES
// DEV LIBS

class ValidationMixin{

  String validateEmail(String val) {
    // return null on valid
    // string on error

    if (!val.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword (String val) {
    // return null on valid
    // string on error
    if (val.length < 6) {
      return 'Please enter a valid password. 6 Characters. ';
    }
    return null;
  }
}