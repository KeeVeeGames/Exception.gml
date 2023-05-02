# GameMaker Exception Base Class

[![Donate](https://img.shields.io/badge/donate-%E2%9D%A4-blue.svg)](https://musnik.itch.io/donate-me) [![License](https://img.shields.io/github/license/KeeVeeGames/Exception.gml)](#!)

This is a base class for custom exceptions replicating a structure of system exceptions and adding better support of [try-catch](https://manual-en.yoyogames.com/GameMaker_Language/GML_Overview/Language_Features/try_catch_finally.htm) and [exception_unhandled_handler](https://manual-en.yoyogames.com/GameMaker_Language/GML_Reference/Debugging/exception_unhandled_handler.htm) for these custom exceptions.

The class is generating all the necessary exception fields and populates data for `script`, `line` and `stacktrace` ones. Makes output on error windows nicer and more meaningful on handled exceptions. Also adds better support for YYC.

To create a custom exception inherit your constructor from `Exception`, write your `message` and `longMessage` and add `init()` call:
```js
function TestException() : Exception() constructor {
    message = "Throw a test exception.";
    longMessage = "Long\nMessage\nis\nhere";
    
    init();
}
```

You can also not set both messages, which will make it hold just the exception class name, or make messages the same. Arguments are also supported:
```js
function ArgumentException(expected_number, given_number) : Exception() constructor {
    message = string("Number of arguments expected {0}, got {1}", expected_number, given_number);
    longMessage = message;
    
    init();
}
```

## Installation:

Copy the [Exception script](https://github.com/KeeVeeGames/Exception.gml/blob/master/Exception/scripts/Exception/Exception.gml) into your project.   
Or get the latest asset package from the [releases page](../../releases) and import it into IDE.

## Comparison

In GameMaker there are differences in error message appearance and exception data between different handling methods (try-catch or exception_unhandled_handler) and compile targets (VM or YYC).

This implementation tries to produce generally better and more consistent results in comparison to its alternatives.

### Simple `throw ("ArgumentException")`

<table style="max-width: max-content;">
<thead>
<tr>
<th></th>
<th width=360px>VM</th>
<th width=360px>YYC</th>
</tr>
</thead>
<tbody>
<tr>
<th>Unhandled</th>
<td>
<p align="center">
<a href="https://keevee.games/wp-content/uploads/2023/05/Runner_qXFyONNYA9.png"><img src="https://keevee.games/wp-content/uploads/2023/05/Runner_qXFyONNYA9-300x265.png" alt="Error screenshot"></a>
</p>
</td>
<td>
<p align="center">
<a href="https://keevee.games/wp-content/uploads/2023/05/Exception_HlRQBDDjyn.png"><img src="https://keevee.games/wp-content/uploads/2023/05/Exception_HlRQBDDjyn-300x265.png" alt="Error screenshot"></a>
</p>
</td>
</tr>
<tr></tr><tr>
<th>try-catch</th>
<td>"ArgumentException"</td>
<td>"ArgumentException"</td>
</tr>
<tr></tr><tr>
<th>

exception   
unhandled   
handler

</th>
<td>

`message`: "Unable to find a handler for exception ArgumentException"   
`longMessage`:   
>"ERROR in   
action number 1   
of  Step Event0   
for object obj_exception_test:   
>
>
>
>Unable to find a handler for exception ArgumentException
>
>
> at gml_Script_ExceptionTest (line 66) -     throw "ArgumentException""   

`script`: "gml_Script_ExceptionTest"   
`line`: 66   
`stacktrace`: [   
>"gml_Script_ExceptionTest (line 66)"

>"gml_Object_obj_exception_Step_0 (line 8) -     ExceptionTest();"

]
</td>
<td valign="top">"ArgumentException"</td>
</tr>
</tbody>
</table>

### Custom `throw new ArgumentException()`

<table>
<thead>
<tr>
<th></th>
<th width=360px>VM</th>
<th width=360px>YYC</th>
</tr>
</thead>
<tbody>
<tr>
<th>Unhandled</th>
<td>
<p align="center">
<a href="https://keevee.games/wp-content/uploads/2023/05/Runner_HBtSdTN8U5.png"><img src="https://keevee.games/wp-content/uploads/2023/05/Runner_HBtSdTN8U5-300x265.png" alt="Error screenshot"></a>
</p>
</td>
<td>
<p align="center">
<a href="https://keevee.games/wp-content/uploads/2023/05/Exception_5Y51n4jzzy.png"><img src="https://keevee.games/wp-content/uploads/2023/05/Exception_5Y51n4jzzy-300x265.png" alt="Error screenshot"></a>
</p>
</td>
</tr>
<tr></tr><tr>
<th>try-catch</th>
<td valign="top">

`message`: "ArgumentException"   
`longMessage`:   
>"ArgumentException   
Number of arguments expected 3, got 2"   

`script`: "gml_Script_ExceptionTest"   
`line`: 65   
`stacktrace`: [   
>"gml_Script_ExceptionTest (line 65)"

>"gml_Object_obj_exception_Step_0 (line 8)

]
</td>
<td valign="top">

`message`: "ArgumentException"   
`longMessage`:   
>"Unable to find a handler for exception ArgumentException   
Number of arguments expected 3, got 2"   
>   
>gml_Script_ExceptionTest (line 66)   
>gml_Object_obj_exception_Step_0 (line 9)

`script`: "gml_Script_ExceptionTest"   
`line`: 65   
`stacktrace`: [   
>"gml_Script_ExceptionTest (line 65)"

>"gml_Object_obj_exception_test_Step_0 (line 8)

]
</td>
</tr>
<tr></tr><tr>
<th>

exception   
unhandled   
handler

</th>
<td valign="top">

`message`: "Unable to find a handler for exception ArgumentException   
Number of arguments expected 3, got 2"
`longMessage`:   
>"ERROR in   
action number 1   
of  Step Event0   
for object obj_exception_test:   
>
>
>
>Unable to find a handler for exception ArgumentException
>Number of arguments expected 3, got 2
>
>
> at gml_Script_ExceptionTest (line 65) -         throw new ArgumentException(3, 2);"   

`script`: "gml_Script_ExceptionTest"   
`line`: 65   
`stacktrace`: [   
>"gml_Script_ExceptionTest (line 65)"

>"gml_Object_obj_exception_test_Step_0 (line 8) -     ExceptionTest();"

]
</td>
<td valign="top">

`message`: "ArgumentException: Number of arguments expected 3, got 2"   
`longMessage`:   
>"Unable to find a handler for exception ArgumentException   
Number of arguments expected 3, got 2
>
>gml_Script_ExceptionTest (line 66)   
>gml_Object_obj_exception_test_Step_0 (line 9)

`script`: "gml_Script_ExceptionTest"   
`line`: 66   
`stacktrace`: [   
>"gml_Script_ExceptionTest (line 66)"

>"gml_Object_obj_exception_test_Step_0 (line 9)"

]
</td>
</tr>
</tbody>
</table>

## Author:
Nikita Musatov - [MusNik / KeeVee Games](https://twitter.com/keeveegames)

**License**: [MIT](https://en.wikipedia.org/wiki/MIT_License)
