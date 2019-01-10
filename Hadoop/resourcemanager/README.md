##  Issues:

if you see

    *INFO ipc.Client: Retrying connect to server:*

but you exactly sure that namenode(NN) works properly (nc -z ip port) and listens desired port.
You must know than resource manager (RM) may try connect to NN with ip6 protocol.
You have to disable it

    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1




