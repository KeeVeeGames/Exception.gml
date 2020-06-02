/// @class								Exception
/// @abstarct
/// @description						Base class for exceptions
function Exception() constructor {
	_message = "";
	callstack = "";
	
	static toString = function() {
		return _message;
	}
}

// EXAMPLE EXCEPTIONS

/// @class								ArgumentException(expected_number, given_number)
/// @extends							Exception
/// @param {real} expected_number		Number of arguments expected for method
/// @param {real} given_number			Number of arguments provided to method
/// @description						Exception that is thrown when the number of arguments provided to a method is not valid
function ArgumentException(expected_number, given_number) : Exception() constructor {
	_message +=	"ArgumentException:\r\n" + 
				"Number of arguments expected " + string(expected_number) + ", got " + string(given_number) + ".";
}

/// @class								NotImplementedException(method_name)
/// @extends							Exception
/// @param {string} method_name			Name of the method that is not implemented
/// @description						Exception that is thrown when a requested method or operation is not implemented
function NotImplementedException(method_name) : Exception() constructor {
	_message +=	"NotImplementedException:\r\n" +
				"Method " + method_name + " is not implemented.";
}