import 'dart:convert';

class Validator {
  static String? validateName(String value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String? validateMobile(String value) {
    const pattern = r'(?:\+977[- ])?\d{2}-?\d{7,8}';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must be of 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String? validatePasswordLength(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 5) {
      return "Password must be longer than 5 characters";
    }
    return null;
  }

  static String? validateEmpty(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? validateAge(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else {
      if (int.parse(value.trim()) <= 0) {
        return "Age must be above 1yr";
      } else if (int.parse(value.trim()) > 65) {
        return "Age must be below 65yr";
      } else {
        return null;
      }
    }
  }

  static String? validateTerm(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else {
      if (int.parse(value.trim()) < 10) {
        return "Enter yr between 10-40";
      } else if (int.parse(value.trim()) > 40) {
        return "Enter yr between 10-40";
      } else {
        return null;
      }
    }
  }

  static String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  // check if the string is valid JSON
  // ignore: type_annotate_public_apis
  static bool isJSON(string) {
    try {
      json.decode(jsonEncode(string)) as Map;
      return true;
    } catch (e) {
      return false;
    }
  }
}
