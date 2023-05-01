# GameMaker Exception Base Class

[![Donate](https://img.shields.io/badge/donate-%E2%9D%A4-blue.svg)](https://musnik.itch.io/donate-me) [![License](https://img.shields.io/github/license/KeeVeeGames/Exception.gml)](#!)

This is a base class for custom exceptions replicating the appearance of system runtime errors and adding better support of [try-catch](https://manual-en.yoyogames.com/GameMaker_Language/GML_Overview/Language_Features/try_catch_finally.htm) and [exception_unhandled_handler](https://manual-en.yoyogames.com/GameMaker_Language/GML_Reference/Debugging/exception_unhandled_handler.htm) for these exceptions.

The class is generating all the necessary exception fields and populates data for `script`, `line`, and `stacktrace` ones.

To create a custom exception inherit your constructor from `Exception` and **add** text to a `message` and `longMessage`:
```js
function TestException() : Exception() constructor {
    message += "Throw a test exception";
    longMessage += "Long\nMessage\nis\nhere.";
}
```

You can also not modify both messages, which will make it hold just the exception class name, or make messages the same. Arguments are also supported:
```js
function ArgumentException(expected_number, given_number) : Exception() constructor {
    message += string("Number of arguments expected {0}, got {1}.", expected_number, given_number);
    longMessage = message;
}
```

## Installation

Copy the [Exception script](https://github.com/KeeVeeGames/Exception.gml/blob/master/Exception/scripts/Exception/Exception.gml) into your project.

## Author:
Nikita Musatov - [MusNik / KeeVee Games](https://twitter.com/keeveegames)

**License**: [MIT](https://en.wikipedia.org/wiki/MIT_License)
