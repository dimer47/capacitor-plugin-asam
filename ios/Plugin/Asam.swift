import Foundation

@objc public class Asam: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
