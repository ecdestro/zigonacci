# zigonacci
A Fibonacci sequence calculator in Zig

This was an attempt to understand how to handle command-line arguments in zig through the use of a General Purpose Allocator, and utilizing std.process.args() to fetch them.

To build:
```
zig build-exe fibonacci.zig
```
The resulting executable takes three arguments: the first term, the second term, and the number of iterations to calculate. It will display to the user the Fibonacci sequence based on those conditions, and provides the ratio of the last two terms of the printed sequence.

It will currently will take a float up to five decimal places for the first and second terms, and an integer for the number of iterations. Precision can be altered by modifying the print statements for each item - first_value, second_value, and sum:
```
std.debug.print("{d:.12}", .{sum});
```
will print the sum to twelve decimal places.
