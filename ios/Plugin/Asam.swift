import Foundation
import UIKit

/// Protocol abstracting Guided Access operations for testability.
public protocol GuidedAccessProvider {
    func requestGuidedAccessSession(enabled: Bool) async -> Bool
    var isGuidedAccessEnabled: Bool { get }
}

/// Default implementation using UIAccessibility system APIs.
public struct SystemGuidedAccessProvider: GuidedAccessProvider {
    public init() {}

    @MainActor
    public func requestGuidedAccessSession(enabled: Bool) async -> Bool {
        await withCheckedContinuation { continuation in
            UIAccessibility.requestGuidedAccessSession(enabled: enabled) { success in
                continuation.resume(returning: success)
            }
        }
    }

    @MainActor
    public var isGuidedAccessEnabled: Bool {
        UIAccessibility.isGuidedAccessEnabled
    }
}

@objc public class Asam: NSObject {
    private let provider: GuidedAccessProvider

    public init(provider: GuidedAccessProvider = SystemGuidedAccessProvider()) {
        self.provider = provider
    }

    @objc public func setASAM(_ enable: Bool, completion: @escaping (Bool) -> Void) {
        Task { @MainActor in
            let success = await provider.requestGuidedAccessSession(enabled: enable)
            print("From Native -> ASAM requested to be \(enable ? "enabled" : "disabled").")
            print("From Native -> ASAM is \(success ? "enabled" : "disabled").")
            completion(success)
        }
    }

    @objc public func enableASAM(completion: @escaping (Bool) -> Void) {
        setASAM(true, completion: completion)
    }

    @objc public func disableASAM(completion: @escaping (Bool) -> Void) {
        setASAM(false, completion: completion)
    }

    @objc public func isASAMEnabled(_ callback: @escaping (Bool) -> Void) {
        Task { @MainActor in
            callback(provider.isGuidedAccessEnabled)
        }
    }
}
