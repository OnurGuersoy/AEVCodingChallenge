import Foundation

protocol Dispatcher {
    init(environment: Environment)
    func execute(request: Request, completion: @escaping (Response) -> Void) throws
}
