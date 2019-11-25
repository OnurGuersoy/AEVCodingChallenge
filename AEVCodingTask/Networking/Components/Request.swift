import Foundation

enum DataType {
    case Data
}

protocol Request {
    var path: String {get}
    var method: HTTPMethod {get}
    var parameters: RequestParams {get}
    var headers: [String: String]? {get}
    var dataType: DataType {get}
}


enum HTTPMethod: String {
    case POST, PUT, GET, DELETE, PATCH
}

enum RequestParams {
    case body(_ : [String: String]?)
    case url(_ : [String: String]?)
}

