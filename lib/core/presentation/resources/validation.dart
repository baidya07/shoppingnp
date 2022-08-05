class Validation {
  static const String VALIDATION_TYPE_NAME = 'Full Name';
  static const String VALIDATION_TYPE_EMAIL = 'Email';
  static const String VALIDATION_TYPE_PASSWORD = 'Password';
  static const String VALIDATION_TYPE_PHONE = 'Phone';
  static const String VALIDATION_TYPE_EMAIL_OR_PHONE = 'Email or Phone';
  static const String VALIDATION_TYPE_IS_EMPTY = 'Is Empty';
  static const String VALIDATION_TYPE_NO_VALIDATION = 'No Validation';

  final String _fullNameRegex =
      r'(^[A-Z][a-zA-Z]{2,}(?: [A-Z][a-zA-Z]*){0,2}$)';
  final String _phoneRegex = r'(^(?:[+0]9)?[0-9]{10}$)';
  final String _passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  final String _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  handleValidation({labelText, value}) {
    switch (labelText) {
      case VALIDATION_TYPE_NAME:
        bool isfullNameValid = fullNameValid(value);
        if (value.isEmpty) {
          return 'Please enter Full Name';
        } else if (!isfullNameValid) {
          return 'Not valid name';
        }

        break;

      case VALIDATION_TYPE_EMAIL:
        bool isEmailValid = emailValid(value);
        if (value.isEmpty) {
          return 'Please enter email';
        } else if (!isEmailValid) {
          return 'Enter valid email';
        }

        break;

      case VALIDATION_TYPE_PASSWORD:
        bool isValidPassword = validPassword(value);

        if (value.isEmpty) {
          return 'Please enter password';
        } else {
          if (!isValidPassword) {
            return '*8 characters, 1 upper and 1 numeric ';
          } else {
            return null;
          }
        }

      case VALIDATION_TYPE_PHONE:
        bool isValidPhone = phoneValid(value);

        if (value.isEmpty) {
          return 'Please enter Phone Number';
        } else {
          if (!isValidPhone) {
            return 'Not Valid Phone';
          } else {
            return null;
          }
        }

      case VALIDATION_TYPE_EMAIL_OR_PHONE:
        bool isValidEmailOrPhone = phoneValid(value) || emailValid(value);

        if (value.isEmpty) {
          return 'Please enter Phone Number or Email';
        } else {
          if (!isValidEmailOrPhone) {
            return 'Not valid email id or phone number';
          } else {
            return null;
          }
        }

      case VALIDATION_TYPE_IS_EMPTY:
        if (value.isEmpty) {
          return 'This Field is required';
        } else {
          return null;
        }

      case VALIDATION_TYPE_NO_VALIDATION:
        return null;

      default:
        return null;
    }
  }

  bool emailValid(email) {
    return RegExp(_emailRegex).hasMatch(email);
  }

  bool validPassword(value) {
    return RegExp(_passwordRegex).hasMatch(value);
  }

  bool phoneValid(value) {
    return RegExp(_phoneRegex).hasMatch(value);
  }

  bool fullNameValid(value) {
    return RegExp(_fullNameRegex).hasMatch(value);
  }
}
