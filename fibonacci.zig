const std = @import("std");

pub fn main() !void {
    var generalPurposeAllocator = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = generalPurposeAllocator.allocator();
    defer _ = generalPurposeAllocator.deinit();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 4) {
        std.log.err("Usage: {s} <first_number> <second_number> <iterations>", .{args[0]});
    }

    var first_value = try std.fmt.parseFloat(f64, args[1]);
    var second_value = try std.fmt.parseFloat(f64, args[2]);
    var iterations = try std.fmt.parseInt(i64, args[3], 10);
    var sum: f64 = 0;
    var condition: bool = true;

    std.debug.print("{d:.5}\n", .{first_value});
    std.debug.print("{d:.5}\n", .{second_value});

    while (condition) {
        sum = first_value + second_value;
        std.debug.print("{d:.5}\n", .{sum});
        iterations = iterations - 1;
        first_value = second_value;
        second_value = sum;
        if (iterations == 0) {
            condition = false;
        }
    }
    const ratio = second_value / first_value;
    std.debug.print("The ratio is {d:.15}", .{ratio});
}
