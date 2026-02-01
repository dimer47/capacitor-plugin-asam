import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AsamPlugin)
public class AsamPlugin: CAPPlugin {
    private let implementation = Asam()

    @objc func setASAM(_ call: CAPPluginCall) {
        let enable = call.getBool("enable") ?? false

        implementation.setASAM(enable, completion: { success in
            call.resolve([
                "success": success
            ])
        })
    }

    @objc func enableASAM(_ call: CAPPluginCall) {
        implementation.setASAM(true, completion: { success in
            call.resolve([
                "success": success
            ])
        })
    }

    @objc func disableASAM(_ call: CAPPluginCall) {
        implementation.setASAM(false, completion: { success in
            call.resolve([
                "success": success
            ])
        })
    }

    @objc func isASAMEnabled(_ call: CAPPluginCall) {
        implementation.isASAMEnabled { enabled in
            call.resolve([
                "enabled": enabled
            ])
        }
    }

    @objc func isSupervised(_ call: CAPPluginCall) {
        implementation.isSupervised { supervised in
            call.resolve([
                "supervised": supervised
            ])
        }
    }
}
