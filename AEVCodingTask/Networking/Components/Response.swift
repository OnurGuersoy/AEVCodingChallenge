import Foundation

enum Response {
    case data(_: Data)
    case error(_: Int?, _: Error?)

    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard let realResponse = response.r, 200...299 ~= realResponse.statusCode, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }

        guard let data = response.data else {
            self = .error(response.r?.statusCode, NetworkErrors.noData)
            return
        }

        switch request.dataType {
        case .Data:
            self = .data(data)
        }
    }
}
