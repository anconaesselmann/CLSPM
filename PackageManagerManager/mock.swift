//  Created by Axel Ancona Esselmann on 5/8/24.
//

import Foundation

let mockSpmmFile = """
// spmm-tools-version: 0.1

import TargetDescription

let targets = [
    Target(
        name: "Audiosaic Desktop"
        dependencies: [
            .init(
                name: "LoadableView",
                url: "https://github.com/anconaesselmann/LoadableView",
                localDir: "../AxelPods/LoadableView"
                kind: .upToNextMajorVersion,
                minimumVersion: "10.19.1",
                useLocal: false
            )
        ]
    ),
    Target(
        name: "Audiosaic"
        dependencies: [
            Dependency(
                name: "LoadableView",
                url: "https://github.com/anconaesselmann/LoadableView",
                localDir: "../AxelPods/LoadableView"
                kind: .upToNextMajorVersion,
                minimumVersion: "10.19.1",
                useLocal: true
            )
        ]
    )
]
"""

let mockProject = """
// !$*UTF8*$!
{
    archiveVersion = 1;
    classes = {
    };
    objectVersion = 56;
    objects = {

/* Begin PBXBuildFile section */
        97069C0F2BEBDE6B00DDA1FB /* LoadableResult.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97069C0E2BEBDE6B00DDA1FB /* LoadableResult.swift */; };
        97069C122BEBDE6B00DDA1FB /* test22App.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97069C112BEBDE6B00DDA1FB /* test22App.swift */; };
        97069C142BEBDE6B00DDA1FB /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97069C132BEBDE6B00DDA1FB /* ContentView.swift */; };
        97069C162BEBDE6B00DDA1FB /* AppInitializer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97069C152BEBDE6B00DDA1FB /* AppInitializer.swift */; };
        97069C182BEBDE6B00DDA1FB /* AppState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97069C172BEBDE6B00DDA1FB /* AppState.swift */; };
        97069C1A2BEBDE6D00DDA1FB /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 97069C192BEBDE6D00DDA1FB /* Assets.xcassets */; };
        97069C1E2BEBDE6D00DDA1FB /* Preview Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 97069C1D2BEBDE6D00DDA1FB /* Preview Assets.xcassets */; };
        97069C262BEBDEC200DDA1FB /* LoadableView in Frameworks */ = {isa = PBXBuildFile; productRef = 97069C252BEBDEC200DDA1FB /* LoadableView */; };
        97ADAC1B2BEC24EA00F5DB84 /* CoreDataStored in Frameworks */ = {isa = PBXBuildFile; productRef = 97ADAC1A2BEC24EA00F5DB84 /* CoreDataStored */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
        97069C0B2BEBDE6B00DDA1FB /* test22.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = test22.app; sourceTree = BUILT_PRODUCTS_DIR; };
        97069C0E2BEBDE6B00DDA1FB /* LoadableResult.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LoadableResult.swift; sourceTree = "<group>"; };
        97069C112BEBDE6B00DDA1FB /* test22App.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = test22App.swift; sourceTree = "<group>"; };
        97069C132BEBDE6B00DDA1FB /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
        97069C152BEBDE6B00DDA1FB /* AppInitializer.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppInitializer.swift; sourceTree = "<group>"; };
        97069C172BEBDE6B00DDA1FB /* AppState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppState.swift; sourceTree = "<group>"; };
        97069C192BEBDE6D00DDA1FB /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
        97069C1B2BEBDE6D00DDA1FB /* test22.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = test22.entitlements; sourceTree = "<group>"; };
        97069C1D2BEBDE6D00DDA1FB /* Preview Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = "Preview Assets.xcassets"; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
        97069C082BEBDE6B00DDA1FB /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
                97ADAC1B2BEC24EA00F5DB84 /* CoreDataStored in Frameworks */,
                97069C262BEBDEC200DDA1FB /* LoadableView in Frameworks */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
        97069C022BEBDE6B00DDA1FB = {
            isa = PBXGroup;
            children = (
                97069C0D2BEBDE6B00DDA1FB /* test22 */,
                97069C0C2BEBDE6B00DDA1FB /* Products */,
            );
            sourceTree = "<group>";
        };
        97069C0C2BEBDE6B00DDA1FB /* Products */ = {
            isa = PBXGroup;
            children = (
                97069C0B2BEBDE6B00DDA1FB /* test22.app */,
            );
            name = Products;
            sourceTree = "<group>";
        };
        97069C0D2BEBDE6B00DDA1FB /* test22 */ = {
            isa = PBXGroup;
            children = (
                97069C0E2BEBDE6B00DDA1FB /* LoadableResult.swift */,
                97069C132BEBDE6B00DDA1FB /* ContentView.swift */,
                97069C192BEBDE6D00DDA1FB /* Assets.xcassets */,
                97069C1B2BEBDE6D00DDA1FB /* test22.entitlements */,
                97069C102BEBDE6B00DDA1FB /* App */,
                97069C1C2BEBDE6D00DDA1FB /* Preview Content */,
            );
            path = test22;
            sourceTree = "<group>";
        };
        97069C102BEBDE6B00DDA1FB /* App */ = {
            isa = PBXGroup;
            children = (
                97069C112BEBDE6B00DDA1FB /* test22App.swift */,
                97069C152BEBDE6B00DDA1FB /* AppInitializer.swift */,
                97069C172BEBDE6B00DDA1FB /* AppState.swift */,
            );
            path = App;
            sourceTree = "<group>";
        };
        97069C1C2BEBDE6D00DDA1FB /* Preview Content */ = {
            isa = PBXGroup;
            children = (
                97069C1D2BEBDE6D00DDA1FB /* Preview Assets.xcassets */,
            );
            path = "Preview Content";
            sourceTree = "<group>";
        };
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
        97069C0A2BEBDE6B00DDA1FB /* test22 */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 97069C212BEBDE6D00DDA1FB /* Build configuration list for PBXNativeTarget "test22" */;
            buildPhases = (
                97069C072BEBDE6B00DDA1FB /* Sources */,
                97069C082BEBDE6B00DDA1FB /* Frameworks */,
                97069C092BEBDE6B00DDA1FB /* Resources */,
            );
            buildRules = (
            );
            dependencies = (
            );
            name = test22;
            packageProductDependencies = (
                97069C252BEBDEC200DDA1FB /* LoadableView */,
                97ADAC1A2BEC24EA00F5DB84 /* CoreDataStored */,
            );
            productName = test22;
            productReference = 97069C0B2BEBDE6B00DDA1FB /* test22.app */;
            productType = "com.apple.product-type.application";
        };
/* End PBXNativeTarget section */

/* Begin PBXProject section */
        97069C032BEBDE6B00DDA1FB /* Project object */ = {
            isa = PBXProject;
            attributes = {
                BuildIndependentTargetsInParallel = 1;
                LastSwiftUpdateCheck = 1530;
                LastUpgradeCheck = 1530;
                TargetAttributes = {
                    97069C0A2BEBDE6B00DDA1FB = {
                        CreatedOnToolsVersion = 15.3;
                    };
                };
            };
            buildConfigurationList = 97069C062BEBDE6B00DDA1FB /* Build configuration list for PBXProject "test22" */;
            compatibilityVersion = "Xcode 14.0";
            developmentRegion = en;
            hasScannedForEncodings = 0;
            knownRegions = (
                en,
                Base,
            );
            mainGroup = 97069C022BEBDE6B00DDA1FB;
            packageReferences = (
                97069C242BEBDEC200DDA1FB /* XCRemoteSwiftPackageReference "LoadableView" */,
                97ADAC192BEC24EA00F5DB84 /* XCRemoteSwiftPackageReference "CoreDataStored" */,
            );
            productRefGroup = 97069C0C2BEBDE6B00DDA1FB /* Products */;
            projectDirPath = "";
            projectRoot = "";
            targets = (
                97069C0A2BEBDE6B00DDA1FB /* test22 */,
            );
        };
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
        97069C092BEBDE6B00DDA1FB /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                97069C1E2BEBDE6D00DDA1FB /* Preview Assets.xcassets in Resources */,
                97069C1A2BEBDE6D00DDA1FB /* Assets.xcassets in Resources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
        97069C072BEBDE6B00DDA1FB /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                97069C162BEBDE6B00DDA1FB /* AppInitializer.swift in Sources */,
                97069C182BEBDE6B00DDA1FB /* AppState.swift in Sources */,
                97069C0F2BEBDE6B00DDA1FB /* LoadableResult.swift in Sources */,
                97069C122BEBDE6B00DDA1FB /* test22App.swift in Sources */,
                97069C142BEBDE6B00DDA1FB /* ContentView.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
        97069C1F2BEBDE6D00DDA1FB /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CLANG_ENABLE_MODULES = YES;
                CLANG_ENABLE_OBJC_ARC = YES;
                CLANG_ENABLE_OBJC_WEAK = YES;
                CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
                CLANG_WARN_BOOL_CONVERSION = YES;
                CLANG_WARN_COMMA = YES;
                CLANG_WARN_CONSTANT_CONVERSION = YES;
                CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
                CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
                CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
                CLANG_WARN_EMPTY_BODY = YES;
                CLANG_WARN_ENUM_CONVERSION = YES;
                CLANG_WARN_INFINITE_RECURSION = YES;
                CLANG_WARN_INT_CONVERSION = YES;
                CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
                CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
                CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
                CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
                CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
                CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
                CLANG_WARN_STRICT_PROTOTYPES = YES;
                CLANG_WARN_SUSPICIOUS_MOVE = YES;
                CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
                CLANG_WARN_UNREACHABLE_CODE = YES;
                CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
                COPY_PHASE_STRIP = NO;
                DEBUG_INFORMATION_FORMAT = dwarf;
                ENABLE_STRICT_OBJC_MSGSEND = YES;
                ENABLE_TESTABILITY = YES;
                ENABLE_USER_SCRIPT_SANDBOXING = YES;
                GCC_C_LANGUAGE_STANDARD = gnu17;
                GCC_DYNAMIC_NO_PIC = NO;
                GCC_NO_COMMON_BLOCKS = YES;
                GCC_OPTIMIZATION_LEVEL = 0;
                GCC_PREPROCESSOR_DEFINITIONS = (
                    "DEBUG=1",
                    "$(inherited)",
                );
                GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
                GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
                GCC_WARN_UNDECLARED_SELECTOR = YES;
                GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
                GCC_WARN_UNUSED_FUNCTION = YES;
                GCC_WARN_UNUSED_VARIABLE = YES;
                LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
                MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
                MTL_FAST_MATH = YES;
                ONLY_ACTIVE_ARCH = YES;
                SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
                SWIFT_OPTIMIZATION_LEVEL = "-Onone";
            };
            name = Debug;
        };
        97069C202BEBDE6D00DDA1FB /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CLANG_ENABLE_MODULES = YES;
                CLANG_ENABLE_OBJC_ARC = YES;
                CLANG_ENABLE_OBJC_WEAK = YES;
                CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
                CLANG_WARN_BOOL_CONVERSION = YES;
                CLANG_WARN_COMMA = YES;
                CLANG_WARN_CONSTANT_CONVERSION = YES;
                CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
                CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
                CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
                CLANG_WARN_EMPTY_BODY = YES;
                CLANG_WARN_ENUM_CONVERSION = YES;
                CLANG_WARN_INFINITE_RECURSION = YES;
                CLANG_WARN_INT_CONVERSION = YES;
                CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
                CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
                CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
                CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
                CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
                CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
                CLANG_WARN_STRICT_PROTOTYPES = YES;
                CLANG_WARN_SUSPICIOUS_MOVE = YES;
                CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
                CLANG_WARN_UNREACHABLE_CODE = YES;
                CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
                COPY_PHASE_STRIP = NO;
                DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
                ENABLE_NS_ASSERTIONS = NO;
                ENABLE_STRICT_OBJC_MSGSEND = YES;
                ENABLE_USER_SCRIPT_SANDBOXING = YES;
                GCC_C_LANGUAGE_STANDARD = gnu17;
                GCC_NO_COMMON_BLOCKS = YES;
                GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
                GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
                GCC_WARN_UNDECLARED_SELECTOR = YES;
                GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
                GCC_WARN_UNUSED_FUNCTION = YES;
                GCC_WARN_UNUSED_VARIABLE = YES;
                LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
                MTL_ENABLE_DEBUG_INFO = NO;
                MTL_FAST_MATH = YES;
                SWIFT_COMPILATION_MODE = wholemodule;
            };
            name = Release;
        };
        97069C222BEBDE6D00DDA1FB /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_ENTITLEMENTS = test22/test22.entitlements;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_ASSET_PATHS = "\"test22/Preview Content\"";
                DEVELOPMENT_TEAM = D7MN23CD5F;
                ENABLE_HARDENED_RUNTIME = YES;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                "INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]" = YES;
                "INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]" = YES;
                "INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphoneos*]" = YES;
                "INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphonesimulator*]" = YES;
                "INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]" = YES;
                "INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]" = YES;
                "INFOPLIST_KEY_UIStatusBarStyle[sdk=iphoneos*]" = UIStatusBarStyleDefault;
                "INFOPLIST_KEY_UIStatusBarStyle[sdk=iphonesimulator*]" = UIStatusBarStyleDefault;
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                IPHONEOS_DEPLOYMENT_TARGET = 17.4;
                LD_RUNPATH_SEARCH_PATHS = "@executable_path/Frameworks";
                "LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]" = "@executable_path/../Frameworks";
                MACOSX_DEPLOYMENT_TARGET = 14.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.test22;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = auto;
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx";
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Debug;
        };
        97069C232BEBDE6D00DDA1FB /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_ENTITLEMENTS = test22/test22.entitlements;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_ASSET_PATHS = "\"test22/Preview Content\"";
                DEVELOPMENT_TEAM = D7MN23CD5F;
                ENABLE_HARDENED_RUNTIME = YES;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                "INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphoneos*]" = YES;
                "INFOPLIST_KEY_UIApplicationSceneManifest_Generation[sdk=iphonesimulator*]" = YES;
                "INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphoneos*]" = YES;
                "INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents[sdk=iphonesimulator*]" = YES;
                "INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphoneos*]" = YES;
                "INFOPLIST_KEY_UILaunchScreen_Generation[sdk=iphonesimulator*]" = YES;
                "INFOPLIST_KEY_UIStatusBarStyle[sdk=iphoneos*]" = UIStatusBarStyleDefault;
                "INFOPLIST_KEY_UIStatusBarStyle[sdk=iphonesimulator*]" = UIStatusBarStyleDefault;
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                IPHONEOS_DEPLOYMENT_TARGET = 17.4;
                LD_RUNPATH_SEARCH_PATHS = "@executable_path/Frameworks";
                "LD_RUNPATH_SEARCH_PATHS[sdk=macosx*]" = "@executable_path/../Frameworks";
                MACOSX_DEPLOYMENT_TARGET = 14.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.test22;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = auto;
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx";
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Release;
        };
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
        97069C062BEBDE6B00DDA1FB /* Build configuration list for PBXProject "test22" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                97069C1F2BEBDE6D00DDA1FB /* Debug */,
                97069C202BEBDE6D00DDA1FB /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        97069C212BEBDE6D00DDA1FB /* Build configuration list for PBXNativeTarget "test22" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                97069C222BEBDE6D00DDA1FB /* Debug */,
                97069C232BEBDE6D00DDA1FB /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
/* End XCConfigurationList section */

/* Begin XCRemoteSwiftPackageReference section */
        97069C242BEBDEC200DDA1FB /* XCRemoteSwiftPackageReference "LoadableView" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/LoadableView/";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.3.9;
            };
        };
        97ADAC192BEC24EA00F5DB84 /* XCRemoteSwiftPackageReference "CoreDataStored" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/CoreDataStored";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.7;
            };
        };
/* End XCRemoteSwiftPackageReference section */

/* Begin XCSwiftPackageProductDependency section */
        97069C252BEBDEC200DDA1FB /* LoadableView */ = {
            isa = XCSwiftPackageProductDependency;
            package = 97069C242BEBDEC200DDA1FB /* XCRemoteSwiftPackageReference "LoadableView" */;
            productName = LoadableView;
        };
        97ADAC1A2BEC24EA00F5DB84 /* CoreDataStored */ = {
            isa = XCSwiftPackageProductDependency;
            package = 97ADAC192BEC24EA00F5DB84 /* XCRemoteSwiftPackageReference "CoreDataStored" */;
            productName = CoreDataStored;
        };
/* End XCSwiftPackageProductDependency section */
    };
    rootObject = 97069C032BEBDE6B00DDA1FB /* Project object */;
}

"""
