import socket

# 选择服务器的主机和端口
host = '127.0.0.1'
port = 12345

# 创建一个套接字对象
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 连接到服务器
client_socket.connect((host, port))

# 发送数据到服务器
message = "Hello, Server!"
client_socket.send(message.encode('utf-8'))

# 关闭连接
client_socket.close()
