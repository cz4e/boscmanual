
#include <iostream>
#include <boost/asio.hpp>

using namespace boost::asio;
using ip::tcp;

class TCPServer {
public:
    TCPServer(io_service& io_service, short port)
        : acceptor_(io_service, tcp::endpoint(tcp::v4(), port)),
          socket_(io_service) {
        startAccept();
    }

private:
    void startAccept() {
        acceptor_.async_accept(socket_,
            [this](boost::system::error_code ec) {
                if (!ec) {
                    std::cout << "Client connected." << std::endl;
                    handleRequest();
                }
                startAccept();
            });
    }

    void handleRequest() {
        async_read_until(socket_, buffer_, '\n',
            [this](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
                    std::istream is(&buffer_);
                    std::string message;
                    std::getline(is, message);
                    std::cout << "Received: " << message << std::endl;

                    // Handle the message as needed

                    handleRequest(); // Continue listening for the next request
                }
            });
    }

    tcp::acceptor acceptor_;
    tcp::socket socket_;
    streambuf buffer_;
};

int main() {
    try {
        boost::asio::io_service io_service;
        TCPServer server(io_service, 1234);
        io_service.run();
    } catch (std::exception& e) {
        std::cerr << "Exception: " << e.what() << std::endl;
    }

    return 0;
}
