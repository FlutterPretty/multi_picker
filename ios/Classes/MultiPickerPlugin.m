#import "MultiPickerPlugin.h"
#import <multi_picker/multi_picker-Swift.h>

@implementation MultiPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMultiPickerPlugin registerWithRegistrar:registrar];
}
@end
