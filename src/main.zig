const std = @import("std");
const net = std.net;
const StreamServer = net.StreamServer;
const Address = net.Address;
const print = std.debug.print;
pub fn main() !void {
    var stream_server = StreamServer.init(.{});
    defer stream_server.close();
    const address = try Address.resolveIp("127.0.0.1", 8080);
    try stream_server.listen(address);
    print("Server is running.\n", .{});

    while (true) {
        const connection = try stream_server.accept();
        try handler(connection.stream);
    }
}

fn handler(stream: net.Stream) !void {
    defer stream.close();
    try stream.writer().print("Hello World from Zig Lang", .{});
}
