
// Public symbols

public protocol IMathAlgorithm {
    func customAdd(_ n1: Int, n2: Int) -> Int
    func customMinus(_ n1: Int, n2: Int) -> Int
    func customMultiply(_ n1: Int, n2: Int) -> Int
}

public struct MathAlgorithm: IMathAlgorithm {

    public private(set) var customTextttttt = "Hello, World!"

    public init() {
    }

    public func customAdd(_ n1: Int, n2: Int) -> Int {
        n1 + n2
    }

    public func customMinus(_ n1: Int, n2: Int) -> Int {
        n1 - n2
    }

    public func customMultiply(_ n1: Int, n2: Int) -> Int {
        n1 * n2
    }

    public func checkkkk() {
        // Reference internal symbols by uncommenting this
        HeavyAlgorithm().mergeSort(arr: [1, 2, 3])
        HeavyAlgorithm().quickSort(arr: [1, 2, 3])
    }
}
