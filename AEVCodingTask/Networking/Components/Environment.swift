import Foundation

struct Environment {
    var name: String
    var baseURL: String {
        return "https://aev-home-task.apps.emea.vwapps.io"
    }
    var headers: [String: String] = ["Content-Type": "application/json", "Accept": "application/json"]
    var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData

    init(name: String) {
        self.name = name
    }
}
