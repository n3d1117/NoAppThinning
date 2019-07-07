#import <objc/runtime.h>

%ctor {
    Method originalMethod = class_getInstanceMethod(objc_getClass("SSDevice"), @selector(thinnedApplicationVariantIdentifier));
    if (originalMethod != NULL) {
        IMP newImp = imp_implementationWithBlock(^ {
            return @"i386";
        });
        method_setImplementation(originalMethod, newImp);
    }
}
