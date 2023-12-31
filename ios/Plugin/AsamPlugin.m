#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(AsamPlugin, "Asam",
    CAP_PLUGIN_METHOD(setASAM, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(enableASAM, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(disableASAM, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(isASAMEnabled, CAPPluginReturnPromise);
)
