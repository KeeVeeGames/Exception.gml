if (keyboard_check_pressed(vk_f1)) {
	throw new TestException();
}

if (keyboard_check_pressed(vk_f2)) {
	throw new ArgumentException(3, 2);
}

if (keyboard_check_pressed(vk_f3)) {
	throw new NotImplementedException("do_something");
}

//exception_unhandled_handler(function(ex) {
//	show_debug_message(ex.longMessage);
//});