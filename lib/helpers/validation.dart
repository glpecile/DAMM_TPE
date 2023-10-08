// email validation
bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

// email validator
String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Por favor ingrese su email.';
  } else if (!isEmailValid(email)) {
    return 'Por favor ingrese un email válido.';
  }
  return null;
}

// password validation
bool isPasswordValid(String password) {
  return RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$").hasMatch(password);
}

// password validator
String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Por favor ingrese su contraseña.';
  } else if (!isPasswordValid(password)) {
    return 'Por favor ingrese una contraseña válida con mayúsculas, minúsculas y números.';
  }
  return null;
}

// phone validation
bool isPhoneValid(String phone) {
  return RegExp(r"^[0-9]{10}$").hasMatch(phone);
}

// phone validator
String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Por favor ingrese su teléfono';
  } else if (!isPhoneValid(phone)) {
    return 'Por favor ingrese un teléfono válido';
  }
  return null;
}

// name validation
bool isNameValid(String name) {
  return RegExp(r"^[a-zA-Z ]+$").hasMatch(name);
}

// name validator
String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Por favor ingrese su nombre';
  } else if (!isNameValid(name)) {
    return 'Por favor ingrese un nombre válido';
  }
  return null;
}

// date validation
bool isDateValid(String date) {
  return RegExp(r"^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$").hasMatch(date);
}

// date validator
String? dateValidator(String? value) {
  String? error;
  error = value == null || value.isEmpty
      ? 'Por favor ingrese su fecha de nacimiento'
      : null;
  error = !isDateValid(value!) ? 'Por favor ingrese una fecha válida' : null;
  return error;
}
