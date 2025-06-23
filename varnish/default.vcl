vcl 4.0;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.method == "PURGE") {
        if (client.ip != "127.0.0.1" && client.ip != "::1") {
            return (synth(405, "Not allowed."));
        }
        return (purge);
    }
}
