globalvar __YYGMLException_static;

// catch a system runtime exception to get its static struct
try {
    show_error("test", false);
} catch(exception) {
    __YYGMLException_static = static_get(exception);
}

/// @ignore
/// @description                        Base class for exceptions
function Exception() constructor {
    static_set(self, __YYGMLException_static);      // inherit from system YYGMLException	
    
    message = "";
    longMessage = "";
    script = "";
    line = -1;
    stacktrace = [];                                /// @is {string[]}
    
    // TODO: Check callstack format on different target platfroms
    // TODO: Replace string functions with buffer mutations?
    var stack = debug_get_callstack();
    
    for (var i = 2, length = array_length(stack) - 1; i < length; i++) {
        var stackline = stack[i];
        var colonPos = string_pos(":", stackline);
        
        if (i == 2) {
            script = string_copy(stackline, 1, colonPos - 1);
            line = real(string_copy(stackline, colonPos + 1, string_length(stackline) - colonPos));
        }
        
        stackline = string_replace(stackline, ":", " (line ");
        stackline += ")";
        
        array_push(stacktrace, stackline);
    }
    
    static toString = function() {
    	return longMessage;
    }
    
    static init = function() {
        var exceptionName/*:string*/ = /*#cast*/ instanceof(self);
        message = string("{0} {1}", exceptionName, message);
        longMessage = string("{0}\r\n{1}", exceptionName, longMessage);
        
        // add more info for YYC as it is not adding standard error output like on VM
        if (code_is_compiled()) {
            longMessage = string("Unable to find a handler for exception {0}\r\n", longMessage);
            
            for (var i = 0, length = array_length(stacktrace); i < length; i++) {
                longMessage += "\r\n" + stacktrace[i];
            }
        }
        
        // fixes for weird constructor inheritance GM bug and YYC shenanigans
        static_set(self, static_get(Exception));
    }
}