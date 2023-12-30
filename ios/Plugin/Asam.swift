import Foundation
import UIKit

@objc public class Asam: NSObject {
    @objc public func setASAM(_ enable: Bool, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.async {
            UIAccessibility.requestGuidedAccessSession(enabled: enable, completionHandler : { success in
                print("From Native -> ASAM requested to be \(enable ? "enabled" : "disabled").")
                print("From Native -> ASAM is \(success ? "enabled" : "disabled").")
                completion(success)
            })
        }
    }

    @objc public func enableASAM(completion: @escaping (Bool) -> Void) {
        setASAM(true, completion: completion)
    }

    @objc public func disableASAM(completion: @escaping (Bool) -> Void) {
        setASAM(false, completion: completion)
    }

    @objc public func isASAMEnabled(_ callback: @escaping (Bool) -> Void) {
        DispatchQueue.main.async {
            let isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
            callback(isGuidedAccessEnabled)
        }
    }
}
