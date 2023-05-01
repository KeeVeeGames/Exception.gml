// EXAMPLE EXCEPTIONS

/// @description						Test exception
function TestException() : Exception() constructor {
    message += "Throw a test exception";
    longMessage += "Long\nMessage\nis\nhere.";
}

/// @param {real} expected_number		Number of arguments expected for method
/// @param {real} given_number			Number of arguments provided to method
/// @description						Exception that is thrown when the number of arguments provided to a method is not valid
function ArgumentException(expected_number, given_number) : Exception() constructor {
    message += string("Number of arguments expected {0}, got {1}.", expected_number, given_number);
    longMessage = message;
}

/// @param {string} method_name			Name of the method that is not implemented
/// @description						Exception that is thrown when a requested method or operation is not implemented
function NotImplementedException(method_name) : Exception() constructor {
    message += string("Method {0} is not implemented.", method_name);
    longMessage = message;
}