protocol Operation {
    associatedtype OutPut

    var request: Request {get}

    func execute(in dispatcher: Dispatcher, completion: @escaping (OutPut) -> Void)
}
