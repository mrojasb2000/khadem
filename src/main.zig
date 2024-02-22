const std = @import("std");
const net = std.net;
const StreamServer = net.StreamServer;
const Address = net.Address;
const print = std.debug.print;
pub fn main() !void {
    var stream_server = StreamServer.init(.{});
    const address = try Address.resolveIp("127.0.0.1", 8080);
    try stream_server.listen(address);
    print("Server is running.\n", .{});
}
