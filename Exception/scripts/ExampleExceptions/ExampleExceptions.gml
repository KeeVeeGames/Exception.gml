// EXAMPLE EXCEPTIONS

function TestException() : Exception() constructor {
	message += "Throw a test exception";
	longMessage += "Long\nMessage\nis\nhere.";
}

/// @param {real} expected_number		Number of arguments expected for method
/// @param {real} given_number			Number of arguments provided to method
/// @description						Exception that is thrown when the number of arguments provided to a method is not valid
function ArgumentException(expected_number, given_number) : Exception() constructor {
	message += "Number of arguments expected " + string(expected_number) + ", got " + string(given_number) + ".";
	longMessage = message;
}

/// @param {string} method_name			Name of the method that is not implemented
/// @description						Exception that is thrown when a requested method or operation is not implemented
function NotImplementedException(method_name) : Exception() constructor {
	message += "Method " + method_name + " is not implemented.";
	longMessage = message;
}