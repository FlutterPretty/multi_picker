#import "MultiPickerPlugin.h"
#if __has_include(<multi_picker/multi_picker-Swift.h>)
#import <multi_picker/multi_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "multi_picker-Swift.h"
#endif

@implementation MultiPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMultiPickerPlugin registerWithRegistrar:registrar];
}
@end
