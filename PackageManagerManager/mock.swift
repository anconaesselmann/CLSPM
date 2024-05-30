//  Created by Axel Ancona Esselmann on 5/8/24.
//

import Foundation


// TODO: Clone remote to local


// spmm-tools-version: 0.1

//import TargetDescription

let gitHubUrlString = "https://github.com/anconaesselmann/"
let localBaseDir = "../AxelPods/"



let targets = [
//    Target(
//        name: "Audiosaic Desktop",
//        dependencies: [
//            .init(
//                name: "LoadableView",
//                version: .upToNextMajorVersion("0.3.9"),
//                urlBase: gitHubUrlString,
//                localBase: localBaseDir
//            )
//            .useLocal()
//            // .cloneToLocal()
//        ]
//    ),
//    Target(
//        name: "Audiosaic",
//        dependencies: [
//            Dependency(
//                name: "LoadableView",
//                version: .upToNextMajorVersion("0.3.9"),
//                url: "https://github.com/anconaesselmann/LoadableView",
//                localDir: "../AxelPods/LoadableView"
//            )
//        ]
//    ),
    Target(
        name: "test22",
        dependencies: [
            .init(
                name: "LoadableView",
                version: .upToNextMajorVersion("0.3.9"),
                urlBase: gitHubUrlString,
                localBase: localBaseDir
            ),
            .init(
                name: "CoreDataStored",
                version: .upToNextMajorVersion("0.0.7"),
                urlBase: gitHubUrlString,
                localBase: localBaseDir
            ),
            .init(
                name: "ProgrammaticCoreData",
                version: .upToNextMajorVersion("0.0.4"),
                urlBase: gitHubUrlString,
                localBase: localBaseDir
            ),
        ]
    )
]


let mockSpmmFile = """
// spmm-tools-version: 0.1

import TargetDescription

let gitHubUrlString = "https://github.com/anconaesselmann/"
let localBaseDir = "../AxelPods/"

let targets = [
    Target(
        name: "Audiosaic Desktop",
        dependencies: [
            .init(
                name: "LoadableView",
                version: "0.3.9",
                urlBase: gitHubUrlString,
                localBaseDir: localBaseDir
            )
            .useLocal()
            // .clone()
        ]
    ),
    Target(
        name: "Audiosaic"
        dependencies: [
            Dependency(
                name: "LoadableView",
                version: "0.3.9",
                kind: .upToNextMajorVersion,
                url: "https://github.com/anconaesselmann/LoadableView",
                localDir: "../AxelPods/LoadableView"
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
                DEVELOPMENT_ASSET_PATHS = "\\"test22/Preview Content\\"";
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
                DEVELOPMENT_ASSET_PATHS = "\\"test22/Preview Content\\"";
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
    };
    rootObject = 97069C032BEBDE6B00DDA1FB /* Project object */;
}

"""

let multiTargetMockProject = """
// !$*UTF8*$!
{
    archiveVersion = 1;
    classes = {
    };
    objectVersion = 60;
    objects = {

/* Begin PBXBuildFile section */
        9706889627ECF1790018BFF6 /* DragLocation.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9706889527ECF1790018BFF6 /* DragLocation.swift */; };
        9706889827ECF1A50018BFF6 /* Slider+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9706889727ECF1A50018BFF6 /* Slider+Extensions.swift */; };
        971130162B7363420024BD81 /* NestedTable in Frameworks */ = {isa = PBXBuildFile; productRef = 971130152B7363420024BD81 /* NestedTable */; };
        971130172B7363670024BD81 /* MainViewMultiSelectionContextMenu.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91B32B6EF098003D20E8 /* MainViewMultiSelectionContextMenu.swift */; };
        971130192B7366F70024BD81 /* AllAssetsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971130182B7366F70024BD81 /* AllAssetsView.swift */; };
        9711301B2B7368BA0024BD81 /* DefaultContextMenuItems.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9711301A2B7368BA0024BD81 /* DefaultContextMenuItems.swift */; };
        9711301D2B7368D70024BD81 /* MainMenuContextMenuItems.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9711301C2B7368D70024BD81 /* MainMenuContextMenuItems.swift */; };
        9711301F2B7368F40024BD81 /* MainViewSingleSelectionContextMenuItemView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9711301E2B7368F40024BD81 /* MainViewSingleSelectionContextMenuItemView.swift */; };
        971130212B73690E0024BD81 /* MainViewMultiSelectionContextMenuItemView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971130202B73690E0024BD81 /* MainViewMultiSelectionContextMenuItemView.swift */; };
        9718C8112B55EE07009CDA71 /* IOSToolbarManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9718C8102B55EE07009CDA71 /* IOSToolbarManager.swift */; };
        9718C8122B55EE07009CDA71 /* IOSToolbarManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9718C8102B55EE07009CDA71 /* IOSToolbarManager.swift */; };
        971C646E2B4C8F3800C97731 /* LoadableView in Frameworks */ = {isa = PBXBuildFile; productRef = 971C646D2B4C8F3800C97731 /* LoadableView */; };
        971C64702B4C8F4500C97731 /* LoadableView in Frameworks */ = {isa = PBXBuildFile; productRef = 971C646F2B4C8F4500C97731 /* LoadableView */; };
        971C647A2B4C950900C97731 /* AppInitializer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64792B4C950900C97731 /* AppInitializer.swift */; };
        971C647C2B4C951D00C97731 /* AppState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C647B2B4C951D00C97731 /* AppState.swift */; };
        971C64822B4C97B100C97731 /* KeyPressEventManager in Frameworks */ = {isa = PBXBuildFile; productRef = 971C64812B4C97B100C97731 /* KeyPressEventManager */; };
        971C64842B4C97C400C97731 /* KeyPressEventManager in Frameworks */ = {isa = PBXBuildFile; productRef = 971C64832B4C97C400C97731 /* KeyPressEventManager */; };
        971C64862B4C98BB00C97731 /* AppInitializer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64792B4C950900C97731 /* AppInitializer.swift */; };
        971C64872B4C98BF00C97731 /* AppState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C647B2B4C951D00C97731 /* AppState.swift */; };
        971C64892B4DC27200C97731 /* Data+Image.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64882B4DC27200C97731 /* Data+Image.swift */; };
        971C648A2B4DC29600C97731 /* Data+Image.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64882B4DC27200C97731 /* Data+Image.swift */; };
        971C648C2B4DC82400C97731 /* IcloudSync.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C648B2B4DC82400C97731 /* IcloudSync.swift */; };
        971C64912B4DD08200C97731 /* IcloudSync.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C648B2B4DC82400C97731 /* IcloudSync.swift */; };
        971C64922B4DD09700C97731 /* FileReader.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238527E1380A00D773B5 /* FileReader.swift */; };
        971C649B2B4DDE7C00C97731 /* LoadingManager in Frameworks */ = {isa = PBXBuildFile; productRef = 971C649A2B4DDE7C00C97731 /* LoadingManager */; };
        971C649D2B4DDE8500C97731 /* LoadingManager in Frameworks */ = {isa = PBXBuildFile; productRef = 971C649C2B4DDE8500C97731 /* LoadingManager */; };
        971C64A02B4DDEEC00C97731 /* LoadingView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C649F2B4DDEEC00C97731 /* LoadingView.swift */; };
        971C64A12B4DDEF500C97731 /* LoadingView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C649F2B4DDEEC00C97731 /* LoadingView.swift */; };
        971C64A22B4DE0BF00C97731 /* Transitions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64942B4DDC2600C97731 /* Transitions.swift */; };
        971C64AF2B4DE3B700C97731 /* Alert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A52B4DE3B700C97731 /* Alert.swift */; };
        971C64B02B4DE3B700C97731 /* ErrorViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A62B4DE3B700C97731 /* ErrorViewModel.swift */; };
        971C64B12B4DE3B700C97731 /* ErrorView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A72B4DE3B700C97731 /* ErrorView.swift */; };
        971C64B22B4DE3B700C97731 /* ImportViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A92B4DE3B700C97731 /* ImportViewModel.swift */; };
        971C64B32B4DE3B700C97731 /* ImportView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AA2B4DE3B700C97731 /* ImportView.swift */; };
        971C64B42B4DE3B700C97731 /* IOToolbarElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AC2B4DE3B700C97731 /* IOToolbarElement.swift */; };
        971C64B52B4DE3B700C97731 /* ToolbarManager+IOViews.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AD2B4DE3B700C97731 /* ToolbarManager+IOViews.swift */; };
        971C64B62B4DE3B700C97731 /* ErrorManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AE2B4DE3B700C97731 /* ErrorManager.swift */; };
        971C64B72B4DE3E600C97731 /* Alert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A52B4DE3B700C97731 /* Alert.swift */; };
        971C64B82B4DE3E900C97731 /* ErrorViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A62B4DE3B700C97731 /* ErrorViewModel.swift */; };
        971C64B92B4DE3EC00C97731 /* ErrorView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A72B4DE3B700C97731 /* ErrorView.swift */; };
        971C64BA2B4DE3F000C97731 /* ImportViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64A92B4DE3B700C97731 /* ImportViewModel.swift */; };
        971C64BB2B4DE3F300C97731 /* ImportView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AA2B4DE3B700C97731 /* ImportView.swift */; };
        971C64BC2B4DE3F600C97731 /* IOToolbarElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AC2B4DE3B700C97731 /* IOToolbarElement.swift */; };
        971C64BD2B4DE3F900C97731 /* ToolbarManager+IOViews.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AD2B4DE3B700C97731 /* ToolbarManager+IOViews.swift */; };
        971C64BE2B4DE3FC00C97731 /* ErrorManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64AE2B4DE3B700C97731 /* ErrorManager.swift */; };
        971C64C12B4DE41000C97731 /* ToolbarManager in Frameworks */ = {isa = PBXBuildFile; productRef = 971C64C02B4DE41000C97731 /* ToolbarManager */; };
        971C64C32B4DE41800C97731 /* ToolbarManager in Frameworks */ = {isa = PBXBuildFile; productRef = 971C64C22B4DE41800C97731 /* ToolbarManager */; };
        971C64C92B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64C52B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift */; };
        971C64CA2B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64C52B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift */; };
        971C64CB2B4DE64A00C97731 /* MainToolbarElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64C62B4DE64A00C97731 /* MainToolbarElement.swift */; };
        971C64CC2B4DE64A00C97731 /* MainToolbarElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64C62B4DE64A00C97731 /* MainToolbarElement.swift */; };
        971C64CD2B4DE64A00C97731 /* TButton+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64C72B4DE64A00C97731 /* TButton+Extensions.swift */; };
        971C64CE2B4DE64A00C97731 /* TButton+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64C72B4DE64A00C97731 /* TButton+Extensions.swift */; };
        971C64D22B4DE71800C97731 /* Colors.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64D12B4DE71800C97731 /* Colors.swift */; };
        971C64D32B4DE71800C97731 /* Colors.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64D12B4DE71800C97731 /* Colors.swift */; };
        971EDFC82B7579000059888A /* Catalog.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFC72B7579000059888A /* Catalog.swift */; };
        971EDFC92B7579000059888A /* Catalog.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFC72B7579000059888A /* Catalog.swift */; };
        971EDFCB2B757AF70059888A /* CatalogEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFCA2B757AF70059888A /* CatalogEntity.swift */; };
        971EDFCC2B757AF70059888A /* CatalogEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFCA2B757AF70059888A /* CatalogEntity.swift */; };
        971EDFCE2B757C230059888A /* Catalog+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFCD2B757C230059888A /* Catalog+CoreDataStored.swift */; };
        971EDFCF2B757C230059888A /* Catalog+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFCD2B757C230059888A /* Catalog+CoreDataStored.swift */; };
        971EDFD12B7581040059888A /* CatalogSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFD02B7581040059888A /* CatalogSettingsView.swift */; };
        971EDFD22B7581040059888A /* CatalogSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFD02B7581040059888A /* CatalogSettingsView.swift */; };
        971EDFD42B75943A0059888A /* CatalogManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFD32B75943A0059888A /* CatalogManager.swift */; };
        971EDFD52B75943A0059888A /* CatalogManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFD32B75943A0059888A /* CatalogManager.swift */; };
        971EDFD72B7A8E3D0059888A /* LockscreenSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFD62B7A8E3D0059888A /* LockscreenSettingsView.swift */; };
        971EDFDA2B7A919F0059888A /* MediaPlayerRemoteCommandCenter_Capability+RawRepresentable.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971EDFD92B7A919F0059888A /* MediaPlayerRemoteCommandCenter_Capability+RawRepresentable.swift */; };
        9725902E294A71F9004310CD /* PlayerEvent.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9725902D294A71F9004310CD /* PlayerEvent.swift */; };
        9725902F294A71F9004310CD /* PlayerEvent.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9725902D294A71F9004310CD /* PlayerEvent.swift */; };
        97259031294A92F2004310CD /* PlayerStateMachine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259030294A92F2004310CD /* PlayerStateMachine.swift */; };
        97259032294A92F2004310CD /* PlayerStateMachine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259030294A92F2004310CD /* PlayerStateMachine.swift */; };
        97259052294BD5A2004310CD /* ResumableTimer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259051294BD5A2004310CD /* ResumableTimer.swift */; };
        97259053294BD5A2004310CD /* ResumableTimer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259051294BD5A2004310CD /* ResumableTimer.swift */; };
        9725905E294E9CB7004310CD /* ProvisionallyPlayingSM.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9725905C294E9C6F004310CD /* ProvisionallyPlayingSM.swift */; };
        9725905F294E9CB9004310CD /* ProvisionallyPlayingSM.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9725905C294E9C6F004310CD /* ProvisionallyPlayingSM.swift */; };
        9725906C294FE014004310CD /* Logging.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9725906A294FDFFF004310CD /* Logging.swift */; };
        9725906D294FE015004310CD /* Logging.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9725906A294FDFFF004310CD /* Logging.swift */; };
        972B405C2B896D1E00F0118C /* BookmarksView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B405B2B896D1E00F0118C /* BookmarksView.swift */; };
        972B405D2B896D1E00F0118C /* BookmarksView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B405B2B896D1E00F0118C /* BookmarksView.swift */; };
        972B40602B896EC000F0118C /* BookmarksWindowView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B405E2B896EC000F0118C /* BookmarksWindowView.swift */; };
        972B40622B896F3D00F0118C /* BookmarksSheet.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40612B896F3D00F0118C /* BookmarksSheet.swift */; };
        972B40642B899FB500F0118C /* BookmarkView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40632B899FB500F0118C /* BookmarkView.swift */; };
        972B40652B89A02600F0118C /* BookmarkView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40632B899FB500F0118C /* BookmarkView.swift */; };
        972B40682B89A09E00F0118C /* BookmarksViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40672B89A09E00F0118C /* BookmarksViewModel.swift */; };
        972B406B2B89A0CF00F0118C /* BookmarkViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B406A2B89A0CF00F0118C /* BookmarkViewData.swift */; };
        972B406D2B89A0DF00F0118C /* GroupedBookmarkViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B406C2B89A0DF00F0118C /* GroupedBookmarkViewData.swift */; };
        972B406E2B89A0FD00F0118C /* BookmarksViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40672B89A09E00F0118C /* BookmarksViewModel.swift */; };
        972B406F2B89A10500F0118C /* BookmarkViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B406A2B89A0CF00F0118C /* BookmarkViewData.swift */; };
        972B40702B89A10800F0118C /* GroupedBookmarkViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B406C2B89A0DF00F0118C /* GroupedBookmarkViewData.swift */; };
        972B40722B89A34900F0118C /* ListRowDateHeaderComponentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40712B89A34900F0118C /* ListRowDateHeaderComponentView.swift */; };
        972B40732B89A36000F0118C /* ListRowDateHeaderComponentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40712B89A34900F0118C /* ListRowDateHeaderComponentView.swift */; };
        972B40752B89CF3E00F0118C /* HapticsSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40742B89CF3E00F0118C /* HapticsSettingsView.swift */; };
        972B40772B8AAA1700F0118C /* HapticItem.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40762B8AAA1700F0118C /* HapticItem.swift */; };
        972B40792B8AAA5400F0118C /* HapticItem.swift in Sources */ = {isa = PBXBuildFile; fileRef = 972B40762B8AAA1700F0118C /* HapticItem.swift */; };
        972B40982B8B359500F0118C /* ProgrammaticCoreData in Frameworks */ = {isa = PBXBuildFile; productRef = 972B40972B8B359500F0118C /* ProgrammaticCoreData */; };
        972B409A2B8B35BB00F0118C /* ProgrammaticCoreData in Frameworks */ = {isa = PBXBuildFile; productRef = 972B40992B8B35BA00F0118C /* ProgrammaticCoreData */; };
        97328C622B7ECE7B001AA422 /* Alerts.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C612B7ECE7B001AA422 /* Alerts.swift */; };
        97328C632B7ECE7B001AA422 /* Alerts.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C612B7ECE7B001AA422 /* Alerts.swift */; };
        97328C6D2B8400AB001AA422 /* PlaybackEventEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C6C2B8400AB001AA422 /* PlaybackEventEntity.swift */; };
        97328C6E2B8400AB001AA422 /* PlaybackEventEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C6C2B8400AB001AA422 /* PlaybackEventEntity.swift */; };
        97328C702B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C6F2B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift */; };
        97328C712B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C6F2B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift */; };
        97328C732B8401F3001AA422 /* PlaybackEvent.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C722B8401F3001AA422 /* PlaybackEvent.swift */; };
        97328C742B8401F3001AA422 /* PlaybackEvent.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C722B8401F3001AA422 /* PlaybackEvent.swift */; };
        97328C762B840881001AA422 /* EventHistoryManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C752B840881001AA422 /* EventHistoryManager.swift */; };
        97328C772B840881001AA422 /* EventHistoryManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C752B840881001AA422 /* EventHistoryManager.swift */; };
        97328C792B8515B5001AA422 /* HistorySettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C782B8515B5001AA422 /* HistorySettingsView.swift */; };
        97328C7A2B8515B5001AA422 /* HistorySettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C782B8515B5001AA422 /* HistorySettingsView.swift */; };
        97328C7C2B8548A9001AA422 /* StateRestorationManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C7B2B8548A9001AA422 /* StateRestorationManager.swift */; };
        97328C7D2B8548A9001AA422 /* StateRestorationManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C7B2B8548A9001AA422 /* StateRestorationManager.swift */; };
        97328C7F2B857B4E001AA422 /* HistorySheet.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97328C7E2B857B4E001AA422 /* HistorySheet.swift */; };
        97356D5B2B72F60500FEB860 /* AudioAssetImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97356D5A2B72F60500FEB860 /* AudioAssetImageView.swift */; };
        97356D5C2B72F60500FEB860 /* AudioAssetImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97356D5A2B72F60500FEB860 /* AudioAssetImageView.swift */; };
        97356D5E2B72F61C00FEB860 /* GroupImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97356D5D2B72F61C00FEB860 /* GroupImageView.swift */; };
        97356D5F2B72F61C00FEB860 /* GroupImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97356D5D2B72F61C00FEB860 /* GroupImageView.swift */; };
        97356D612B7300D100FEB860 /* ArtworkView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97356D602B7300D100FEB860 /* ArtworkView.swift */; };
        97356D622B7300D100FEB860 /* ArtworkView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97356D602B7300D100FEB860 /* ArtworkView.swift */; };
        9735F4B32945D0DA00DE1D7E /* AudioEditor.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B22945D0DA00DE1D7E /* AudioEditor.swift */; };
        9735F4B5294663BB00DE1D7E /* AvAudioPlayer+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B4294663BB00DE1D7E /* AvAudioPlayer+Extensions.swift */; };
        9735F4B72946932F00DE1D7E /* PlaybackManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B62946932F00DE1D7E /* PlaybackManager.swift */; };
        9735F4BA2946DA7900DE1D7E /* AudioPlayerProgress.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B92946DA7900DE1D7E /* AudioPlayerProgress.swift */; };
        9735F4BC2946DA8700DE1D7E /* AudioPlayerState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4BB2946DA8700DE1D7E /* AudioPlayerState.swift */; };
        9735F4C72947B83300DE1D7E /* MacOSAudiosaicApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4C62947B83300DE1D7E /* MacOSAudiosaicApp.swift */; };
        9735F4C92947B83300DE1D7E /* AllAssetsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4C82947B83300DE1D7E /* AllAssetsView.swift */; };
        9735F4CB2947B83400DE1D7E /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 9735F4CA2947B83400DE1D7E /* Assets.xcassets */; };
        9735F4CE2947B83400DE1D7E /* Preview Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 9735F4CD2947B83400DE1D7E /* Preview Assets.xcassets */; };
        9735F4D32947BAFD00DE1D7E /* AudioFileManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239727E1A60500D773B5 /* AudioFileManager.swift */; };
        9735F4D42947BB0800DE1D7E /* MediaPlayerManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975023A727E24C2800D773B5 /* MediaPlayerManager.swift */; };
        9735F4D52947BB0D00DE1D7E /* NowPlayingInfo.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D42A6127E586C300D945D0 /* NowPlayingInfo.swift */; };
        9735F4D72947BB1400DE1D7E /* AvAudioPlayer+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B4294663BB00DE1D7E /* AvAudioPlayer+Extensions.swift */; };
        9735F4D92947BB8E00DE1D7E /* Const.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975023A027E1A69300D773B5 /* Const.swift */; };
        9735F4DA2947BB9300DE1D7E /* MusicPlayerView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238127E084EB00D773B5 /* MusicPlayerView.swift */; };
        9735F4DB2947BB9900DE1D7E /* MusicPlayerViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238B27E14A9100D773B5 /* MusicPlayerViewModel.swift */; };
        9735F4DC2947BB9D00DE1D7E /* PlaybackManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B62946932F00DE1D7E /* PlaybackManager.swift */; };
        9735F4DD2947BBA000DE1D7E /* AudioPlayerProgress.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B92946DA7900DE1D7E /* AudioPlayerProgress.swift */; };
        9735F4DE2947BBA200DE1D7E /* AudioPlayerState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4BB2946DA8700DE1D7E /* AudioPlayerState.swift */; };
        9735F4E02947BBAA00DE1D7E /* Slider.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D42A7D27E866B600D945D0 /* Slider.swift */; };
        9735F4E12947BBAC00DE1D7E /* DragLocation.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9706889527ECF1790018BFF6 /* DragLocation.swift */; };
        9735F4E22947BBAF00DE1D7E /* Slider+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9706889727ECF1A50018BFF6 /* Slider+Extensions.swift */; };
        9735F4E42947BBBB00DE1D7E /* FileReader.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238527E1380A00D773B5 /* FileReader.swift */; };
        9735F4E62947BBE500DE1D7E /* SongData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238D27E14AB900D773B5 /* SongData.swift */; };
        9735F4E72947BBE800DE1D7E /* AudioAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239C27E1A64F00D773B5 /* AudioAsset.swift */; };
        9735F4E82947BBEC00DE1D7E /* AudioFileEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239927E1A62900D773B5 /* AudioFileEntity.swift */; };
        9735F4E92947BBF300DE1D7E /* AudioAsset+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239E27E1A67F00D773B5 /* AudioAsset+CoreDataStored.swift */; };
        9735F4EA2947BBF600DE1D7E /* AudioEditor.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4B22945D0DA00DE1D7E /* AudioEditor.swift */; };
        9735F4EC2947BBFD00DE1D7E /* URL+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239127E14B7700D773B5 /* URL+Extensions.swift */; };
        9735F4ED2947BC0000DE1D7E /* AVAudioSession+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975023A527E1A71700D773B5 /* AVAudioSession+Extensions.swift */; };
        9735F4EF2947F1C600DE1D7E /* DownloadObserver.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4EE2947F1C600DE1D7E /* DownloadObserver.swift */; };
        9735F4F529483E2900DE1D7E /* AudioAssetListItemView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4F429483E2900DE1D7E /* AudioAssetListItemView.swift */; };
        9735F5112948483800DE1D7E /* CircularProgressView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F5102948483800DE1D7E /* CircularProgressView.swift */; };
        9735F512294903BB00DE1D7E /* DownloadObserver.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F4EE2947F1C600DE1D7E /* DownloadObserver.swift */; };
        9735F5162949191600DE1D7E /* AssetState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F5152949191600DE1D7E /* AssetState.swift */; };
        9735F5172949191900DE1D7E /* AssetState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F5152949191600DE1D7E /* AssetState.swift */; };
        9735F51A2949194300DE1D7E /* AudioAssetListViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F5192949194300DE1D7E /* AudioAssetListViewData.swift */; };
        9735F51B294919BD00DE1D7E /* AudioAssetListViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F5192949194300DE1D7E /* AudioAssetListViewData.swift */; };
        9735F51D294919EE00DE1D7E /* MainViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238927E1389E00D773B5 /* MainViewModel.swift */; };
        9735F51F29491A5800DE1D7E /* ProgressViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F51E29491A5800DE1D7E /* ProgressViewData.swift */; };
        9735F52029491A7000DE1D7E /* ProgressViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F51E29491A5800DE1D7E /* ProgressViewData.swift */; };
        9735F52429491B4500DE1D7E /* DocumentPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9735F52329491B4500DE1D7E /* DocumentPicker.swift */; };
        9735F52629491BE300DE1D7E /* Colors.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 9735F52529491BE300DE1D7E /* Colors.xcassets */; };
        9735F52729491BFB00DE1D7E /* Colors.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 9735F52529491BE300DE1D7E /* Colors.xcassets */; };
        9739A3282BA5711E0018CCDF /* EnvironmentKeys.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9739A3272BA5711E0018CCDF /* EnvironmentKeys.swift */; };
        9739A3292BA5711E0018CCDF /* EnvironmentKeys.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9739A3272BA5711E0018CCDF /* EnvironmentKeys.swift */; };
        973BD0BD2B67060600F9EE9E /* PlaybackRecordEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 973BD0B62B67060600F9EE9E /* PlaybackRecordEntity.swift */; };
        973BD0BE2B67060600F9EE9E /* PlaybackRecordEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 973BD0B62B67060600F9EE9E /* PlaybackRecordEntity.swift */; };
        973BD0C72B6708B000F9EE9E /* AudioFileDataModelFactory.swift in Sources */ = {isa = PBXBuildFile; fileRef = 973BD0C62B6708B000F9EE9E /* AudioFileDataModelFactory.swift */; };
        973BD0C82B6708B000F9EE9E /* AudioFileDataModelFactory.swift in Sources */ = {isa = PBXBuildFile; fileRef = 973BD0C62B6708B000F9EE9E /* AudioFileDataModelFactory.swift */; };
        973BD0CA2B68196400F9EE9E /* AudioAssetContentStore.swift in Sources */ = {isa = PBXBuildFile; fileRef = 973BD0C92B68196400F9EE9E /* AudioAssetContentStore.swift */; };
        973BD0CB2B68196400F9EE9E /* AudioAssetContentStore.swift in Sources */ = {isa = PBXBuildFile; fileRef = 973BD0C92B68196400F9EE9E /* AudioAssetContentStore.swift */; };
        97480C622B96B80B002DE830 /* SettingsPickerElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C612B96B80B002DE830 /* SettingsPickerElement.swift */; };
        97480C632B96B80B002DE830 /* SettingsPickerElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C612B96B80B002DE830 /* SettingsPickerElement.swift */; };
        97480C652B96B9C5002DE830 /* Settings_Previews.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C642B96B9C5002DE830 /* Settings_Previews.swift */; };
        97480C662B96B9C5002DE830 /* Settings_Previews.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C642B96B9C5002DE830 /* Settings_Previews.swift */; };
        97480C682B96C37F002DE830 /* ButtonPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C672B96C37F002DE830 /* ButtonPicker.swift */; };
        97480C692B96C37F002DE830 /* ButtonPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C672B96C37F002DE830 /* ButtonPicker.swift */; };
        97480C6C2B96F4F9002DE830 /* AppDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C6A2B96F4F9002DE830 /* AppDelegate.swift */; };
        97480C6E2B97A461002DE830 /* KeyPressManager+Combine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C6D2B97A461002DE830 /* KeyPressManager+Combine.swift */; };
        97480C6F2B97A461002DE830 /* KeyPressManager+Combine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C6D2B97A461002DE830 /* KeyPressManager+Combine.swift */; };
        97480C712B97A781002DE830 /* AVAudioSession+Combine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C702B97A781002DE830 /* AVAudioSession+Combine.swift */; };
        97480C722B97A781002DE830 /* AVAudioSession+Combine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C702B97A781002DE830 /* AVAudioSession+Combine.swift */; };
        97480C742B97AECF002DE830 /* PlaybackManager+iOS.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97480C732B97AECF002DE830 /* PlaybackManager+iOS.swift */; };
        9750237327DFE4C900D773B5 /* AudiosaicApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750237227DFE4C900D773B5 /* AudiosaicApp.swift */; };
        9750237527DFE4C900D773B5 /* MainView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750237427DFE4C900D773B5 /* MainView.swift */; };
        9750237727DFE4CA00D773B5 /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 9750237627DFE4CA00D773B5 /* Assets.xcassets */; };
        9750237A27DFE4CA00D773B5 /* Preview Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 9750237927DFE4CA00D773B5 /* Preview Assets.xcassets */; };
        9750238227E084EB00D773B5 /* MusicPlayerView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238127E084EB00D773B5 /* MusicPlayerView.swift */; };
        9750238427E137F000D773B5 /* DocumentPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238327E137F000D773B5 /* DocumentPicker.swift */; };
        9750238A27E1389E00D773B5 /* MainViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238927E1389E00D773B5 /* MainViewModel.swift */; };
        9750238C27E14A9100D773B5 /* MusicPlayerViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238B27E14A9100D773B5 /* MusicPlayerViewModel.swift */; };
        9750238E27E14AB900D773B5 /* SongData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750238D27E14AB900D773B5 /* SongData.swift */; };
        9750239227E14B7700D773B5 /* URL+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239127E14B7700D773B5 /* URL+Extensions.swift */; };
        9750239827E1A60500D773B5 /* AudioFileManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239727E1A60500D773B5 /* AudioFileManager.swift */; };
        9750239A27E1A62900D773B5 /* AudioFileEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239927E1A62900D773B5 /* AudioFileEntity.swift */; };
        9750239D27E1A64F00D773B5 /* AudioAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239C27E1A64F00D773B5 /* AudioAsset.swift */; };
        9750239F27E1A67F00D773B5 /* AudioAsset+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9750239E27E1A67F00D773B5 /* AudioAsset+CoreDataStored.swift */; };
        975023A127E1A69300D773B5 /* Const.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975023A027E1A69300D773B5 /* Const.swift */; };
        975023A627E1A71700D773B5 /* AVAudioSession+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975023A527E1A71700D773B5 /* AVAudioSession+Extensions.swift */; };
        975023A827E24C2800D773B5 /* MediaPlayerManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975023A727E24C2800D773B5 /* MediaPlayerManager.swift */; };
        975058E02B5667F500BA6917 /* FileUrlExtensions in Frameworks */ = {isa = PBXBuildFile; productRef = 975058DF2B5667F500BA6917 /* FileUrlExtensions */; };
        975058E22B5667FE00BA6917 /* FileUrlExtensions in Frameworks */ = {isa = PBXBuildFile; productRef = 975058E12B5667FE00BA6917 /* FileUrlExtensions */; };
        975058E42B57705D00BA6917 /* EventHistoryCommandsViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058E32B57705D00BA6917 /* EventHistoryCommandsViewModel.swift */; };
        975058E52B57705D00BA6917 /* EventHistoryCommandsViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058E32B57705D00BA6917 /* EventHistoryCommandsViewModel.swift */; };
        975058E82B5771B100BA6917 /* WindowForegroundObserver.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058E72B5771B100BA6917 /* WindowForegroundObserver.swift */; };
        975058E92B5771B100BA6917 /* WindowForegroundObserver.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058E72B5771B100BA6917 /* WindowForegroundObserver.swift */; };
        975058EB2B57D39500BA6917 /* ImportSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058EA2B57D39500BA6917 /* ImportSettingsView.swift */; };
        975058EE2B58417A00BA6917 /* AudioAsset+Preview.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058ED2B58417A00BA6917 /* AudioAsset+Preview.swift */; };
        975058EF2B58419800BA6917 /* AudioAsset+Preview.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058ED2B58417A00BA6917 /* AudioAsset+Preview.swift */; };
        975058F12B5848C100BA6917 /* SortView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058F02B5848C100BA6917 /* SortView.swift */; };
        975058F42B584BC500BA6917 /* SwiftUISettings in Frameworks */ = {isa = PBXBuildFile; productRef = 975058F32B584BC500BA6917 /* SwiftUISettings */; };
        975058F52B584CAF00BA6917 /* AudiosaicSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5062B4F4C4E0028BB53 /* AudiosaicSettingsView.swift */; };
        975058F62B584CB200BA6917 /* AudiosaicSettingsViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5092B4F4C8B0028BB53 /* AudiosaicSettingsViewModel.swift */; };
        975058F72B584CB600BA6917 /* AudiosaicSettingsPath.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F50C2B4F4CBC0028BB53 /* AudiosaicSettingsPath.swift */; };
        975058F82B584CB900BA6917 /* GeneralSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F50F2B4F4D8B0028BB53 /* GeneralSettingsView.swift */; };
        975058F92B584CBC00BA6917 /* AppearanceSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5112B4F4EA00028BB53 /* AppearanceSettingsView.swift */; };
        975058FA2B584CC100BA6917 /* ImportSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058EA2B57D39500BA6917 /* ImportSettingsView.swift */; };
        975058FD2B586DA400BA6917 /* Import+Errors.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058FC2B586DA400BA6917 /* Import+Errors.swift */; };
        975058FE2B586F7800BA6917 /* Import+Errors.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058FC2B586DA400BA6917 /* Import+Errors.swift */; };
        975059002B587ECE00BA6917 /* MergeProgressView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058FF2B587ECE00BA6917 /* MergeProgressView.swift */; };
        975059012B58821800BA6917 /* MergeProgressView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975058FF2B587ECE00BA6917 /* MergeProgressView.swift */; };
        975059032B588B1D00BA6917 /* PlaybackSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975059022B588B1D00BA6917 /* PlaybackSettingsView.swift */; };
        975059042B588B1D00BA6917 /* PlaybackSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975059022B588B1D00BA6917 /* PlaybackSettingsView.swift */; };
        975134552B51D6ED0018A62A /* EditView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134542B51D6ED0018A62A /* EditView.swift */; };
        975134562B51D6ED0018A62A /* EditView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134542B51D6ED0018A62A /* EditView.swift */; };
        975134582B51D7150018A62A /* AudioTrackEditManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134572B51D7150018A62A /* AudioTrackEditManager.swift */; };
        975134592B51D7150018A62A /* AudioTrackEditManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134572B51D7150018A62A /* AudioTrackEditManager.swift */; };
        9751345B2B51E1630018A62A /* URLSchemes.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751345A2B51E1630018A62A /* URLSchemes.swift */; };
        9751345C2B51E1630018A62A /* URLSchemes.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751345A2B51E1630018A62A /* URLSchemes.swift */; };
        9751345E2B51E3130018A62A /* DeepLinkManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751345D2B51E3120018A62A /* DeepLinkManager.swift */; };
        9751345F2B51E3130018A62A /* DeepLinkManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751345D2B51E3120018A62A /* DeepLinkManager.swift */; };
        975134622B51E3EA0018A62A /* URLAudiosaicAction.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134612B51E3EA0018A62A /* URLAudiosaicAction.swift */; };
        975134632B51E3EA0018A62A /* URLAudiosaicAction.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134612B51E3EA0018A62A /* URLAudiosaicAction.swift */; };
        975134662B52114F0018A62A /* ID3TagEditor in Frameworks */ = {isa = PBXBuildFile; productRef = 975134652B52114F0018A62A /* ID3TagEditor */; };
        975134682B52115D0018A62A /* ID3TagEditor in Frameworks */ = {isa = PBXBuildFile; productRef = 975134672B52115D0018A62A /* ID3TagEditor */; };
        9751346B2B5252070018A62A /* DevCommands.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751346A2B5252070018A62A /* DevCommands.swift */; };
        9751346C2B5252070018A62A /* DevCommands.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751346A2B5252070018A62A /* DevCommands.swift */; };
        9751346E2B5253AD0018A62A /* DebugScreen.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751346D2B5253AD0018A62A /* DebugScreen.swift */; };
        9751346F2B5253AD0018A62A /* DebugScreen.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751346D2B5253AD0018A62A /* DebugScreen.swift */; };
        975134712B534BF30018A62A /* EditAlbumCoverView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134702B534BF30018A62A /* EditAlbumCoverView.swift */; };
        975134722B534BF30018A62A /* EditAlbumCoverView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134702B534BF30018A62A /* EditAlbumCoverView.swift */; };
        975134742B548C7E0018A62A /* Table+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134732B548C7E0018A62A /* Table+Extensions.swift */; };
        975134752B548C7E0018A62A /* Table+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134732B548C7E0018A62A /* Table+Extensions.swift */; };
        975134772B5497960018A62A /* AssetSelectionManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134762B5497960018A62A /* AssetSelectionManager.swift */; };
        975134782B5497960018A62A /* AssetSelectionManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134762B5497960018A62A /* AssetSelectionManager.swift */; };
        975134852B54D6AB0018A62A /* MetadataSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134842B54D6AB0018A62A /* MetadataSettingsView.swift */; };
        975134862B54D6AC0018A62A /* MetadataSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134842B54D6AB0018A62A /* MetadataSettingsView.swift */; };
        975134882B54DC4D0018A62A /* MetadataManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134872B54DC4D0018A62A /* MetadataManager.swift */; };
        975134892B54DC4D0018A62A /* MetadataManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975134872B54DC4D0018A62A /* MetadataManager.swift */; };
        9751348E2B54FDC60018A62A /* WindowForegroundManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751348D2B54FDC60018A62A /* WindowForegroundManager.swift */; };
        9751348F2B54FDC60018A62A /* WindowForegroundManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9751348D2B54FDC60018A62A /* WindowForegroundManager.swift */; };
        97579E582B990B1800843C77 /* Preview+Utility.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97579E572B990B1800843C77 /* Preview+Utility.swift */; };
        97579E592B990E3F00843C77 /* Preview+Utility.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97579E572B990B1800843C77 /* Preview+Utility.swift */; };
        97579E5B2B99848200843C77 /* SettingsDurationPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97579E5A2B99848200843C77 /* SettingsDurationPicker.swift */; };
        97579E5E2B9A61C200843C77 /* CoreDataStored in Frameworks */ = {isa = PBXBuildFile; productRef = 97579E5D2B9A61C200843C77 /* CoreDataStored */; };
        97579E602B9A61CF00843C77 /* CoreDataStored in Frameworks */ = {isa = PBXBuildFile; productRef = 97579E5F2B9A61CF00843C77 /* CoreDataStored */; };
        97579E622B9A8E7500843C77 /* DropManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97579E612B9A8E7500843C77 /* DropManager.swift */; };
        97579E632B9A8E9D00843C77 /* DropManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97579E612B9A8E7500843C77 /* DropManager.swift */; };
        975BF6752B7C1E4A0061D332 /* EditGroupViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF6742B7C1E4A0061D332 /* EditGroupViewModel.swift */; };
        975BF6762B7C1E4A0061D332 /* EditGroupViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF6742B7C1E4A0061D332 /* EditGroupViewModel.swift */; };
        975BF6782B7C31000061D332 /* HardRefreshManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF6772B7C31000061D332 /* HardRefreshManager.swift */; };
        975BF6792B7C31000061D332 /* HardRefreshManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF6772B7C31000061D332 /* HardRefreshManager.swift */; };
        975BF67B2B7C31B80061D332 /* ImageAssetManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF67A2B7C31B80061D332 /* ImageAssetManager.swift */; };
        975BF67C2B7C31B80061D332 /* ImageAssetManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF67A2B7C31B80061D332 /* ImageAssetManager.swift */; };
        975BF67E2B7C525D0061D332 /* CatalogsMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF67D2B7C525D0061D332 /* CatalogsMenuView.swift */; };
        975BF67F2B7C525D0061D332 /* CatalogsMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975BF67D2B7C525D0061D332 /* CatalogsMenuView.swift */; };
        975D9F542B7D82E400473CA9 /* AlertManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F532B7D82E300473CA9 /* AlertManager.swift */; };
        975D9F552B7D82E400473CA9 /* AlertManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F532B7D82E300473CA9 /* AlertManager.swift */; };
        975D9F572B7EC43B00473CA9 /* View+Alert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F562B7EC43B00473CA9 /* View+Alert.swift */; };
        975D9F582B7EC43B00473CA9 /* View+Alert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F562B7EC43B00473CA9 /* View+Alert.swift */; };
        975D9F5B2B7EC47E00473CA9 /* CreateCatalogAlert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F5A2B7EC47E00473CA9 /* CreateCatalogAlert.swift */; };
        975D9F5C2B7EC47E00473CA9 /* CreateCatalogAlert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F5A2B7EC47E00473CA9 /* CreateCatalogAlert.swift */; };
        975D9F5E2B7ECBC100473CA9 /* RenameCatalogAlertView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F5D2B7ECBC100473CA9 /* RenameCatalogAlertView.swift */; };
        975D9F5F2B7ECBC100473CA9 /* RenameCatalogAlertView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 975D9F5D2B7ECBC100473CA9 /* RenameCatalogAlertView.swift */; };
        97608A0C2951448F00B0532C /* ProvisionallyPlayingSMTests.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259068294FDCC9004310CD /* ProvisionallyPlayingSMTests.swift */; };
        97608A0D2951448F00B0532C /* SessionStateTests.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259033294BC67C004310CD /* SessionStateTests.swift */; };
        97608A0E2951448F00B0532C /* Assertions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259054294D0560004310CD /* Assertions.swift */; };
        97608A0F2951450700B0532C /* MockTimer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259057294D057E004310CD /* MockTimer.swift */; };
        97608A102951450D00B0532C /* Transition.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97259059294D05DC004310CD /* Transition.swift */; };
        97608A112951451100B0532C /* TestEventLogger.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97052E1F295012E8003DCE48 /* TestEventLogger.swift */; };
        9763082F2B86B58F006D7622 /* AssetBookmark.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763082E2B86B58F006D7622 /* AssetBookmark.swift */; };
        976308302B86B58F006D7622 /* AssetBookmark.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763082E2B86B58F006D7622 /* AssetBookmark.swift */; };
        976308322B86BB67006D7622 /* BookmarkManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308312B86BB67006D7622 /* BookmarkManager.swift */; };
        976308332B86BB67006D7622 /* BookmarkManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308312B86BB67006D7622 /* BookmarkManager.swift */; };
        976308352B86C1CF006D7622 /* AssetBookmarkEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308342B86C1CF006D7622 /* AssetBookmarkEntity.swift */; };
        976308362B86C1CF006D7622 /* AssetBookmarkEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308342B86C1CF006D7622 /* AssetBookmarkEntity.swift */; };
        976308382B86C234006D7622 /* AssetBookmark+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308372B86C234006D7622 /* AssetBookmark+CoreDataStored.swift */; };
        976308392B86C234006D7622 /* AssetBookmark+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308372B86C234006D7622 /* AssetBookmark+CoreDataStored.swift */; };
        9763083B2B88619A006D7622 /* AppleDevice.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763083A2B88619A006D7622 /* AppleDevice.swift */; };
        9763083C2B88619A006D7622 /* AppleDevice.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763083A2B88619A006D7622 /* AppleDevice.swift */; };
        9763083E2B8910F1006D7622 /* KeyPathComparators.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763083D2B8910F1006D7622 /* KeyPathComparators.swift */; };
        9763083F2B8910F1006D7622 /* KeyPathComparators.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763083D2B8910F1006D7622 /* KeyPathComparators.swift */; };
        976308412B89157C006D7622 /* EventHistoryViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308402B89157C006D7622 /* EventHistoryViewModel.swift */; };
        976308422B89157C006D7622 /* EventHistoryViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308402B89157C006D7622 /* EventHistoryViewModel.swift */; };
        976308452B8915AF006D7622 /* EventViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308442B8915AF006D7622 /* EventViewData.swift */; };
        976308462B8915AF006D7622 /* EventViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308442B8915AF006D7622 /* EventViewData.swift */; };
        976308482B8915BF006D7622 /* GroupedEventViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308472B8915BF006D7622 /* GroupedEventViewData.swift */; };
        976308492B8915BF006D7622 /* GroupedEventViewData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976308472B8915BF006D7622 /* GroupedEventViewData.swift */; };
        9763084B2B892646006D7622 /* HistoryEventView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763084A2B892646006D7622 /* HistoryEventView.swift */; };
        9763084C2B892646006D7622 /* HistoryEventView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763084A2B892646006D7622 /* HistoryEventView.swift */; };
        9763084F2B8928F0006D7622 /* HistoryEventView+Previews.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763084E2B8928F0006D7622 /* HistoryEventView+Previews.swift */; };
        976308502B8928F0006D7622 /* HistoryEventView+Previews.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9763084E2B8928F0006D7622 /* HistoryEventView+Previews.swift */; };
        9767ADC02BA20D6A00449AB9 /* ChapterNavigator.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADBF2BA20D6A00449AB9 /* ChapterNavigator.swift */; };
        9767ADC12BA20D6A00449AB9 /* ChapterNavigator.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADBF2BA20D6A00449AB9 /* ChapterNavigator.swift */; };
        9767ADC72BA2362B00449AB9 /* ChapterNavigatorPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADC62BA2362B00449AB9 /* ChapterNavigatorPicker.swift */; };
        9767ADC82BA2362B00449AB9 /* ChapterNavigatorPicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADC62BA2362B00449AB9 /* ChapterNavigatorPicker.swift */; };
        9767ADCB2BA2444600449AB9 /* PlayButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADCA2BA2444600449AB9 /* PlayButton.swift */; };
        9767ADCC2BA2444600449AB9 /* PlayButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADCA2BA2444600449AB9 /* PlayButton.swift */; };
        9767ADCF2BA24B1A00449AB9 /* SetTimerMenu.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADCE2BA24B1A00449AB9 /* SetTimerMenu.swift */; };
        9767ADD02BA24B1A00449AB9 /* SetTimerMenu.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADCE2BA24B1A00449AB9 /* SetTimerMenu.swift */; };
        9767ADD22BA2506400449AB9 /* TimedPlaybackManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADD12BA2506400449AB9 /* TimedPlaybackManager.swift */; };
        9767ADD32BA2506400449AB9 /* TimedPlaybackManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADD12BA2506400449AB9 /* TimedPlaybackManager.swift */; };
        9767ADD62BA2509D00449AB9 /* TimedPlaybackData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADD52BA2509D00449AB9 /* TimedPlaybackData.swift */; };
        9767ADD72BA2509D00449AB9 /* TimedPlaybackData.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADD52BA2509D00449AB9 /* TimedPlaybackData.swift */; };
        9767ADD92BA250BB00449AB9 /* TimerDataView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADD82BA250BB00449AB9 /* TimerDataView.swift */; };
        9767ADDA2BA250BB00449AB9 /* TimerDataView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADD82BA250BB00449AB9 /* TimerDataView.swift */; };
        9767ADDC2BA37D1A00449AB9 /* TimeRounding.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADDB2BA37D1A00449AB9 /* TimeRounding.swift */; };
        9767ADDD2BA37D1A00449AB9 /* TimeRounding.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADDB2BA37D1A00449AB9 /* TimeRounding.swift */; };
        9767ADFA2BA3A44700449AB9 /* SubscribedText.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADF92BA3A44700449AB9 /* SubscribedText.swift */; };
        9767ADFB2BA3A44700449AB9 /* SubscribedText.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9767ADF92BA3A44700449AB9 /* SubscribedText.swift */; };
        976C1CDA2B422BC400E2BF19 /* AppRoving in Frameworks */ = {isa = PBXBuildFile; productRef = 976C1CD92B422BC400E2BF19 /* AppRoving */; };
        976C1CDD2B44C70900E2BF19 /* GeneralDebugging.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976C1CDC2B44C70900E2BF19 /* GeneralDebugging.swift */; };
        976C1CDE2B44C71E00E2BF19 /* GeneralDebugging.swift in Sources */ = {isa = PBXBuildFile; fileRef = 976C1CDC2B44C70900E2BF19 /* GeneralDebugging.swift */; };
        976C1CE02B44C73A00E2BF19 /* AppRoving in Frameworks */ = {isa = PBXBuildFile; productRef = 976C1CDF2B44C73A00E2BF19 /* AppRoving */; };
        977251C52B589DAA00DE66FE /* AudioTrackEditSheet.swift in Sources */ = {isa = PBXBuildFile; fileRef = 977251C42B589DAA00DE66FE /* AudioTrackEditSheet.swift */; };
        9778F4DA2B4F28B60028BB53 /* WindowManager in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F4D92B4F28B60028BB53 /* WindowManager */; };
        9778F4DF2B4F2AF70028BB53 /* EventHistoryView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4DE2B4F2AF70028BB53 /* EventHistoryView.swift */; };
        9778F4E02B4F2B490028BB53 /* EventHistoryWindowView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4DC2B4F2AD50028BB53 /* EventHistoryWindowView.swift */; };
        9778F4E22B4F2B620028BB53 /* EventHistoryView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4DE2B4F2AF70028BB53 /* EventHistoryView.swift */; };
        9778F4E42B4F2B710028BB53 /* Windows.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4E32B4F2B700028BB53 /* Windows.swift */; };
        9778F4EA2B4F36E00028BB53 /* UserPreferences in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F4E92B4F36E00028BB53 /* UserPreferences */; };
        9778F4EC2B4F36E80028BB53 /* UserPreferences in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F4EB2B4F36E80028BB53 /* UserPreferences */; };
        9778F4EE2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4ED2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift */; };
        9778F4EF2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4ED2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift */; };
        9778F4F12B4F385E0028BB53 /* PreferredColorScheme.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4F02B4F385E0028BB53 /* PreferredColorScheme.swift */; };
        9778F4F22B4F385E0028BB53 /* PreferredColorScheme.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F4F02B4F385E0028BB53 /* PreferredColorScheme.swift */; };
        9778F5082B4F4C4E0028BB53 /* AudiosaicSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5062B4F4C4E0028BB53 /* AudiosaicSettingsView.swift */; };
        9778F50B2B4F4C8B0028BB53 /* AudiosaicSettingsViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5092B4F4C8B0028BB53 /* AudiosaicSettingsViewModel.swift */; };
        9778F50E2B4F4CBC0028BB53 /* AudiosaicSettingsPath.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F50C2B4F4CBC0028BB53 /* AudiosaicSettingsPath.swift */; };
        9778F5102B4F4D8B0028BB53 /* GeneralSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F50F2B4F4D8B0028BB53 /* GeneralSettingsView.swift */; };
        9778F5122B4F4EA00028BB53 /* AppearanceSettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5112B4F4EA00028BB53 /* AppearanceSettingsView.swift */; };
        9778F5152B4F50880028BB53 /* SwiftUISettings in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F5142B4F50880028BB53 /* SwiftUISettings */; };
        9778F51A2B4F58ED0028BB53 /* PlayerEventLogger.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5192B4F58ED0028BB53 /* PlayerEventLogger.swift */; };
        9778F51B2B4F58ED0028BB53 /* PlayerEventLogger.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5192B4F58ED0028BB53 /* PlayerEventLogger.swift */; };
        9778F51D2B4F5A2F0028BB53 /* UIImage+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F51C2B4F5A2F0028BB53 /* UIImage+Extensions.swift */; };
        9778F51E2B4F5A2F0028BB53 /* UIImage+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F51C2B4F5A2F0028BB53 /* UIImage+Extensions.swift */; };
        9778F5212B4F5C200028BB53 /* Formatters.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5202B4F5C200028BB53 /* Formatters.swift */; };
        9778F5222B4F5C200028BB53 /* Formatters.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5202B4F5C200028BB53 /* Formatters.swift */; };
        9778F5252B4F609E0028BB53 /* PlaybackStateProtocol.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5242B4F609E0028BB53 /* PlaybackStateProtocol.swift */; };
        9778F5262B4F609E0028BB53 /* PlaybackStateProtocol.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5242B4F609E0028BB53 /* PlaybackStateProtocol.swift */; };
        9778F5282B4F61460028BB53 /* StateMachine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5272B4F61460028BB53 /* StateMachine.swift */; };
        9778F5292B4F61460028BB53 /* StateMachine.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5272B4F61460028BB53 /* StateMachine.swift */; };
        9778F52C2B4F618F0028BB53 /* FrameType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F52B2B4F618F0028BB53 /* FrameType.swift */; };
        9778F52D2B4F618F0028BB53 /* FrameType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F52B2B4F618F0028BB53 /* FrameType.swift */; };
        9778F52F2B4F61E80028BB53 /* SMFrame.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F52E2B4F61E80028BB53 /* SMFrame.swift */; };
        9778F5302B4F61E80028BB53 /* SMFrame.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F52E2B4F61E80028BB53 /* SMFrame.swift */; };
        9778F5322B4F62320028BB53 /* SessionStateMachine+Debug.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5312B4F62320028BB53 /* SessionStateMachine+Debug.swift */; };
        9778F5332B4F62320028BB53 /* SessionStateMachine+Debug.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5312B4F62320028BB53 /* SessionStateMachine+Debug.swift */; };
        9778F5362B4F675B0028BB53 /* SessionStack.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5352B4F675B0028BB53 /* SessionStack.swift */; };
        9778F5372B4F675B0028BB53 /* SessionStack.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5352B4F675B0028BB53 /* SessionStack.swift */; };
        9778F53B2B4FC9AD0028BB53 /* FirebaseAnalytics in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F53A2B4FC9AD0028BB53 /* FirebaseAnalytics */; };
        9778F53D2B4FC9AD0028BB53 /* FirebaseCrashlytics in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F53C2B4FC9AD0028BB53 /* FirebaseCrashlytics */; };
        9778F53F2B4FC9C40028BB53 /* FirebaseAnalytics in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F53E2B4FC9C40028BB53 /* FirebaseAnalytics */; };
        9778F5412B4FC9C40028BB53 /* FirebaseCrashlytics in Frameworks */ = {isa = PBXBuildFile; productRef = 9778F5402B4FC9C40028BB53 /* FirebaseCrashlytics */; };
        9778F5482B4FCD8F0028BB53 /* GoogleService-Info.plist in Resources */ = {isa = PBXBuildFile; fileRef = 9778F5472B4FCD8F0028BB53 /* GoogleService-Info.plist */; };
        9778F5492B4FCD8F0028BB53 /* GoogleService-Info.plist in Resources */ = {isa = PBXBuildFile; fileRef = 9778F5472B4FCD8F0028BB53 /* GoogleService-Info.plist */; };
        9778F54B2B506C750028BB53 /* AVAudioPlayerType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F54A2B506C750028BB53 /* AVAudioPlayerType.swift */; };
        9778F54C2B506C750028BB53 /* AVAudioPlayerType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F54A2B506C750028BB53 /* AVAudioPlayerType.swift */; };
        9778F54E2B506CA70028BB53 /* AVPlayerBuilder.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F54D2B506CA70028BB53 /* AVPlayerBuilder.swift */; };
        9778F54F2B506CA70028BB53 /* AVPlayerBuilder.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F54D2B506CA70028BB53 /* AVPlayerBuilder.swift */; };
        9778F5522B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5512B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift */; };
        9778F5532B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5512B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift */; };
        9778F5552B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5542B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift */; };
        9778F5562B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5542B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift */; };
        9778F5582B506E5F0028BB53 /* AudioPlayerDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5572B506E5F0028BB53 /* AudioPlayerDelegate.swift */; };
        9778F5592B506E5F0028BB53 /* AudioPlayerDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9778F5572B506E5F0028BB53 /* AudioPlayerDelegate.swift */; };
        978196732B50A5A100C3FF82 /* PlaybackRecord.swift in Sources */ = {isa = PBXBuildFile; fileRef = 978196722B50A5A100C3FF82 /* PlaybackRecord.swift */; };
        978196742B50A5A100C3FF82 /* PlaybackRecord.swift in Sources */ = {isa = PBXBuildFile; fileRef = 978196722B50A5A100C3FF82 /* PlaybackRecord.swift */; };
        978196762B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 978196752B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift */; };
        978196772B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 978196752B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift */; };
        9781967A2B50FD6C00C3FF82 /* CoreDataStored in Frameworks */ = {isa = PBXBuildFile; productRef = 978196792B50FD6C00C3FF82 /* CoreDataStored */; };
        9781967C2B5128CC00C3FF82 /* CoreDataStored in Frameworks */ = {isa = PBXBuildFile; productRef = 9781967B2B5128CC00C3FF82 /* CoreDataStored */; };
        9781967F2B51ADEA00C3FF82 /* AudioTrackEditView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9781967E2B51ADEA00C3FF82 /* AudioTrackEditView.swift */; };
        97831D902B9F927500C4BBE7 /* Sequence+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D8F2B9F927500C4BBE7 /* Sequence+Extensions.swift */; };
        97831D912B9F927500C4BBE7 /* Sequence+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D8F2B9F927500C4BBE7 /* Sequence+Extensions.swift */; };
        97831D932B9FB17000C4BBE7 /* NSDomainError+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D922B9FB17000C4BBE7 /* NSDomainError+Extensions.swift */; };
        97831D942B9FB17000C4BBE7 /* NSDomainError+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D922B9FB17000C4BBE7 /* NSDomainError+Extensions.swift */; };
        97831D962BA0171F00C4BBE7 /* MultiEditRangeValue.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D952BA0171F00C4BBE7 /* MultiEditRangeValue.swift */; };
        97831D972BA0171F00C4BBE7 /* MultiEditRangeValue.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D952BA0171F00C4BBE7 /* MultiEditRangeValue.swift */; };
        97831D992BA0F1FC00C4BBE7 /* Chapter.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D982BA0F1FC00C4BBE7 /* Chapter.swift */; };
        97831D9A2BA0F1FC00C4BBE7 /* Chapter.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D982BA0F1FC00C4BBE7 /* Chapter.swift */; };
        97831D9C2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D9B2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift */; };
        97831D9D2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D9B2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift */; };
        97831DA02BA0F93A00C4BBE7 /* ChapterEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D9F2BA0F93A00C4BBE7 /* ChapterEntity.swift */; };
        97831DA12BA0F93A00C4BBE7 /* ChapterEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831D9F2BA0F93A00C4BBE7 /* ChapterEntity.swift */; };
        97831DA32BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831DA22BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift */; };
        97831DA42BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831DA22BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift */; };
        97831DA62BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831DA52BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift */; };
        97831DA72BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97831DA52BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift */; };
        97A443632B51BF9D00983906 /* AudioTrackEditWindowView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A443622B51BF9D00983906 /* AudioTrackEditWindowView.swift */; };
        97A4FEAB2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A4FEAA2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift */; };
        97A4FEAC2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A4FEAA2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift */; };
        97A4FEAE2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A4FEAD2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift */; };
        97A4FEAF2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A4FEAD2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift */; };
        97A4FEB12B59EA5500F25DF6 /* Mp3SharedAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A4FEB02B59EA5500F25DF6 /* Mp3SharedAsset.swift */; };
        97A4FEB22B59EA5500F25DF6 /* Mp3SharedAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97A4FEB02B59EA5500F25DF6 /* Mp3SharedAsset.swift */; };
        97AEBE6A2BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE692BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift */; };
        97AEBE6B2BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE692BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift */; };
        97AEBE6D2BA43D3000B1C867 /* BookmarkMenuElementView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE6C2BA43D3000B1C867 /* BookmarkMenuElementView.swift */; };
        97AEBE6E2BA43D3000B1C867 /* BookmarkMenuElementView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE6C2BA43D3000B1C867 /* BookmarkMenuElementView.swift */; };
        97AEBE702BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE6F2BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift */; };
        97AEBE712BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE6F2BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift */; };
        97AEBE732BA4B88200B1C867 /* View+AlertWithTextField.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE722BA4B88200B1C867 /* View+AlertWithTextField.swift */; };
        97AEBE742BA4B88200B1C867 /* View+AlertWithTextField.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97AEBE722BA4B88200B1C867 /* View+AlertWithTextField.swift */; };
        97B651152BAB67D100605D44 /* TagManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651142BAB67D100605D44 /* TagManager.swift */; };
        97B651172BAB67E500605D44 /* Tag.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651162BAB67E500605D44 /* Tag.swift */; };
        97B6511A2BAB681A00605D44 /* AddMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651192BAB681A00605D44 /* AddMenuView.swift */; };
        97B6511C2BAB683100605D44 /* TagsMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B6511B2BAB683100605D44 /* TagsMenuView.swift */; };
        97B6511D2BAB68A700605D44 /* Tag.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651162BAB67E500605D44 /* Tag.swift */; };
        97B6511E2BAB68AA00605D44 /* TagManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651142BAB67D100605D44 /* TagManager.swift */; };
        97B6511F2BAB68E100605D44 /* AddMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651192BAB681A00605D44 /* AddMenuView.swift */; };
        97B651202BAB68E700605D44 /* TagsMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B6511B2BAB683100605D44 /* TagsMenuView.swift */; };
        97B651222BAB6FE500605D44 /* CreateTagAlert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651212BAB6FE400605D44 /* CreateTagAlert.swift */; };
        97B651232BAB6FE500605D44 /* CreateTagAlert.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651212BAB6FE400605D44 /* CreateTagAlert.swift */; };
        97B651252BAB7DAC00605D44 /* TagEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651242BAB7DAC00605D44 /* TagEntity.swift */; };
        97B651262BAB7DAC00605D44 /* TagEntity.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651242BAB7DAC00605D44 /* TagEntity.swift */; };
        97B651282BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651272BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift */; };
        97B651292BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651272BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift */; };
        97B6512B2BABA17600605D44 /* ContextProvider.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B6512A2BABA17600605D44 /* ContextProvider.swift */; };
        97B6512C2BABA17600605D44 /* ContextProvider.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B6512A2BABA17600605D44 /* ContextProvider.swift */; };
        97B6512F2BABA91500605D44 /* ContextMonad.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B6512E2BABA91500605D44 /* ContextMonad.swift */; };
        97B651302BABA91500605D44 /* ContextMonad.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B6512E2BABA91500605D44 /* ContextMonad.swift */; };
        97B651322BABA92500605D44 /* ContextContainer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651312BABA92500605D44 /* ContextContainer.swift */; };
        97B651332BABA92500605D44 /* ContextContainer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B651312BABA92500605D44 /* ContextContainer.swift */; };
        97B8A2FC2B6C31930097D232 /* NestedTable in Frameworks */ = {isa = PBXBuildFile; productRef = 97B8A2FB2B6C31930097D232 /* NestedTable */; };
        97B8A2FE2B6C4F130097D232 /* MainMenuContextMenuItems.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A2FD2B6C4F090097D232 /* MainMenuContextMenuItems.swift */; };
        97B8A3002B6C500E0097D232 /* MainView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A2FF2B6C4FF70097D232 /* MainView.swift */; };
        97B8A3032B6C854A0097D232 /* KeyPathComparator+String.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A3022B6C854A0097D232 /* KeyPathComparator+String.swift */; };
        97B8A3042B6C854A0097D232 /* KeyPathComparator+String.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A3022B6C854A0097D232 /* KeyPathComparator+String.swift */; };
        97B8A3062B6C87480097D232 /* MainViewModel+Import.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A3052B6C87480097D232 /* MainViewModel+Import.swift */; };
        97B8A3072B6C87480097D232 /* MainViewModel+Import.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A3052B6C87480097D232 /* MainViewModel+Import.swift */; };
        97B8A3092B6C88900097D232 /* MainViewModel+iOS.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A3082B6C88900097D232 /* MainViewModel+iOS.swift */; };
        97B8A30A2B6C88900097D232 /* MainViewModel+iOS.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B8A3082B6C88900097D232 /* MainViewModel+iOS.swift */; };
        97C6333B2BA7AD7A005DE243 /* PlaylistManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6333A2BA7AD7A005DE243 /* PlaylistManager.swift */; };
        97C6333C2BA7AD7A005DE243 /* PlaylistManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6333A2BA7AD7A005DE243 /* PlaylistManager.swift */; };
        97C6333F2BA8AB6A005DE243 /* MoveToMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6333E2BA8AB6A005DE243 /* MoveToMenuView.swift */; };
        97C633402BA8AB6A005DE243 /* MoveToMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6333E2BA8AB6A005DE243 /* MoveToMenuView.swift */; };
        97C633422BA8AC16005DE243 /* PlaylistsMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633412BA8AC16005DE243 /* PlaylistsMenuView.swift */; };
        97C633432BA8AC16005DE243 /* PlaylistsMenuView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633412BA8AC16005DE243 /* PlaylistsMenuView.swift */; };
        97C633492BA8AF81005DE243 /* PlaylistElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633482BA8AF81005DE243 /* PlaylistElement.swift */; };
        97C6334A2BA8AF81005DE243 /* PlaylistElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633482BA8AF81005DE243 /* PlaylistElement.swift */; };
        97C6334C2BA8AF92005DE243 /* AssetlPlaylistElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6334B2BA8AF92005DE243 /* AssetlPlaylistElement.swift */; };
        97C6334D2BA8AF92005DE243 /* AssetlPlaylistElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6334B2BA8AF92005DE243 /* AssetlPlaylistElement.swift */; };
        97C6334F2BA8AFA3005DE243 /* PlaylistType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6334E2BA8AFA2005DE243 /* PlaylistType.swift */; };
        97C633502BA8AFA3005DE243 /* PlaylistType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6334E2BA8AFA2005DE243 /* PlaylistType.swift */; };
        97C633522BA8AFB4005DE243 /* Playlist.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633512BA8AFB4005DE243 /* Playlist.swift */; };
        97C633532BA8AFB4005DE243 /* Playlist.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633512BA8AFB4005DE243 /* Playlist.swift */; };
        97C633552BA8AFE4005DE243 /* ManualPlaylist.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633542BA8AFE4005DE243 /* ManualPlaylist.swift */; };
        97C633562BA8AFE4005DE243 /* ManualPlaylist.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633542BA8AFE4005DE243 /* ManualPlaylist.swift */; };
        97C633582BA8AFF4005DE243 /* SmartPlaylistRule.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633572BA8AFF4005DE243 /* SmartPlaylistRule.swift */; };
        97C633592BA8AFF4005DE243 /* SmartPlaylistRule.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C633572BA8AFF4005DE243 /* SmartPlaylistRule.swift */; };
        97C6335B2BA8B004005DE243 /* SmartPlaylist.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6335A2BA8B004005DE243 /* SmartPlaylist.swift */; };
        97C6335C2BA8B004005DE243 /* SmartPlaylist.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6335A2BA8B004005DE243 /* SmartPlaylist.swift */; };
        97C633602BA8B021005DE243 /* Podcast.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6335F2BA8B021005DE243 /* Podcast.swift */; };
        97C633612BA8B021005DE243 /* Podcast.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97C6335F2BA8B021005DE243 /* Podcast.swift */; };
        97D42A6227E586C300D945D0 /* NowPlayingInfo.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D42A6127E586C300D945D0 /* NowPlayingInfo.swift */; };
        97D42A7E27E866B600D945D0 /* Slider.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D42A7D27E866B600D945D0 /* Slider.swift */; };
        97D5252A2B4DFE040041BB5F /* Transitions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 971C64942B4DDC2600C97731 /* Transitions.swift */; };
        97D98C8E2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D98C8D2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift */; };
        97D98C8F2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D98C8D2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift */; };
        97DE91AD2B6EEAB7003D20E8 /* ImportMethod.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91AC2B6EEAB7003D20E8 /* ImportMethod.swift */; };
        97DE91AE2B6EEAB7003D20E8 /* ImportMethod.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91AC2B6EEAB7003D20E8 /* ImportMethod.swift */; };
        97DE91B22B6EEF2F003D20E8 /* MainViewSingleSelectionContextMenu.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91B02B6EEF2F003D20E8 /* MainViewSingleSelectionContextMenu.swift */; };
        97DE91B82B6EF1BD003D20E8 /* MainViewImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91B72B6EF1BD003D20E8 /* MainViewImageView.swift */; };
        97DE91B92B6EF1BD003D20E8 /* MainViewImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91B72B6EF1BD003D20E8 /* MainViewImageView.swift */; };
        97DE91BB2B6F64F1003D20E8 /* MainViewKeyPaths.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91BA2B6F64F1003D20E8 /* MainViewKeyPaths.swift */; };
        97DE91BC2B6F64F1003D20E8 /* MainViewKeyPaths.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97DE91BA2B6F64F1003D20E8 /* MainViewKeyPaths.swift */; };
        97E4E7162B51C16200AF2BDA /* AudioTrackEditView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 9781967E2B51ADEA00C3FF82 /* AudioTrackEditView.swift */; };
        97E718532B8FA5D90011D43C /* InitializationState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718522B8FA5D90011D43C /* InitializationState.swift */; };
        97E718542B8FA5D90011D43C /* InitializationState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718522B8FA5D90011D43C /* InitializationState.swift */; };
        97E718562B8FA8290011D43C /* AppErrorView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718552B8FA8290011D43C /* AppErrorView.swift */; };
        97E718572B8FA8290011D43C /* AppErrorView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718552B8FA8290011D43C /* AppErrorView.swift */; };
        97E718592B8FB9860011D43C /* Primitives+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718582B8FB9860011D43C /* Primitives+Extensions.swift */; };
        97E7185A2B8FB9860011D43C /* Primitives+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718582B8FB9860011D43C /* Primitives+Extensions.swift */; };
        97E7185C2B8FB9CD0011D43C /* Array+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7185B2B8FB9CD0011D43C /* Array+Extensions.swift */; };
        97E7185D2B8FB9CD0011D43C /* Array+Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7185B2B8FB9CD0011D43C /* Array+Extensions.swift */; };
        97E718602B8FD1870011D43C /* EditViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7185F2B8FD1870011D43C /* EditViewModel.swift */; };
        97E718612B8FD1870011D43C /* EditViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7185F2B8FD1870011D43C /* EditViewModel.swift */; };
        97E718632B8FDA960011D43C /* EditViewElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718622B8FDA960011D43C /* EditViewElement.swift */; };
        97E718642B8FDA960011D43C /* EditViewElement.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718622B8FDA960011D43C /* EditViewElement.swift */; };
        97E718662B8FDC690011D43C /* SmartEditOption.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718652B8FDC690011D43C /* SmartEditOption.swift */; };
        97E718672B8FDC690011D43C /* SmartEditOption.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718652B8FDC690011D43C /* SmartEditOption.swift */; };
        97E718692B90F47D0011D43C /* View+Sheet.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718682B90F47D0011D43C /* View+Sheet.swift */; };
        97E7186A2B90F47D0011D43C /* View+Sheet.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718682B90F47D0011D43C /* View+Sheet.swift */; };
        97E7186C2B9102310011D43C /* View+if.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7186B2B9102310011D43C /* View+if.swift */; };
        97E7186D2B9102310011D43C /* View+if.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7186B2B9102310011D43C /* View+if.swift */; };
        97E718702B9111360011D43C /* RegularExpressionSheetView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7186F2B9111360011D43C /* RegularExpressionSheetView.swift */; };
        97E718712B9111360011D43C /* RegularExpressionSheetView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7186F2B9111360011D43C /* RegularExpressionSheetView.swift */; };
        97E718742B9111540011D43C /* ReHelper.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718732B9111540011D43C /* ReHelper.swift */; };
        97E718752B9111540011D43C /* ReHelper.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718732B9111540011D43C /* ReHelper.swift */; };
        97E718772B91116B0011D43C /* RegularExpressionAlertViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718762B91116B0011D43C /* RegularExpressionAlertViewModel.swift */; };
        97E718782B91116B0011D43C /* RegularExpressionAlertViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718762B91116B0011D43C /* RegularExpressionAlertViewModel.swift */; };
        97E7187C2B912EFB0011D43C /* EditTests.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7187B2B912EFB0011D43C /* EditTests.swift */; };
        97E718812B91586E0011D43C /* EditSheets.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718802B91586E0011D43C /* EditSheets.swift */; };
        97E718822B91586E0011D43C /* EditSheets.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718802B91586E0011D43C /* EditSheets.swift */; };
        97E718832B9158720011D43C /* EditViewTextFieldViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7187E2B91584E0011D43C /* EditViewTextFieldViewModel.swift */; };
        97E718842B9158730011D43C /* EditViewTextFieldViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7187E2B91584E0011D43C /* EditViewTextFieldViewModel.swift */; };
        97E718872B9249540011D43C /* EditViewTextFieldMenu.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718862B9249540011D43C /* EditViewTextFieldMenu.swift */; };
        97E718882B9249540011D43C /* EditViewTextFieldMenu.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718862B9249540011D43C /* EditViewTextFieldMenu.swift */; };
        97E7188D2B92690D0011D43C /* MultiEditValue.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7188C2B92690D0011D43C /* MultiEditValue.swift */; };
        97E7188E2B92690D0011D43C /* MultiEditValue.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7188C2B92690D0011D43C /* MultiEditValue.swift */; };
        97E718942B9294090011D43C /* AccessoryBarlikeButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718932B9294090011D43C /* AccessoryBarlikeButton.swift */; };
        97E718952B9294090011D43C /* AccessoryBarlikeButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718932B9294090011D43C /* AccessoryBarlikeButton.swift */; };
        97E718972B94464C0011D43C /* Array+AudioAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718962B94464C0011D43C /* Array+AudioAsset.swift */; };
        97E718982B94464C0011D43C /* Array+AudioAsset.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718962B94464C0011D43C /* Array+AudioAsset.swift */; };
        97E7189A2B9543630011D43C /* PlainTextReValue.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718992B9543630011D43C /* PlainTextReValue.swift */; };
        97E7189B2B9543630011D43C /* PlainTextReValue.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718992B9543630011D43C /* PlainTextReValue.swift */; };
        97E7189E2B9673A20011D43C /* SettingsButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7189D2B9673A20011D43C /* SettingsButton.swift */; };
        97E718A02B9673B50011D43C /* SettingsLabel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7189F2B9673B50011D43C /* SettingsLabel.swift */; };
        97E718A12B9673CA0011D43C /* SettingsLabel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7189F2B9673B50011D43C /* SettingsLabel.swift */; };
        97E718A22B9673CF0011D43C /* SettingsButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E7189D2B9673A20011D43C /* SettingsButton.swift */; };
        97E718A42B9673EC0011D43C /* URLs.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718A32B9673EC0011D43C /* URLs.swift */; };
        97E718A62B9674080011D43C /* Settings+AppVersion.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718A52B9674080011D43C /* Settings+AppVersion.swift */; };
        97E718A72B96741A0011D43C /* Settings+AppVersion.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718A52B9674080011D43C /* Settings+AppVersion.swift */; };
        97E718A82B9674490011D43C /* URLs.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718A32B9673EC0011D43C /* URLs.swift */; };
        97E718AA2B9674EB0011D43C /* SettingsToggle.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718A92B9674EB0011D43C /* SettingsToggle.swift */; };
        97E718AB2B9675040011D43C /* SettingsToggle.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E718A92B9674EB0011D43C /* SettingsToggle.swift */; };
        97E882CD2B59952D00BA5B08 /* MainToolbar+iOS.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E882CC2B59952D00BA5B08 /* MainToolbar+iOS.swift */; };
        97E882D12B59958700BA5B08 /* MainToolbar+macOS.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E882CF2B59956100BA5B08 /* MainToolbar+macOS.swift */; };
        97E882D32B59B01300BA5B08 /* MainToolbar+shared.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E882D22B59B01300BA5B08 /* MainToolbar+shared.swift */; };
        97E882D42B59B81B00BA5B08 /* MainToolbar+shared.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97E882D22B59B01300BA5B08 /* MainToolbar+shared.swift */; };
        97F91C4B2B8C07B900FBCF7A /* KeyEventBlocks.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C4A2B8C07B900FBCF7A /* KeyEventBlocks.swift */; };
        97F91C4C2B8C07B900FBCF7A /* KeyEventBlocks.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C4A2B8C07B900FBCF7A /* KeyEventBlocks.swift */; };
        97F91C4E2B8D2C0A00FBCF7A /* EditViewTextField.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C4D2B8D2C0A00FBCF7A /* EditViewTextField.swift */; };
        97F91C4F2B8D2C0A00FBCF7A /* EditViewTextField.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C4D2B8D2C0A00FBCF7A /* EditViewTextField.swift */; };
        97F91C512B8D375800FBCF7A /* EditViewTextFieldValidated.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C502B8D375800FBCF7A /* EditViewTextFieldValidated.swift */; };
        97F91C522B8D375800FBCF7A /* EditViewTextFieldValidated.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C502B8D375800FBCF7A /* EditViewTextFieldValidated.swift */; };
        97F91C552B8E8BBF00FBCF7A /* EditViewRange.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C542B8E8BBF00FBCF7A /* EditViewRange.swift */; };
        97F91C562B8E8BBF00FBCF7A /* EditViewRange.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97F91C542B8E8BBF00FBCF7A /* EditViewRange.swift */; };
/* End PBXBuildFile section */

/* Begin PBXContainerItemProxy section */
        97259028294A5DBE004310CD /* PBXContainerItemProxy */ = {
            isa = PBXContainerItemProxy;
            containerPortal = 9750236727DFE4C900D773B5 /* Project object */;
            proxyType = 1;
            remoteGlobalIDString = 9735F4C32947B83200DE1D7E;
            remoteInfo = MacOSAudiosaic;
        };
        976089FC2951433E00B0532C /* PBXContainerItemProxy */ = {
            isa = PBXContainerItemProxy;
            containerPortal = 9750236727DFE4C900D773B5 /* Project object */;
            proxyType = 1;
            remoteGlobalIDString = 9750236E27DFE4C900D773B5;
            remoteInfo = Audiosaic;
        };
        97608A062951448200B0532C /* PBXContainerItemProxy */ = {
            isa = PBXContainerItemProxy;
            containerPortal = 9750236727DFE4C900D773B5 /* Project object */;
            proxyType = 1;
            remoteGlobalIDString = 9750236E27DFE4C900D773B5;
            remoteInfo = Audiosaic;
        };
/* End PBXContainerItemProxy section */

/* Begin PBXFileReference section */
        97052E1F295012E8003DCE48 /* TestEventLogger.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TestEventLogger.swift; sourceTree = "<group>"; };
        9706889527ECF1790018BFF6 /* DragLocation.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DragLocation.swift; sourceTree = "<group>"; };
        9706889727ECF1A50018BFF6 /* Slider+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Slider+Extensions.swift"; sourceTree = "<group>"; };
        971130182B7366F70024BD81 /* AllAssetsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AllAssetsView.swift; sourceTree = "<group>"; };
        9711301A2B7368BA0024BD81 /* DefaultContextMenuItems.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DefaultContextMenuItems.swift; sourceTree = "<group>"; };
        9711301C2B7368D70024BD81 /* MainMenuContextMenuItems.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainMenuContextMenuItems.swift; sourceTree = "<group>"; };
        9711301E2B7368F40024BD81 /* MainViewSingleSelectionContextMenuItemView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewSingleSelectionContextMenuItemView.swift; sourceTree = "<group>"; };
        971130202B73690E0024BD81 /* MainViewMultiSelectionContextMenuItemView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewMultiSelectionContextMenuItemView.swift; sourceTree = "<group>"; };
        9718C8102B55EE07009CDA71 /* IOSToolbarManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = IOSToolbarManager.swift; sourceTree = "<group>"; };
        971C64792B4C950900C97731 /* AppInitializer.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppInitializer.swift; sourceTree = "<group>"; };
        971C647B2B4C951D00C97731 /* AppState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppState.swift; sourceTree = "<group>"; };
        971C64882B4DC27200C97731 /* Data+Image.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Data+Image.swift"; sourceTree = "<group>"; };
        971C648B2B4DC82400C97731 /* IcloudSync.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = IcloudSync.swift; sourceTree = "<group>"; };
        971C64942B4DDC2600C97731 /* Transitions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Transitions.swift; sourceTree = "<group>"; };
        971C649F2B4DDEEC00C97731 /* LoadingView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LoadingView.swift; sourceTree = "<group>"; };
        971C64A52B4DE3B700C97731 /* Alert.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Alert.swift; sourceTree = "<group>"; };
        971C64A62B4DE3B700C97731 /* ErrorViewModel.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ErrorViewModel.swift; sourceTree = "<group>"; };
        971C64A72B4DE3B700C97731 /* ErrorView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ErrorView.swift; sourceTree = "<group>"; };
        971C64A92B4DE3B700C97731 /* ImportViewModel.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ImportViewModel.swift; sourceTree = "<group>"; };
        971C64AA2B4DE3B700C97731 /* ImportView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ImportView.swift; sourceTree = "<group>"; };
        971C64AC2B4DE3B700C97731 /* IOToolbarElement.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = IOToolbarElement.swift; sourceTree = "<group>"; };
        971C64AD2B4DE3B700C97731 /* ToolbarManager+IOViews.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = "ToolbarManager+IOViews.swift"; sourceTree = "<group>"; };
        971C64AE2B4DE3B700C97731 /* ErrorManager.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ErrorManager.swift; sourceTree = "<group>"; };
        971C64C52B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = "MainToolbar+ToolbarManager.swift"; sourceTree = "<group>"; };
        971C64C62B4DE64A00C97731 /* MainToolbarElement.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = MainToolbarElement.swift; sourceTree = "<group>"; };
        971C64C72B4DE64A00C97731 /* TButton+Extensions.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = "TButton+Extensions.swift"; sourceTree = "<group>"; };
        971C64D12B4DE71800C97731 /* Colors.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Colors.swift; sourceTree = "<group>"; };
        971EDFC72B7579000059888A /* Catalog.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Catalog.swift; sourceTree = "<group>"; };
        971EDFCA2B757AF70059888A /* CatalogEntity.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CatalogEntity.swift; sourceTree = "<group>"; };
        971EDFCD2B757C230059888A /* Catalog+CoreDataStored.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Catalog+CoreDataStored.swift"; sourceTree = "<group>"; };
        971EDFD02B7581040059888A /* CatalogSettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = CatalogSettingsView.swift; sourceTree = "<group>"; };
        971EDFD32B75943A0059888A /* CatalogManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CatalogManager.swift; sourceTree = "<group>"; };
        971EDFD62B7A8E3D0059888A /* LockscreenSettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = LockscreenSettingsView.swift; sourceTree = "<group>"; };
        971EDFD92B7A919F0059888A /* MediaPlayerRemoteCommandCenter_Capability+RawRepresentable.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "MediaPlayerRemoteCommandCenter_Capability+RawRepresentable.swift"; sourceTree = "<group>"; };
        97259024294A5DBD004310CD /* UnitTests.xctest */ = {isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = UnitTests.xctest; sourceTree = BUILT_PRODUCTS_DIR; };
        9725902D294A71F9004310CD /* PlayerEvent.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlayerEvent.swift; sourceTree = "<group>"; };
        97259030294A92F2004310CD /* PlayerStateMachine.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlayerStateMachine.swift; sourceTree = "<group>"; };
        97259033294BC67C004310CD /* SessionStateTests.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SessionStateTests.swift; sourceTree = "<group>"; };
        97259051294BD5A2004310CD /* ResumableTimer.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ResumableTimer.swift; sourceTree = "<group>"; };
        97259054294D0560004310CD /* Assertions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Assertions.swift; sourceTree = "<group>"; };
        97259057294D057E004310CD /* MockTimer.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MockTimer.swift; sourceTree = "<group>"; };
        97259059294D05DC004310CD /* Transition.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Transition.swift; sourceTree = "<group>"; };
        9725905C294E9C6F004310CD /* ProvisionallyPlayingSM.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProvisionallyPlayingSM.swift; sourceTree = "<group>"; };
        97259068294FDCC9004310CD /* ProvisionallyPlayingSMTests.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProvisionallyPlayingSMTests.swift; sourceTree = "<group>"; };
        9725906A294FDFFF004310CD /* Logging.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Logging.swift; sourceTree = "<group>"; };
        972B405B2B896D1E00F0118C /* BookmarksView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarksView.swift; sourceTree = "<group>"; };
        972B405E2B896EC000F0118C /* BookmarksWindowView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarksWindowView.swift; sourceTree = "<group>"; };
        972B40612B896F3D00F0118C /* BookmarksSheet.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarksSheet.swift; sourceTree = "<group>"; };
        972B40632B899FB500F0118C /* BookmarkView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarkView.swift; sourceTree = "<group>"; };
        972B40672B89A09E00F0118C /* BookmarksViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarksViewModel.swift; sourceTree = "<group>"; };
        972B406A2B89A0CF00F0118C /* BookmarkViewData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarkViewData.swift; sourceTree = "<group>"; };
        972B406C2B89A0DF00F0118C /* GroupedBookmarkViewData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = GroupedBookmarkViewData.swift; sourceTree = "<group>"; };
        972B40712B89A34900F0118C /* ListRowDateHeaderComponentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ListRowDateHeaderComponentView.swift; sourceTree = "<group>"; };
        972B40742B89CF3E00F0118C /* HapticsSettingsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HapticsSettingsView.swift; sourceTree = "<group>"; };
        972B40762B8AAA1700F0118C /* HapticItem.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HapticItem.swift; sourceTree = "<group>"; };
        97328C612B7ECE7B001AA422 /* Alerts.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Alerts.swift; sourceTree = "<group>"; };
        97328C6C2B8400AB001AA422 /* PlaybackEventEntity.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaybackEventEntity.swift; sourceTree = "<group>"; };
        97328C6F2B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "PlaybackEventEntity+CoreDataStored.swift"; sourceTree = "<group>"; };
        97328C722B8401F3001AA422 /* PlaybackEvent.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaybackEvent.swift; sourceTree = "<group>"; };
        97328C752B840881001AA422 /* EventHistoryManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventHistoryManager.swift; sourceTree = "<group>"; };
        97328C782B8515B5001AA422 /* HistorySettingsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HistorySettingsView.swift; sourceTree = "<group>"; };
        97328C7B2B8548A9001AA422 /* StateRestorationManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = StateRestorationManager.swift; sourceTree = "<group>"; };
        97328C7E2B857B4E001AA422 /* HistorySheet.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HistorySheet.swift; sourceTree = "<group>"; };
        97356D5A2B72F60500FEB860 /* AudioAssetImageView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioAssetImageView.swift; sourceTree = "<group>"; };
        97356D5D2B72F61C00FEB860 /* GroupImageView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = GroupImageView.swift; sourceTree = "<group>"; };
        97356D602B7300D100FEB860 /* ArtworkView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ArtworkView.swift; sourceTree = "<group>"; };
        9735F4B22945D0DA00DE1D7E /* AudioEditor.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioEditor.swift; sourceTree = "<group>"; };
        9735F4B4294663BB00DE1D7E /* AvAudioPlayer+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AvAudioPlayer+Extensions.swift"; sourceTree = "<group>"; };
        9735F4B62946932F00DE1D7E /* PlaybackManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaybackManager.swift; sourceTree = "<group>"; };
        9735F4B92946DA7900DE1D7E /* AudioPlayerProgress.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioPlayerProgress.swift; sourceTree = "<group>"; };
        9735F4BB2946DA8700DE1D7E /* AudioPlayerState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioPlayerState.swift; sourceTree = "<group>"; };
        9735F4BF29473F6200DE1D7E /* Audiosaic.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = Audiosaic.entitlements; sourceTree = "<group>"; };
        9735F4C42947B83200DE1D7E /* Audiosaic Desktop.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = "Audiosaic Desktop.app"; sourceTree = BUILT_PRODUCTS_DIR; };
        9735F4C62947B83300DE1D7E /* MacOSAudiosaicApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MacOSAudiosaicApp.swift; sourceTree = "<group>"; };
        9735F4C82947B83300DE1D7E /* AllAssetsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AllAssetsView.swift; sourceTree = "<group>"; };
        9735F4CA2947B83400DE1D7E /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
        9735F4CD2947B83400DE1D7E /* Preview Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = "Preview Assets.xcassets"; sourceTree = "<group>"; };
        9735F4CF2947B83400DE1D7E /* MacOSAudiosaic.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = MacOSAudiosaic.entitlements; sourceTree = "<group>"; };
        9735F4EE2947F1C600DE1D7E /* DownloadObserver.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DownloadObserver.swift; sourceTree = "<group>"; };
        9735F4F429483E2900DE1D7E /* AudioAssetListItemView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioAssetListItemView.swift; sourceTree = "<group>"; };
        9735F5102948483800DE1D7E /* CircularProgressView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CircularProgressView.swift; sourceTree = "<group>"; };
        9735F5152949191600DE1D7E /* AssetState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AssetState.swift; sourceTree = "<group>"; };
        9735F5192949194300DE1D7E /* AudioAssetListViewData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioAssetListViewData.swift; sourceTree = "<group>"; };
        9735F51E29491A5800DE1D7E /* ProgressViewData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProgressViewData.swift; sourceTree = "<group>"; };
        9735F52329491B4500DE1D7E /* DocumentPicker.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DocumentPicker.swift; sourceTree = "<group>"; };
        9735F52529491BE300DE1D7E /* Colors.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Colors.xcassets; sourceTree = "<group>"; };
        9739A3272BA5711E0018CCDF /* EnvironmentKeys.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EnvironmentKeys.swift; sourceTree = "<group>"; };
        973BD0B62B67060600F9EE9E /* PlaybackRecordEntity.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = PlaybackRecordEntity.swift; sourceTree = "<group>"; };
        973BD0C62B6708B000F9EE9E /* AudioFileDataModelFactory.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioFileDataModelFactory.swift; sourceTree = "<group>"; };
        973BD0C92B68196400F9EE9E /* AudioAssetContentStore.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioAssetContentStore.swift; sourceTree = "<group>"; };
        97480C612B96B80B002DE830 /* SettingsPickerElement.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsPickerElement.swift; sourceTree = "<group>"; };
        97480C642B96B9C5002DE830 /* Settings_Previews.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Settings_Previews.swift; sourceTree = "<group>"; };
        97480C672B96C37F002DE830 /* ButtonPicker.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ButtonPicker.swift; sourceTree = "<group>"; };
        97480C6A2B96F4F9002DE830 /* AppDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppDelegate.swift; sourceTree = "<group>"; };
        97480C6D2B97A461002DE830 /* KeyPressManager+Combine.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "KeyPressManager+Combine.swift"; sourceTree = "<group>"; };
        97480C702B97A781002DE830 /* AVAudioSession+Combine.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AVAudioSession+Combine.swift"; sourceTree = "<group>"; };
        97480C732B97AECF002DE830 /* PlaybackManager+iOS.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "PlaybackManager+iOS.swift"; sourceTree = "<group>"; };
        9750236F27DFE4C900D773B5 /* Audiosaic.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = Audiosaic.app; sourceTree = BUILT_PRODUCTS_DIR; };
        9750237227DFE4C900D773B5 /* AudiosaicApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudiosaicApp.swift; sourceTree = "<group>"; };
        9750237427DFE4C900D773B5 /* MainView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainView.swift; sourceTree = "<group>"; };
        9750237627DFE4CA00D773B5 /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
        9750237927DFE4CA00D773B5 /* Preview Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = "Preview Assets.xcassets"; sourceTree = "<group>"; };
        9750238027DFF08300D773B5 /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist; path = Info.plist; sourceTree = "<group>"; };
        9750238127E084EB00D773B5 /* MusicPlayerView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MusicPlayerView.swift; sourceTree = "<group>"; };
        9750238327E137F000D773B5 /* DocumentPicker.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DocumentPicker.swift; sourceTree = "<group>"; };
        9750238527E1380A00D773B5 /* FileReader.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = FileReader.swift; sourceTree = "<group>"; };
        9750238927E1389E00D773B5 /* MainViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewModel.swift; sourceTree = "<group>"; };
        9750238B27E14A9100D773B5 /* MusicPlayerViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MusicPlayerViewModel.swift; sourceTree = "<group>"; };
        9750238D27E14AB900D773B5 /* SongData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SongData.swift; sourceTree = "<group>"; };
        9750239127E14B7700D773B5 /* URL+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "URL+Extensions.swift"; sourceTree = "<group>"; };
        9750239727E1A60500D773B5 /* AudioFileManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioFileManager.swift; sourceTree = "<group>"; };
        9750239927E1A62900D773B5 /* AudioFileEntity.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioFileEntity.swift; sourceTree = "<group>"; };
        9750239C27E1A64F00D773B5 /* AudioAsset.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioAsset.swift; sourceTree = "<group>"; };
        9750239E27E1A67F00D773B5 /* AudioAsset+CoreDataStored.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AudioAsset+CoreDataStored.swift"; sourceTree = "<group>"; };
        975023A027E1A69300D773B5 /* Const.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Const.swift; sourceTree = "<group>"; };
        975023A527E1A71700D773B5 /* AVAudioSession+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AVAudioSession+Extensions.swift"; sourceTree = "<group>"; };
        975023A727E24C2800D773B5 /* MediaPlayerManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MediaPlayerManager.swift; sourceTree = "<group>"; };
        975058E32B57705D00BA6917 /* EventHistoryCommandsViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventHistoryCommandsViewModel.swift; sourceTree = "<group>"; };
        975058E72B5771B100BA6917 /* WindowForegroundObserver.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = WindowForegroundObserver.swift; sourceTree = "<group>"; };
        975058EA2B57D39500BA6917 /* ImportSettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ImportSettingsView.swift; sourceTree = "<group>"; };
        975058ED2B58417A00BA6917 /* AudioAsset+Preview.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AudioAsset+Preview.swift"; sourceTree = "<group>"; };
        975058F02B5848C100BA6917 /* SortView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SortView.swift; sourceTree = "<group>"; };
        975058FC2B586DA400BA6917 /* Import+Errors.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Import+Errors.swift"; sourceTree = "<group>"; };
        975058FF2B587ECE00BA6917 /* MergeProgressView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MergeProgressView.swift; sourceTree = "<group>"; };
        975059022B588B1D00BA6917 /* PlaybackSettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = PlaybackSettingsView.swift; sourceTree = "<group>"; };
        975134542B51D6ED0018A62A /* EditView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditView.swift; sourceTree = "<group>"; };
        975134572B51D7150018A62A /* AudioTrackEditManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioTrackEditManager.swift; sourceTree = "<group>"; };
        9751345A2B51E1630018A62A /* URLSchemes.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = URLSchemes.swift; sourceTree = "<group>"; };
        9751345D2B51E3120018A62A /* DeepLinkManager.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = DeepLinkManager.swift; sourceTree = "<group>"; };
        975134612B51E3EA0018A62A /* URLAudiosaicAction.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = URLAudiosaicAction.swift; sourceTree = "<group>"; };
        9751346A2B5252070018A62A /* DevCommands.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DevCommands.swift; sourceTree = "<group>"; };
        9751346D2B5253AD0018A62A /* DebugScreen.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = DebugScreen.swift; sourceTree = "<group>"; };
        975134702B534BF30018A62A /* EditAlbumCoverView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditAlbumCoverView.swift; sourceTree = "<group>"; };
        975134732B548C7E0018A62A /* Table+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Table+Extensions.swift"; sourceTree = "<group>"; };
        975134762B5497960018A62A /* AssetSelectionManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AssetSelectionManager.swift; sourceTree = "<group>"; };
        975134842B54D6AB0018A62A /* MetadataSettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = MetadataSettingsView.swift; sourceTree = "<group>"; };
        975134872B54DC4D0018A62A /* MetadataManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MetadataManager.swift; sourceTree = "<group>"; };
        9751348D2B54FDC60018A62A /* WindowForegroundManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = WindowForegroundManager.swift; sourceTree = "<group>"; };
        97579E572B990B1800843C77 /* Preview+Utility.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Preview+Utility.swift"; sourceTree = "<group>"; };
        97579E5A2B99848200843C77 /* SettingsDurationPicker.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsDurationPicker.swift; sourceTree = "<group>"; };
        97579E612B9A8E7500843C77 /* DropManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DropManager.swift; sourceTree = "<group>"; };
        975BF6742B7C1E4A0061D332 /* EditGroupViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditGroupViewModel.swift; sourceTree = "<group>"; };
        975BF6772B7C31000061D332 /* HardRefreshManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HardRefreshManager.swift; sourceTree = "<group>"; };
        975BF67A2B7C31B80061D332 /* ImageAssetManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ImageAssetManager.swift; sourceTree = "<group>"; };
        975BF67D2B7C525D0061D332 /* CatalogsMenuView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CatalogsMenuView.swift; sourceTree = "<group>"; };
        975D9F532B7D82E300473CA9 /* AlertManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AlertManager.swift; sourceTree = "<group>"; };
        975D9F562B7EC43B00473CA9 /* View+Alert.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "View+Alert.swift"; sourceTree = "<group>"; };
        975D9F5A2B7EC47E00473CA9 /* CreateCatalogAlert.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CreateCatalogAlert.swift; sourceTree = "<group>"; };
        975D9F5D2B7ECBC100473CA9 /* RenameCatalogAlertView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RenameCatalogAlertView.swift; sourceTree = "<group>"; };
        97608A022951448200B0532C /* IosUnitTests.xctest */ = {isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = IosUnitTests.xctest; sourceTree = BUILT_PRODUCTS_DIR; };
        9763082E2B86B58F006D7622 /* AssetBookmark.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AssetBookmark.swift; sourceTree = "<group>"; };
        976308312B86BB67006D7622 /* BookmarkManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarkManager.swift; sourceTree = "<group>"; };
        976308342B86C1CF006D7622 /* AssetBookmarkEntity.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AssetBookmarkEntity.swift; sourceTree = "<group>"; };
        976308372B86C234006D7622 /* AssetBookmark+CoreDataStored.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AssetBookmark+CoreDataStored.swift"; sourceTree = "<group>"; };
        9763083A2B88619A006D7622 /* AppleDevice.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppleDevice.swift; sourceTree = "<group>"; };
        9763083D2B8910F1006D7622 /* KeyPathComparators.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = KeyPathComparators.swift; sourceTree = "<group>"; };
        976308402B89157C006D7622 /* EventHistoryViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventHistoryViewModel.swift; sourceTree = "<group>"; };
        976308442B8915AF006D7622 /* EventViewData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventViewData.swift; sourceTree = "<group>"; };
        976308472B8915BF006D7622 /* GroupedEventViewData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = GroupedEventViewData.swift; sourceTree = "<group>"; };
        9763084A2B892646006D7622 /* HistoryEventView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HistoryEventView.swift; sourceTree = "<group>"; };
        9763084E2B8928F0006D7622 /* HistoryEventView+Previews.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "HistoryEventView+Previews.swift"; sourceTree = "<group>"; };
        9767ADBF2BA20D6A00449AB9 /* ChapterNavigator.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ChapterNavigator.swift; sourceTree = "<group>"; };
        9767ADC62BA2362B00449AB9 /* ChapterNavigatorPicker.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ChapterNavigatorPicker.swift; sourceTree = "<group>"; };
        9767ADCA2BA2444600449AB9 /* PlayButton.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlayButton.swift; sourceTree = "<group>"; };
        9767ADCE2BA24B1A00449AB9 /* SetTimerMenu.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SetTimerMenu.swift; sourceTree = "<group>"; };
        9767ADD12BA2506400449AB9 /* TimedPlaybackManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TimedPlaybackManager.swift; sourceTree = "<group>"; };
        9767ADD52BA2509D00449AB9 /* TimedPlaybackData.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TimedPlaybackData.swift; sourceTree = "<group>"; };
        9767ADD82BA250BB00449AB9 /* TimerDataView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TimerDataView.swift; sourceTree = "<group>"; };
        9767ADDB2BA37D1A00449AB9 /* TimeRounding.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TimeRounding.swift; sourceTree = "<group>"; };
        9767ADF92BA3A44700449AB9 /* SubscribedText.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SubscribedText.swift; sourceTree = "<group>"; };
        976C1CDC2B44C70900E2BF19 /* GeneralDebugging.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = GeneralDebugging.swift; sourceTree = "<group>"; };
        977251C42B589DAA00DE66FE /* AudioTrackEditSheet.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioTrackEditSheet.swift; sourceTree = "<group>"; };
        9778F4DC2B4F2AD50028BB53 /* EventHistoryWindowView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventHistoryWindowView.swift; sourceTree = "<group>"; };
        9778F4DE2B4F2AF70028BB53 /* EventHistoryView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventHistoryView.swift; sourceTree = "<group>"; };
        9778F4E32B4F2B700028BB53 /* Windows.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Windows.swift; sourceTree = "<group>"; };
        9778F4ED2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudiosaicPreferenceKey.swift; sourceTree = "<group>"; };
        9778F4F02B4F385E0028BB53 /* PreferredColorScheme.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PreferredColorScheme.swift; sourceTree = "<group>"; };
        9778F5062B4F4C4E0028BB53 /* AudiosaicSettingsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudiosaicSettingsView.swift; sourceTree = "<group>"; };
        9778F5092B4F4C8B0028BB53 /* AudiosaicSettingsViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudiosaicSettingsViewModel.swift; sourceTree = "<group>"; };
        9778F50C2B4F4CBC0028BB53 /* AudiosaicSettingsPath.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudiosaicSettingsPath.swift; sourceTree = "<group>"; };
        9778F50F2B4F4D8B0028BB53 /* GeneralSettingsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = GeneralSettingsView.swift; sourceTree = "<group>"; };
        9778F5112B4F4EA00028BB53 /* AppearanceSettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AppearanceSettingsView.swift; sourceTree = "<group>"; };
        9778F5192B4F58ED0028BB53 /* PlayerEventLogger.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlayerEventLogger.swift; sourceTree = "<group>"; };
        9778F51C2B4F5A2F0028BB53 /* UIImage+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "UIImage+Extensions.swift"; sourceTree = "<group>"; };
        9778F5202B4F5C200028BB53 /* Formatters.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Formatters.swift; sourceTree = "<group>"; };
        9778F5242B4F609E0028BB53 /* PlaybackStateProtocol.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaybackStateProtocol.swift; sourceTree = "<group>"; };
        9778F5272B4F61460028BB53 /* StateMachine.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = StateMachine.swift; sourceTree = "<group>"; };
        9778F52B2B4F618F0028BB53 /* FrameType.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = FrameType.swift; sourceTree = "<group>"; };
        9778F52E2B4F61E80028BB53 /* SMFrame.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SMFrame.swift; sourceTree = "<group>"; };
        9778F5312B4F62320028BB53 /* SessionStateMachine+Debug.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "SessionStateMachine+Debug.swift"; sourceTree = "<group>"; };
        9778F5352B4F675B0028BB53 /* SessionStack.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SessionStack.swift; sourceTree = "<group>"; };
        9778F5382B4FC7D20028BB53 /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist; path = Info.plist; sourceTree = "<group>"; };
        9778F5472B4FCD8F0028BB53 /* GoogleService-Info.plist */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.xml; name = "GoogleService-Info.plist"; path = "Shared/GoogleService-Info.plist"; sourceTree = "<group>"; };
        9778F54A2B506C750028BB53 /* AVAudioPlayerType.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AVAudioPlayerType.swift; sourceTree = "<group>"; };
        9778F54D2B506CA70028BB53 /* AVPlayerBuilder.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AVPlayerBuilder.swift; sourceTree = "<group>"; };
        9778F5512B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AVAudioPlayer+AVAudioPlayerType.swift"; sourceTree = "<group>"; };
        9778F5542B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AVdelegateAVAudioPlayerDelegate.swift; sourceTree = "<group>"; };
        9778F5572B506E5F0028BB53 /* AudioPlayerDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioPlayerDelegate.swift; sourceTree = "<group>"; };
        978196722B50A5A100C3FF82 /* PlaybackRecord.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaybackRecord.swift; sourceTree = "<group>"; };
        978196752B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "PlaybackRecord+CoreDataStored.swift"; sourceTree = "<group>"; };
        9781967E2B51ADEA00C3FF82 /* AudioTrackEditView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AudioTrackEditView.swift; sourceTree = "<group>"; };
        97831D8F2B9F927500C4BBE7 /* Sequence+Extensions.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = "Sequence+Extensions.swift"; sourceTree = "<group>"; };
        97831D922B9FB17000C4BBE7 /* NSDomainError+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "NSDomainError+Extensions.swift"; sourceTree = "<group>"; };
        97831D952BA0171F00C4BBE7 /* MultiEditRangeValue.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MultiEditRangeValue.swift; sourceTree = "<group>"; };
        97831D982BA0F1FC00C4BBE7 /* Chapter.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Chapter.swift; sourceTree = "<group>"; };
        97831D9B2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AVAsset+Extensions.swift"; sourceTree = "<group>"; };
        97831D9F2BA0F93A00C4BBE7 /* ChapterEntity.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ChapterEntity.swift; sourceTree = "<group>"; };
        97831DA22BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Double+NanEncodedOptional.swift"; sourceTree = "<group>"; };
        97831DA52BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "ChapterEntity+CoreDataStored.swift"; sourceTree = "<group>"; };
        97A443622B51BF9D00983906 /* AudioTrackEditWindowView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AudioTrackEditWindowView.swift; sourceTree = "<group>"; };
        97A4FEAA2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Mpeg4AudioSharedAsset.swift; sourceTree = "<group>"; };
        97A4FEAD2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "AudioAssetListViewData+shared.swift"; sourceTree = "<group>"; };
        97A4FEB02B59EA5500F25DF6 /* Mp3SharedAsset.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Mp3SharedAsset.swift; sourceTree = "<group>"; };
        97AEBE692BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RecentTimedPlaybackEventsStore.swift; sourceTree = "<group>"; };
        97AEBE6C2BA43D3000B1C867 /* BookmarkMenuElementView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BookmarkMenuElementView.swift; sourceTree = "<group>"; };
        97AEBE6F2BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaybackSpeedToggleButton.swift; sourceTree = "<group>"; };
        97AEBE722BA4B88200B1C867 /* View+AlertWithTextField.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "View+AlertWithTextField.swift"; sourceTree = "<group>"; };
        97B651142BAB67D100605D44 /* TagManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TagManager.swift; sourceTree = "<group>"; };
        97B651162BAB67E500605D44 /* Tag.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Tag.swift; sourceTree = "<group>"; };
        97B651192BAB681A00605D44 /* AddMenuView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AddMenuView.swift; sourceTree = "<group>"; };
        97B6511B2BAB683100605D44 /* TagsMenuView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TagsMenuView.swift; sourceTree = "<group>"; };
        97B651212BAB6FE400605D44 /* CreateTagAlert.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = CreateTagAlert.swift; sourceTree = "<group>"; };
        97B651242BAB7DAC00605D44 /* TagEntity.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = TagEntity.swift; sourceTree = "<group>"; };
        97B651272BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = "TagEntity+CoreDataStored.swift"; sourceTree = "<group>"; };
        97B6512A2BABA17600605D44 /* ContextProvider.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContextProvider.swift; sourceTree = "<group>"; };
        97B6512E2BABA91500605D44 /* ContextMonad.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContextMonad.swift; sourceTree = "<group>"; };
        97B651312BABA92500605D44 /* ContextContainer.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContextContainer.swift; sourceTree = "<group>"; };
        97B8A2FD2B6C4F090097D232 /* MainMenuContextMenuItems.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainMenuContextMenuItems.swift; sourceTree = "<group>"; };
        97B8A2FF2B6C4FF70097D232 /* MainView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainView.swift; sourceTree = "<group>"; };
        97B8A3022B6C854A0097D232 /* KeyPathComparator+String.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "KeyPathComparator+String.swift"; sourceTree = "<group>"; };
        97B8A3052B6C87480097D232 /* MainViewModel+Import.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "MainViewModel+Import.swift"; sourceTree = "<group>"; };
        97B8A3082B6C88900097D232 /* MainViewModel+iOS.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "MainViewModel+iOS.swift"; sourceTree = "<group>"; };
        97C6333A2BA7AD7A005DE243 /* PlaylistManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaylistManager.swift; sourceTree = "<group>"; };
        97C6333E2BA8AB6A005DE243 /* MoveToMenuView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MoveToMenuView.swift; sourceTree = "<group>"; };
        97C633412BA8AC16005DE243 /* PlaylistsMenuView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaylistsMenuView.swift; sourceTree = "<group>"; };
        97C633482BA8AF81005DE243 /* PlaylistElement.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaylistElement.swift; sourceTree = "<group>"; };
        97C6334B2BA8AF92005DE243 /* AssetlPlaylistElement.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AssetlPlaylistElement.swift; sourceTree = "<group>"; };
        97C6334E2BA8AFA2005DE243 /* PlaylistType.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlaylistType.swift; sourceTree = "<group>"; };
        97C633512BA8AFB4005DE243 /* Playlist.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Playlist.swift; sourceTree = "<group>"; };
        97C633542BA8AFE4005DE243 /* ManualPlaylist.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ManualPlaylist.swift; sourceTree = "<group>"; };
        97C633572BA8AFF4005DE243 /* SmartPlaylistRule.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SmartPlaylistRule.swift; sourceTree = "<group>"; };
        97C6335A2BA8B004005DE243 /* SmartPlaylist.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SmartPlaylist.swift; sourceTree = "<group>"; };
        97C6335F2BA8B021005DE243 /* Podcast.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Podcast.swift; sourceTree = "<group>"; };
        97D42A6127E586C300D945D0 /* NowPlayingInfo.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = NowPlayingInfo.swift; sourceTree = "<group>"; };
        97D42A7D27E866B600D945D0 /* Slider.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Slider.swift; sourceTree = "<group>"; };
        97D98C8D2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "ProvisionallyPlayingSM+DebugTesting.swift"; sourceTree = "<group>"; };
        97DE91AC2B6EEAB7003D20E8 /* ImportMethod.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ImportMethod.swift; sourceTree = "<group>"; };
        97DE91B02B6EEF2F003D20E8 /* MainViewSingleSelectionContextMenu.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewSingleSelectionContextMenu.swift; sourceTree = "<group>"; };
        97DE91B32B6EF098003D20E8 /* MainViewMultiSelectionContextMenu.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewMultiSelectionContextMenu.swift; sourceTree = "<group>"; };
        97DE91B72B6EF1BD003D20E8 /* MainViewImageView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewImageView.swift; sourceTree = "<group>"; };
        97DE91BA2B6F64F1003D20E8 /* MainViewKeyPaths.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainViewKeyPaths.swift; sourceTree = "<group>"; };
        97E718522B8FA5D90011D43C /* InitializationState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = InitializationState.swift; sourceTree = "<group>"; };
        97E718552B8FA8290011D43C /* AppErrorView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppErrorView.swift; sourceTree = "<group>"; };
        97E718582B8FB9860011D43C /* Primitives+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Primitives+Extensions.swift"; sourceTree = "<group>"; };
        97E7185B2B8FB9CD0011D43C /* Array+Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Array+Extensions.swift"; sourceTree = "<group>"; };
        97E7185F2B8FD1870011D43C /* EditViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewModel.swift; sourceTree = "<group>"; };
        97E718622B8FDA960011D43C /* EditViewElement.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewElement.swift; sourceTree = "<group>"; };
        97E718652B8FDC690011D43C /* SmartEditOption.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SmartEditOption.swift; sourceTree = "<group>"; };
        97E718682B90F47D0011D43C /* View+Sheet.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "View+Sheet.swift"; sourceTree = "<group>"; };
        97E7186B2B9102310011D43C /* View+if.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "View+if.swift"; sourceTree = "<group>"; };
        97E7186F2B9111360011D43C /* RegularExpressionSheetView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RegularExpressionSheetView.swift; sourceTree = "<group>"; };
        97E718732B9111540011D43C /* ReHelper.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ReHelper.swift; sourceTree = "<group>"; };
        97E718762B91116B0011D43C /* RegularExpressionAlertViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RegularExpressionAlertViewModel.swift; sourceTree = "<group>"; };
        97E7187B2B912EFB0011D43C /* EditTests.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditTests.swift; sourceTree = "<group>"; };
        97E7187E2B91584E0011D43C /* EditViewTextFieldViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewTextFieldViewModel.swift; sourceTree = "<group>"; };
        97E718802B91586E0011D43C /* EditSheets.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditSheets.swift; sourceTree = "<group>"; };
        97E718862B9249540011D43C /* EditViewTextFieldMenu.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewTextFieldMenu.swift; sourceTree = "<group>"; };
        97E7188C2B92690D0011D43C /* MultiEditValue.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MultiEditValue.swift; sourceTree = "<group>"; };
        97E718932B9294090011D43C /* AccessoryBarlikeButton.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AccessoryBarlikeButton.swift; sourceTree = "<group>"; };
        97E718962B94464C0011D43C /* Array+AudioAsset.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Array+AudioAsset.swift"; sourceTree = "<group>"; };
        97E718992B9543630011D43C /* PlainTextReValue.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PlainTextReValue.swift; sourceTree = "<group>"; };
        97E7189D2B9673A20011D43C /* SettingsButton.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsButton.swift; sourceTree = "<group>"; };
        97E7189F2B9673B50011D43C /* SettingsLabel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsLabel.swift; sourceTree = "<group>"; };
        97E718A32B9673EC0011D43C /* URLs.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = URLs.swift; sourceTree = "<group>"; };
        97E718A52B9674080011D43C /* Settings+AppVersion.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "Settings+AppVersion.swift"; sourceTree = "<group>"; };
        97E718A92B9674EB0011D43C /* SettingsToggle.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsToggle.swift; sourceTree = "<group>"; };
        97E882CC2B59952D00BA5B08 /* MainToolbar+iOS.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "MainToolbar+iOS.swift"; sourceTree = "<group>"; };
        97E882CF2B59956100BA5B08 /* MainToolbar+macOS.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "MainToolbar+macOS.swift"; sourceTree = "<group>"; };
        97E882D22B59B01300BA5B08 /* MainToolbar+shared.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = "MainToolbar+shared.swift"; sourceTree = "<group>"; };
        97F91C4A2B8C07B900FBCF7A /* KeyEventBlocks.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = KeyEventBlocks.swift; sourceTree = "<group>"; };
        97F91C4D2B8D2C0A00FBCF7A /* EditViewTextField.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewTextField.swift; sourceTree = "<group>"; };
        97F91C502B8D375800FBCF7A /* EditViewTextFieldValidated.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewTextFieldValidated.swift; sourceTree = "<group>"; };
        97F91C542B8E8BBF00FBCF7A /* EditViewRange.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EditViewRange.swift; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
        97259021294A5DBD004310CD /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        9735F4C12947B83200DE1D7E /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
                971C64822B4C97B100C97731 /* KeyPressEventManager in Frameworks */,
                9781967A2B50FD6C00C3FF82 /* CoreDataStored in Frameworks */,
                97579E602B9A61CF00843C77 /* CoreDataStored in Frameworks */,
                976C1CDA2B422BC400E2BF19 /* AppRoving in Frameworks */,
                975134662B52114F0018A62A /* ID3TagEditor in Frameworks */,
                97B8A2FC2B6C31930097D232 /* NestedTable in Frameworks */,
                975058E02B5667F500BA6917 /* FileUrlExtensions in Frameworks */,
                971C646E2B4C8F3800C97731 /* LoadableView in Frameworks */,
                972B409A2B8B35BB00F0118C /* ProgrammaticCoreData in Frameworks */,
                9778F5152B4F50880028BB53 /* SwiftUISettings in Frameworks */,
                971C649D2B4DDE8500C97731 /* LoadingManager in Frameworks */,
                9778F4DA2B4F28B60028BB53 /* WindowManager in Frameworks */,
                971C64C12B4DE41000C97731 /* ToolbarManager in Frameworks */,
                9778F5412B4FC9C40028BB53 /* FirebaseCrashlytics in Frameworks */,
                9778F4EC2B4F36E80028BB53 /* UserPreferences in Frameworks */,
                9778F53F2B4FC9C40028BB53 /* FirebaseAnalytics in Frameworks */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        9750236C27DFE4C900D773B5 /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
                9778F53B2B4FC9AD0028BB53 /* FirebaseAnalytics in Frameworks */,
                975134682B52115D0018A62A /* ID3TagEditor in Frameworks */,
                971C64842B4C97C400C97731 /* KeyPressEventManager in Frameworks */,
                972B40982B8B359500F0118C /* ProgrammaticCoreData in Frameworks */,
                976C1CE02B44C73A00E2BF19 /* AppRoving in Frameworks */,
                9778F4EA2B4F36E00028BB53 /* UserPreferences in Frameworks */,
                971C64702B4C8F4500C97731 /* LoadableView in Frameworks */,
                9778F53D2B4FC9AD0028BB53 /* FirebaseCrashlytics in Frameworks */,
                971130162B7363420024BD81 /* NestedTable in Frameworks */,
                971C649B2B4DDE7C00C97731 /* LoadingManager in Frameworks */,
                9781967C2B5128CC00C3FF82 /* CoreDataStored in Frameworks */,
                971C64C32B4DE41800C97731 /* ToolbarManager in Frameworks */,
                975058E22B5667FE00BA6917 /* FileUrlExtensions in Frameworks */,
                97579E5E2B9A61C200843C77 /* CoreDataStored in Frameworks */,
                975058F42B584BC500BA6917 /* SwiftUISettings in Frameworks */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        976089FF2951448200B0532C /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
        9706889427ECF1690018BFF6 /* Slider */ = {
            isa = PBXGroup;
            children = (
                97D42A7D27E866B600D945D0 /* Slider.swift */,
                9706889527ECF1790018BFF6 /* DragLocation.swift */,
                9706889727ECF1A50018BFF6 /* Slider+Extensions.swift */,
            );
            path = Slider;
            sourceTree = "<group>";
        };
        971130222B7369AB0024BD81 /* MainViewContextMenu */ = {
            isa = PBXGroup;
            children = (
                9711301A2B7368BA0024BD81 /* DefaultContextMenuItems.swift */,
                9711301C2B7368D70024BD81 /* MainMenuContextMenuItems.swift */,
                9711301E2B7368F40024BD81 /* MainViewSingleSelectionContextMenuItemView.swift */,
                971130202B73690E0024BD81 /* MainViewMultiSelectionContextMenuItemView.swift */,
            );
            path = MainViewContextMenu;
            sourceTree = "<group>";
        };
        9718C80F2B55E1C3009CDA71 /* MainView */ = {
            isa = PBXGroup;
            children = (
                9750237427DFE4C900D773B5 /* MainView.swift */,
                971130222B7369AB0024BD81 /* MainViewContextMenu */,
                9735F4F329483E0500DE1D7E /* AudioAssetListItemView */,
            );
            path = MainView;
            sourceTree = "<group>";
        };
        971C64852B4C989400C97731 /* Initialization */ = {
            isa = PBXGroup;
            children = (
                971C64792B4C950900C97731 /* AppInitializer.swift */,
                971C647B2B4C951D00C97731 /* AppState.swift */,
                97E718522B8FA5D90011D43C /* InitializationState.swift */,
                9778F4ED2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift */,
                9778F4F02B4F385E0028BB53 /* PreferredColorScheme.swift */,
                97E718552B8FA8290011D43C /* AppErrorView.swift */,
                9739A3272BA5711E0018CCDF /* EnvironmentKeys.swift */,
            );
            path = Initialization;
            sourceTree = "<group>";
        };
        971C648D2B4DCE9B00C97731 /* Managers */ = {
            isa = PBXGroup;
            children = (
                9735F4B82946DA6600DE1D7E /* PlaybackManager */,
                9778F5232B4F5CEC0028BB53 /* StateMachines */,
                971C648B2B4DC82400C97731 /* IcloudSync.swift */,
                9750238527E1380A00D773B5 /* FileReader.swift */,
                9778F5192B4F58ED0028BB53 /* PlayerEventLogger.swift */,
                975134572B51D7150018A62A /* AudioTrackEditManager.swift */,
                9750239727E1A60500D773B5 /* AudioFileManager.swift */,
                9751345D2B51E3120018A62A /* DeepLinkManager.swift */,
                975134762B5497960018A62A /* AssetSelectionManager.swift */,
                975134872B54DC4D0018A62A /* MetadataManager.swift */,
                975058E62B5771A400BA6917 /* WindowForegroundManager */,
                9718C8102B55EE07009CDA71 /* IOSToolbarManager.swift */,
                973BD0C92B68196400F9EE9E /* AudioAssetContentStore.swift */,
                971EDFD32B75943A0059888A /* CatalogManager.swift */,
                975BF6772B7C31000061D332 /* HardRefreshManager.swift */,
                975BF67A2B7C31B80061D332 /* ImageAssetManager.swift */,
                97328C752B840881001AA422 /* EventHistoryManager.swift */,
                97328C7B2B8548A9001AA422 /* StateRestorationManager.swift */,
                976308312B86BB67006D7622 /* BookmarkManager.swift */,
                97579E612B9A8E7500843C77 /* DropManager.swift */,
                97B651132BAB67C600605D44 /* TagManager */,
                97C633442BA8AF59005DE243 /* PlaylistManager */,
                9767ADD42BA2507E00449AB9 /* TimedPlaybackManager */,
                97328C602B7ECE71001AA422 /* AlertManager */,
            );
            path = Managers;
            sourceTree = "<group>";
        };
        971C648E2B4DCF0100C97731 /* Constants */ = {
            isa = PBXGroup;
            children = (
                971C64D12B4DE71800C97731 /* Colors.swift */,
                975023A027E1A69300D773B5 /* Const.swift */,
                9778F5202B4F5C200028BB53 /* Formatters.swift */,
                9751345A2B51E1630018A62A /* URLSchemes.swift */,
                9763083A2B88619A006D7622 /* AppleDevice.swift */,
                97F91C4A2B8C07B900FBCF7A /* KeyEventBlocks.swift */,
                97E718A32B9673EC0011D43C /* URLs.swift */,
                975058FB2B586D9800BA6917 /* Errors */,
                975134602B51E3D60018A62A /* DeepLinks */,
            );
            path = Constants;
            sourceTree = "<group>";
        };
        971C648F2B4DCF2900C97731 /* UI */ = {
            isa = PBXGroup;
            children = (
                97E718922B9293E70011D43C /* XPlatform */,
                97E7186E2B9111280011D43C /* Sheets */,
                975D9F592B7EC47200473CA9 /* Alerts */,
                9778F5052B4F4C410028BB53 /* Settings */,
                9781967D2B51ADCC00C3FF82 /* AudioTrackEdit */,
                972B405A2B896D0300F0118C /* Bookmarks */,
                9778F4DB2B4F2ABE0028BB53 /* History */,
                971C64942B4DDC2600C97731 /* Transitions.swift */,
                971C64C42B4DE64A00C97731 /* Menus */,
                971C649E2B4DDEDC00C97731 /* Overlays */,
                9735F5182949193300DE1D7E /* MainView */,
                971C64902B4DCF5600C97731 /* MusicPlayerView */,
            );
            path = UI;
            sourceTree = "<group>";
        };
        971C64902B4DCF5600C97731 /* MusicPlayerView */ = {
            isa = PBXGroup;
            children = (
                9750238127E084EB00D773B5 /* MusicPlayerView.swift */,
                9767ADC92BA2443200449AB9 /* PlayerContextMenus */,
                9767ADC22BA2360A00449AB9 /* ChapterNavigator */,
                9750238B27E14A9100D773B5 /* MusicPlayerViewModel.swift */,
                9706889427ECF1690018BFF6 /* Slider */,
            );
            path = MusicPlayerView;
            sourceTree = "<group>";
        };
        971C649E2B4DDEDC00C97731 /* Overlays */ = {
            isa = PBXGroup;
            children = (
                971C649F2B4DDEEC00C97731 /* LoadingView.swift */,
            );
            path = Overlays;
            sourceTree = "<group>";
        };
        971C64A32B4DE3B700C97731 /* IOViews */ = {
            isa = PBXGroup;
            children = (
                971C64A42B4DE3B700C97731 /* ErrorView */,
                971C64A82B4DE3B700C97731 /* ImportView */,
                971C64AB2B4DE3B700C97731 /* Supporting */,
            );
            path = IOViews;
            sourceTree = "<group>";
        };
        971C64A42B4DE3B700C97731 /* ErrorView */ = {
            isa = PBXGroup;
            children = (
                971C64A52B4DE3B700C97731 /* Alert.swift */,
                971C64A62B4DE3B700C97731 /* ErrorViewModel.swift */,
                971C64A72B4DE3B700C97731 /* ErrorView.swift */,
            );
            path = ErrorView;
            sourceTree = "<group>";
        };
        971C64A82B4DE3B700C97731 /* ImportView */ = {
            isa = PBXGroup;
            children = (
                971C64A92B4DE3B700C97731 /* ImportViewModel.swift */,
                971C64AA2B4DE3B700C97731 /* ImportView.swift */,
            );
            path = ImportView;
            sourceTree = "<group>";
        };
        971C64AB2B4DE3B700C97731 /* Supporting */ = {
            isa = PBXGroup;
            children = (
                971C64AC2B4DE3B700C97731 /* IOToolbarElement.swift */,
                971C64AD2B4DE3B700C97731 /* ToolbarManager+IOViews.swift */,
                971C64AE2B4DE3B700C97731 /* ErrorManager.swift */,
            );
            path = Supporting;
            sourceTree = "<group>";
        };
        971C64C42B4DE64A00C97731 /* Menus */ = {
            isa = PBXGroup;
            children = (
                971C64C52B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift */,
                97E882D22B59B01300BA5B08 /* MainToolbar+shared.swift */,
                971C64C62B4DE64A00C97731 /* MainToolbarElement.swift */,
                971C64C72B4DE64A00C97731 /* TButton+Extensions.swift */,
                9767ADCD2BA24AF900449AB9 /* ContextMenuElements */,
                975134692B5251EF0018A62A /* OS */,
            );
            path = Menus;
            sourceTree = "<group>";
        };
        971EDFD82B7A918C0059888A /* LockscreenSettings */ = {
            isa = PBXGroup;
            children = (
                971EDFD62B7A8E3D0059888A /* LockscreenSettingsView.swift */,
                971EDFD92B7A919F0059888A /* MediaPlayerRemoteCommandCenter_Capability+RawRepresentable.swift */,
            );
            path = LockscreenSettings;
            sourceTree = "<group>";
        };
        97259025294A5DBE004310CD /* UnitTests */ = {
            isa = PBXGroup;
            children = (
            );
            path = UnitTests;
            sourceTree = "<group>";
        };
        97259056294D0575004310CD /* Mocks */ = {
            isa = PBXGroup;
            children = (
                97259057294D057E004310CD /* MockTimer.swift */,
                97259059294D05DC004310CD /* Transition.swift */,
                97052E1F295012E8003DCE48 /* TestEventLogger.swift */,
            );
            path = Mocks;
            sourceTree = "<group>";
        };
        972B405A2B896D0300F0118C /* Bookmarks */ = {
            isa = PBXGroup;
            children = (
                972B405B2B896D1E00F0118C /* BookmarksView.swift */,
                972B40672B89A09E00F0118C /* BookmarksViewModel.swift */,
                972B40662B89A08700F0118C /* BookmarkView */,
                972B40692B89A0C100F0118C /* ViewData */,
            );
            path = Bookmarks;
            sourceTree = "<group>";
        };
        972B40662B89A08700F0118C /* BookmarkView */ = {
            isa = PBXGroup;
            children = (
                972B40632B899FB500F0118C /* BookmarkView.swift */,
                972B40712B89A34900F0118C /* ListRowDateHeaderComponentView.swift */,
            );
            path = BookmarkView;
            sourceTree = "<group>";
        };
        972B40692B89A0C100F0118C /* ViewData */ = {
            isa = PBXGroup;
            children = (
                972B406A2B89A0CF00F0118C /* BookmarkViewData.swift */,
                972B406C2B89A0DF00F0118C /* GroupedBookmarkViewData.swift */,
            );
            path = ViewData;
            sourceTree = "<group>";
        };
        972B40782B8AAA2200F0118C /* HapticsSettings */ = {
            isa = PBXGroup;
            children = (
                972B40742B89CF3E00F0118C /* HapticsSettingsView.swift */,
                972B40762B8AAA1700F0118C /* HapticItem.swift */,
            );
            path = HapticsSettings;
            sourceTree = "<group>";
        };
        97328C602B7ECE71001AA422 /* AlertManager */ = {
            isa = PBXGroup;
            children = (
                975D9F532B7D82E300473CA9 /* AlertManager.swift */,
                97328C612B7ECE7B001AA422 /* Alerts.swift */,
            );
            path = AlertManager;
            sourceTree = "<group>";
        };
        97356D592B72F5EC00FEB860 /* MainViewImageView */ = {
            isa = PBXGroup;
            children = (
                97DE91B72B6EF1BD003D20E8 /* MainViewImageView.swift */,
                97356D5A2B72F60500FEB860 /* AudioAssetImageView.swift */,
                97356D5D2B72F61C00FEB860 /* GroupImageView.swift */,
            );
            path = MainViewImageView;
            sourceTree = "<group>";
        };
        9735F4B82946DA6600DE1D7E /* PlaybackManager */ = {
            isa = PBXGroup;
            children = (
                9735F4B62946932F00DE1D7E /* PlaybackManager.swift */,
                97480C732B97AECF002DE830 /* PlaybackManager+iOS.swift */,
                9778F54A2B506C750028BB53 /* AVAudioPlayerType.swift */,
                9778F54D2B506CA70028BB53 /* AVPlayerBuilder.swift */,
                9778F5572B506E5F0028BB53 /* AudioPlayerDelegate.swift */,
                9778F5502B506CFD0028BB53 /* AVAudioPlayer */,
                9725902D294A71F9004310CD /* PlayerEvent.swift */,
                9735F4B92946DA7900DE1D7E /* AudioPlayerProgress.swift */,
                9735F4BB2946DA8700DE1D7E /* AudioPlayerState.swift */,
            );
            path = PlaybackManager;
            sourceTree = "<group>";
        };
        9735F4C52947B83300DE1D7E /* MacOSAudiosaic */ = {
            isa = PBXGroup;
            children = (
                9735F4C62947B83300DE1D7E /* MacOSAudiosaicApp.swift */,
                97480C6A2B96F4F9002DE830 /* AppDelegate.swift */,
                97E882CE2B59955200BA5B08 /* Toolbars */,
                9735F4C82947B83300DE1D7E /* AllAssetsView.swift */,
                97DE91B62B6EF19F003D20E8 /* MainView */,
                9735F52329491B4500DE1D7E /* DocumentPicker.swift */,
                9778F4E12B4F2B4B0028BB53 /* Windows */,
                9735F4CA2947B83400DE1D7E /* Assets.xcassets */,
                9735F4CF2947B83400DE1D7E /* MacOSAudiosaic.entitlements */,
                9778F5382B4FC7D20028BB53 /* Info.plist */,
                9735F4CC2947B83400DE1D7E /* Preview Content */,
            );
            path = MacOSAudiosaic;
            sourceTree = "<group>";
        };
        9735F4CC2947B83400DE1D7E /* Preview Content */ = {
            isa = PBXGroup;
            children = (
                9735F4CD2947B83400DE1D7E /* Preview Assets.xcassets */,
            );
            path = "Preview Content";
            sourceTree = "<group>";
        };
        9735F4F329483E0500DE1D7E /* AudioAssetListItemView */ = {
            isa = PBXGroup;
            children = (
                9735F4F429483E2900DE1D7E /* AudioAssetListItemView.swift */,
                9735F5102948483800DE1D7E /* CircularProgressView.swift */,
                975058F22B58495600BA6917 /* Sheets */,
            );
            path = AudioAssetListItemView;
            sourceTree = "<group>";
        };
        9735F5182949193300DE1D7E /* MainView */ = {
            isa = PBXGroup;
            children = (
                97B8A3012B6C85310097D232 /* MainViewModel */,
                9735F5192949194300DE1D7E /* AudioAssetListViewData.swift */,
                9735F51E29491A5800DE1D7E /* ProgressViewData.swift */,
                975058FF2B587ECE00BA6917 /* MergeProgressView.swift */,
                97356D602B7300D100FEB860 /* ArtworkView.swift */,
            );
            path = MainView;
            sourceTree = "<group>";
        };
        9735F52129491A8000DE1D7E /* Shared */ = {
            isa = PBXGroup;
            children = (
                975058EC2B58416200BA6917 /* PreviewData */,
                975023A927E25EBE00D773B5 /* TurnIntoLibrary */,
                976C1CDB2B44C70100E2BF19 /* Debugging */,
                971C648E2B4DCF0100C97731 /* Constants */,
                971C64852B4C989400C97731 /* Initialization */,
                971C648F2B4DCF2900C97731 /* UI */,
                971C648D2B4DCE9B00C97731 /* Managers */,
                9750239B27E1A64400D773B5 /* Models */,
                9750239627E1A5EF00D773B5 /* Persistance */,
                97A4FEA92B59E9F100F25DF6 /* Sharing */,
                9735F52529491BE300DE1D7E /* Colors.xcassets */,
            );
            path = Shared;
            sourceTree = "<group>";
        };
        9750236627DFE4C900D773B5 = {
            isa = PBXGroup;
            children = (
                9778F5472B4FCD8F0028BB53 /* GoogleService-Info.plist */,
                9735F52129491A8000DE1D7E /* Shared */,
                9750237127DFE4C900D773B5 /* Audiosaic */,
                9735F4C52947B83300DE1D7E /* MacOSAudiosaic */,
                97259025294A5DBE004310CD /* UnitTests */,
                97608A032951448200B0532C /* IosUnitTests */,
                9750237027DFE4C900D773B5 /* Products */,
            );
            sourceTree = "<group>";
        };
        9750237027DFE4C900D773B5 /* Products */ = {
            isa = PBXGroup;
            children = (
                9750236F27DFE4C900D773B5 /* Audiosaic.app */,
                9735F4C42947B83200DE1D7E /* Audiosaic Desktop.app */,
                97259024294A5DBD004310CD /* UnitTests.xctest */,
                97608A022951448200B0532C /* IosUnitTests.xctest */,
            );
            name = Products;
            sourceTree = "<group>";
        };
        9750237127DFE4C900D773B5 /* Audiosaic */ = {
            isa = PBXGroup;
            children = (
                9750237227DFE4C900D773B5 /* AudiosaicApp.swift */,
                97E882CB2B59951800BA5B08 /* Toolbars */,
                971130182B7366F70024BD81 /* AllAssetsView.swift */,
                9718C80F2B55E1C3009CDA71 /* MainView */,
                9750238327E137F000D773B5 /* DocumentPicker.swift */,
                9750237627DFE4CA00D773B5 /* Assets.xcassets */,
                9735F4BF29473F6200DE1D7E /* Audiosaic.entitlements */,
                9750238027DFF08300D773B5 /* Info.plist */,
                9750237827DFE4CA00D773B5 /* Preview Content */,
            );
            path = Audiosaic;
            sourceTree = "<group>";
        };
        9750237827DFE4CA00D773B5 /* Preview Content */ = {
            isa = PBXGroup;
            children = (
                9750237927DFE4CA00D773B5 /* Preview Assets.xcassets */,
            );
            path = "Preview Content";
            sourceTree = "<group>";
        };
        9750239027E14B5F00D773B5 /* Extensions */ = {
            isa = PBXGroup;
            children = (
                9750239127E14B7700D773B5 /* URL+Extensions.swift */,
                975023A527E1A71700D773B5 /* AVAudioSession+Extensions.swift */,
                9778F51C2B4F5A2F0028BB53 /* UIImage+Extensions.swift */,
                975D9F562B7EC43B00473CA9 /* View+Alert.swift */,
                97E718682B90F47D0011D43C /* View+Sheet.swift */,
                97E718582B8FB9860011D43C /* Primitives+Extensions.swift */,
                97E7185B2B8FB9CD0011D43C /* Array+Extensions.swift */,
                97831D8F2B9F927500C4BBE7 /* Sequence+Extensions.swift */,
                97E7186B2B9102310011D43C /* View+if.swift */,
            );
            path = Extensions;
            sourceTree = "<group>";
        };
        9750239627E1A5EF00D773B5 /* Persistance */ = {
            isa = PBXGroup;
            children = (
                973BD0C62B6708B000F9EE9E /* AudioFileDataModelFactory.swift */,
                9735F4B22945D0DA00DE1D7E /* AudioEditor.swift */,
                9735F4EE2947F1C600DE1D7E /* DownloadObserver.swift */,
                97C1205C2B51BE080035D02E /* CoreDataStored */,
            );
            path = Persistance;
            sourceTree = "<group>";
        };
        9750239B27E1A64400D773B5 /* Models */ = {
            isa = PBXGroup;
            children = (
                9750238D27E14AB900D773B5 /* SongData.swift */,
                9750239C27E1A64F00D773B5 /* AudioAsset.swift */,
                9735F5152949191600DE1D7E /* AssetState.swift */,
                978196722B50A5A100C3FF82 /* PlaybackRecord.swift */,
                971EDFC72B7579000059888A /* Catalog.swift */,
                97328C722B8401F3001AA422 /* PlaybackEvent.swift */,
                9763082E2B86B58F006D7622 /* AssetBookmark.swift */,
            );
            path = Models;
            sourceTree = "<group>";
        };
        975023A927E25EBE00D773B5 /* TurnIntoLibrary */ = {
            isa = PBXGroup;
            children = (
                971C64A32B4DE3B700C97731 /* IOViews */,
                9750239027E14B5F00D773B5 /* Extensions */,
                975023A727E24C2800D773B5 /* MediaPlayerManager.swift */,
                97D42A6127E586C300D945D0 /* NowPlayingInfo.swift */,
                9735F4B4294663BB00DE1D7E /* AvAudioPlayer+Extensions.swift */,
                97259051294BD5A2004310CD /* ResumableTimer.swift */,
                971C64882B4DC27200C97731 /* Data+Image.swift */,
                975134732B548C7E0018A62A /* Table+Extensions.swift */,
                97E718A52B9674080011D43C /* Settings+AppVersion.swift */,
                97480C6D2B97A461002DE830 /* KeyPressManager+Combine.swift */,
                97480C702B97A781002DE830 /* AVAudioSession+Combine.swift */,
                97831D922B9FB17000C4BBE7 /* NSDomainError+Extensions.swift */,
                97831DA22BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift */,
                9767ADF92BA3A44700449AB9 /* SubscribedText.swift */,
                97AEBE722BA4B88200B1C867 /* View+AlertWithTextField.swift */,
                97B6512D2BABA90800605D44 /* ContextProvider */,
                97831D9E2BA0F4EA00C4BBE7 /* AVAsset+Extensions */,
                97579E562B990AF800843C77 /* Previews+Extensions */,
            );
            path = TurnIntoLibrary;
            sourceTree = "<group>";
        };
        975058E62B5771A400BA6917 /* WindowForegroundManager */ = {
            isa = PBXGroup;
            children = (
                9751348D2B54FDC60018A62A /* WindowForegroundManager.swift */,
                975058E72B5771B100BA6917 /* WindowForegroundObserver.swift */,
            );
            path = WindowForegroundManager;
            sourceTree = "<group>";
        };
        975058EC2B58416200BA6917 /* PreviewData */ = {
            isa = PBXGroup;
            children = (
                975058ED2B58417A00BA6917 /* AudioAsset+Preview.swift */,
            );
            path = PreviewData;
            sourceTree = "<group>";
        };
        975058F22B58495600BA6917 /* Sheets */ = {
            isa = PBXGroup;
            children = (
                975058F02B5848C100BA6917 /* SortView.swift */,
                977251C42B589DAA00DE66FE /* AudioTrackEditSheet.swift */,
                97328C7E2B857B4E001AA422 /* HistorySheet.swift */,
                972B40612B896F3D00F0118C /* BookmarksSheet.swift */,
            );
            path = Sheets;
            sourceTree = "<group>";
        };
        975058FB2B586D9800BA6917 /* Errors */ = {
            isa = PBXGroup;
            children = (
                975058FC2B586DA400BA6917 /* Import+Errors.swift */,
            );
            path = Errors;
            sourceTree = "<group>";
        };
        975134602B51E3D60018A62A /* DeepLinks */ = {
            isa = PBXGroup;
            children = (
                975134612B51E3EA0018A62A /* URLAudiosaicAction.swift */,
            );
            path = DeepLinks;
            sourceTree = "<group>";
        };
        975134692B5251EF0018A62A /* OS */ = {
            isa = PBXGroup;
            children = (
                9751346A2B5252070018A62A /* DevCommands.swift */,
                975058E32B57705D00BA6917 /* EventHistoryCommandsViewModel.swift */,
            );
            path = OS;
            sourceTree = "<group>";
        };
        97579E562B990AF800843C77 /* Previews+Extensions */ = {
            isa = PBXGroup;
            children = (
                97579E572B990B1800843C77 /* Preview+Utility.swift */,
            );
            path = "Previews+Extensions";
            sourceTree = "<group>";
        };
        975D9F592B7EC47200473CA9 /* Alerts */ = {
            isa = PBXGroup;
            children = (
                975D9F5A2B7EC47E00473CA9 /* CreateCatalogAlert.swift */,
                97B651212BAB6FE400605D44 /* CreateTagAlert.swift */,
                975D9F5D2B7ECBC100473CA9 /* RenameCatalogAlertView.swift */,
            );
            path = Alerts;
            sourceTree = "<group>";
        };
        97608A032951448200B0532C /* IosUnitTests */ = {
            isa = PBXGroup;
            children = (
                97259056294D0575004310CD /* Mocks */,
                97259033294BC67C004310CD /* SessionStateTests.swift */,
                97259054294D0560004310CD /* Assertions.swift */,
                97259068294FDCC9004310CD /* ProvisionallyPlayingSMTests.swift */,
                97E7187B2B912EFB0011D43C /* EditTests.swift */,
            );
            path = IosUnitTests;
            sourceTree = "<group>";
        };
        976308432B8915A7006D7622 /* ViewData */ = {
            isa = PBXGroup;
            children = (
                976308442B8915AF006D7622 /* EventViewData.swift */,
                976308472B8915BF006D7622 /* GroupedEventViewData.swift */,
            );
            path = ViewData;
            sourceTree = "<group>";
        };
        9763084D2B8928D7006D7622 /* HistoryEventView */ = {
            isa = PBXGroup;
            children = (
                9763084A2B892646006D7622 /* HistoryEventView.swift */,
                9763084E2B8928F0006D7622 /* HistoryEventView+Previews.swift */,
            );
            path = HistoryEventView;
            sourceTree = "<group>";
        };
        9767ADC22BA2360A00449AB9 /* ChapterNavigator */ = {
            isa = PBXGroup;
            children = (
                9767ADBF2BA20D6A00449AB9 /* ChapterNavigator.swift */,
                9767ADC62BA2362B00449AB9 /* ChapterNavigatorPicker.swift */,
            );
            path = ChapterNavigator;
            sourceTree = "<group>";
        };
        9767ADC92BA2443200449AB9 /* PlayerContextMenus */ = {
            isa = PBXGroup;
            children = (
                9767ADCA2BA2444600449AB9 /* PlayButton.swift */,
                97AEBE6F2BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift */,
                97AEBE6C2BA43D3000B1C867 /* BookmarkMenuElementView.swift */,
            );
            path = PlayerContextMenus;
            sourceTree = "<group>";
        };
        9767ADCD2BA24AF900449AB9 /* ContextMenuElements */ = {
            isa = PBXGroup;
            children = (
                9767ADCE2BA24B1A00449AB9 /* SetTimerMenu.swift */,
                9767ADD82BA250BB00449AB9 /* TimerDataView.swift */,
            );
            path = ContextMenuElements;
            sourceTree = "<group>";
        };
        9767ADD42BA2507E00449AB9 /* TimedPlaybackManager */ = {
            isa = PBXGroup;
            children = (
                9767ADD12BA2506400449AB9 /* TimedPlaybackManager.swift */,
                9767ADD52BA2509D00449AB9 /* TimedPlaybackData.swift */,
                9767ADDB2BA37D1A00449AB9 /* TimeRounding.swift */,
                97AEBE692BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift */,
            );
            path = TimedPlaybackManager;
            sourceTree = "<group>";
        };
        976C1CDB2B44C70100E2BF19 /* Debugging */ = {
            isa = PBXGroup;
            children = (
                9725906A294FDFFF004310CD /* Logging.swift */,
                976C1CDC2B44C70900E2BF19 /* GeneralDebugging.swift */,
                97D98C8D2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift */,
                9778F5312B4F62320028BB53 /* SessionStateMachine+Debug.swift */,
                9751346D2B5253AD0018A62A /* DebugScreen.swift */,
            );
            path = Debugging;
            sourceTree = "<group>";
        };
        9778F4DB2B4F2ABE0028BB53 /* History */ = {
            isa = PBXGroup;
            children = (
                9778F4DE2B4F2AF70028BB53 /* EventHistoryView.swift */,
                976308402B89157C006D7622 /* EventHistoryViewModel.swift */,
                9763084D2B8928D7006D7622 /* HistoryEventView */,
                976308432B8915A7006D7622 /* ViewData */,
            );
            path = History;
            sourceTree = "<group>";
        };
        9778F4E12B4F2B4B0028BB53 /* Windows */ = {
            isa = PBXGroup;
            children = (
                9778F4E32B4F2B700028BB53 /* Windows.swift */,
                9778F4DC2B4F2AD50028BB53 /* EventHistoryWindowView.swift */,
                972B405E2B896EC000F0118C /* BookmarksWindowView.swift */,
                97A443622B51BF9D00983906 /* AudioTrackEditWindowView.swift */,
            );
            path = Windows;
            sourceTree = "<group>";
        };
        9778F5052B4F4C410028BB53 /* Settings */ = {
            isa = PBXGroup;
            children = (
                97480C642B96B9C5002DE830 /* Settings_Previews.swift */,
                97E7189C2B96738B0011D43C /* Components */,
                9778F50C2B4F4CBC0028BB53 /* AudiosaicSettingsPath.swift */,
                9778F5062B4F4C4E0028BB53 /* AudiosaicSettingsView.swift */,
                9778F5092B4F4C8B0028BB53 /* AudiosaicSettingsViewModel.swift */,
                9778F50F2B4F4D8B0028BB53 /* GeneralSettingsView.swift */,
                9778F5112B4F4EA00028BB53 /* AppearanceSettingsView.swift */,
                972B40782B8AAA2200F0118C /* HapticsSettings */,
                975134842B54D6AB0018A62A /* MetadataSettingsView.swift */,
                971EDFD02B7581040059888A /* CatalogSettingsView.swift */,
                97DE91AB2B6EEAA6003D20E8 /* ImportSettings */,
                975059022B588B1D00BA6917 /* PlaybackSettingsView.swift */,
                971EDFD82B7A918C0059888A /* LockscreenSettings */,
                97328C782B8515B5001AA422 /* HistorySettingsView.swift */,
            );
            path = Settings;
            sourceTree = "<group>";
        };
        9778F5232B4F5CEC0028BB53 /* StateMachines */ = {
            isa = PBXGroup;
            children = (
                9778F5272B4F61460028BB53 /* StateMachine.swift */,
                9778F5342B4F673A0028BB53 /* PlayerStateMachine */,
                9725905C294E9C6F004310CD /* ProvisionallyPlayingSM.swift */,
                9778F5242B4F609E0028BB53 /* PlaybackStateProtocol.swift */,
                9778F52A2B4F61850028BB53 /* Frames */,
            );
            path = StateMachines;
            sourceTree = "<group>";
        };
        9778F52A2B4F61850028BB53 /* Frames */ = {
            isa = PBXGroup;
            children = (
                9778F52B2B4F618F0028BB53 /* FrameType.swift */,
                9778F52E2B4F61E80028BB53 /* SMFrame.swift */,
            );
            path = Frames;
            sourceTree = "<group>";
        };
        9778F5342B4F673A0028BB53 /* PlayerStateMachine */ = {
            isa = PBXGroup;
            children = (
                97259030294A92F2004310CD /* PlayerStateMachine.swift */,
                9778F5352B4F675B0028BB53 /* SessionStack.swift */,
            );
            path = PlayerStateMachine;
            sourceTree = "<group>";
        };
        9778F5502B506CFD0028BB53 /* AVAudioPlayer */ = {
            isa = PBXGroup;
            children = (
                9778F5512B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift */,
                9778F5542B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift */,
            );
            path = AVAudioPlayer;
            sourceTree = "<group>";
        };
        9781967D2B51ADCC00C3FF82 /* AudioTrackEdit */ = {
            isa = PBXGroup;
            children = (
                9781967E2B51ADEA00C3FF82 /* AudioTrackEditView.swift */,
                97E7185E2B8FD1730011D43C /* EditView */,
                975BF6742B7C1E4A0061D332 /* EditGroupViewModel.swift */,
                975134702B534BF30018A62A /* EditAlbumCoverView.swift */,
            );
            path = AudioTrackEdit;
            sourceTree = "<group>";
        };
        97831D9E2BA0F4EA00C4BBE7 /* AVAsset+Extensions */ = {
            isa = PBXGroup;
            children = (
                97831D9B2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift */,
                97831D982BA0F1FC00C4BBE7 /* Chapter.swift */,
            );
            path = "AVAsset+Extensions";
            sourceTree = "<group>";
        };
        97A4FEA92B59E9F100F25DF6 /* Sharing */ = {
            isa = PBXGroup;
            children = (
                97A4FEB02B59EA5500F25DF6 /* Mp3SharedAsset.swift */,
                97A4FEAA2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift */,
                97A4FEAD2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift */,
            );
            path = Sharing;
            sourceTree = "<group>";
        };
        97B651132BAB67C600605D44 /* TagManager */ = {
            isa = PBXGroup;
            children = (
                97B651142BAB67D100605D44 /* TagManager.swift */,
                97B651162BAB67E500605D44 /* Tag.swift */,
            );
            path = TagManager;
            sourceTree = "<group>";
        };
        97B651182BAB680800605D44 /* AddMenu */ = {
            isa = PBXGroup;
            children = (
                97B651192BAB681A00605D44 /* AddMenuView.swift */,
                97B6511B2BAB683100605D44 /* TagsMenuView.swift */,
            );
            path = AddMenu;
            sourceTree = "<group>";
        };
        97B6512D2BABA90800605D44 /* ContextProvider */ = {
            isa = PBXGroup;
            children = (
                97B6512A2BABA17600605D44 /* ContextProvider.swift */,
                97B6512E2BABA91500605D44 /* ContextMonad.swift */,
                97B651312BABA92500605D44 /* ContextContainer.swift */,
            );
            path = ContextProvider;
            sourceTree = "<group>";
        };
        97B8A3012B6C85310097D232 /* MainViewModel */ = {
            isa = PBXGroup;
            children = (
                9750238927E1389E00D773B5 /* MainViewModel.swift */,
                97B8A3022B6C854A0097D232 /* KeyPathComparator+String.swift */,
                97B8A3052B6C87480097D232 /* MainViewModel+Import.swift */,
                97B8A3082B6C88900097D232 /* MainViewModel+iOS.swift */,
                9763083D2B8910F1006D7622 /* KeyPathComparators.swift */,
            );
            path = MainViewModel;
            sourceTree = "<group>";
        };
        97C1205C2B51BE080035D02E /* CoreDataStored */ = {
            isa = PBXGroup;
            children = (
                9750239927E1A62900D773B5 /* AudioFileEntity.swift */,
                9750239E27E1A67F00D773B5 /* AudioAsset+CoreDataStored.swift */,
                973BD0B62B67060600F9EE9E /* PlaybackRecordEntity.swift */,
                978196752B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift */,
                971EDFCA2B757AF70059888A /* CatalogEntity.swift */,
                971EDFCD2B757C230059888A /* Catalog+CoreDataStored.swift */,
                976308342B86C1CF006D7622 /* AssetBookmarkEntity.swift */,
                976308372B86C234006D7622 /* AssetBookmark+CoreDataStored.swift */,
                97328C6C2B8400AB001AA422 /* PlaybackEventEntity.swift */,
                97328C6F2B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift */,
                97831D9F2BA0F93A00C4BBE7 /* ChapterEntity.swift */,
                97831DA52BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift */,
                97B651242BAB7DAC00605D44 /* TagEntity.swift */,
                97B651272BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift */,
            );
            path = CoreDataStored;
            sourceTree = "<group>";
        };
        97C6333D2BA8AB5E005DE243 /* MoveToMenu */ = {
            isa = PBXGroup;
            children = (
                97C6333E2BA8AB6A005DE243 /* MoveToMenuView.swift */,
                975BF67D2B7C525D0061D332 /* CatalogsMenuView.swift */,
                97C633412BA8AC16005DE243 /* PlaylistsMenuView.swift */,
            );
            path = MoveToMenu;
            sourceTree = "<group>";
        };
        97C633442BA8AF59005DE243 /* PlaylistManager */ = {
            isa = PBXGroup;
            children = (
                97C6333A2BA7AD7A005DE243 /* PlaylistManager.swift */,
                97C633632BA8B043005DE243 /* Playlists */,
            );
            path = PlaylistManager;
            sourceTree = "<group>";
        };
        97C6335D2BA8B008005DE243 /* SmartPlaylist */ = {
            isa = PBXGroup;
            children = (
                97C633572BA8AFF4005DE243 /* SmartPlaylistRule.swift */,
                97C6335A2BA8B004005DE243 /* SmartPlaylist.swift */,
            );
            path = SmartPlaylist;
            sourceTree = "<group>";
        };
        97C6335E2BA8B019005DE243 /* Podcast */ = {
            isa = PBXGroup;
            children = (
                97C6335F2BA8B021005DE243 /* Podcast.swift */,
            );
            path = Podcast;
            sourceTree = "<group>";
        };
        97C633622BA8B030005DE243 /* ManualPlaylist */ = {
            isa = PBXGroup;
            children = (
                97C633542BA8AFE4005DE243 /* ManualPlaylist.swift */,
                97C6334B2BA8AF92005DE243 /* AssetlPlaylistElement.swift */,
            );
            path = ManualPlaylist;
            sourceTree = "<group>";
        };
        97C633632BA8B043005DE243 /* Playlists */ = {
            isa = PBXGroup;
            children = (
                97C6334E2BA8AFA2005DE243 /* PlaylistType.swift */,
                97C633512BA8AFB4005DE243 /* Playlist.swift */,
                97C633482BA8AF81005DE243 /* PlaylistElement.swift */,
                97C633622BA8B030005DE243 /* ManualPlaylist */,
                97C6335E2BA8B019005DE243 /* Podcast */,
                97C6335D2BA8B008005DE243 /* SmartPlaylist */,
            );
            path = Playlists;
            sourceTree = "<group>";
        };
        97DE91AB2B6EEAA6003D20E8 /* ImportSettings */ = {
            isa = PBXGroup;
            children = (
                975058EA2B57D39500BA6917 /* ImportSettingsView.swift */,
                97DE91AC2B6EEAB7003D20E8 /* ImportMethod.swift */,
            );
            path = ImportSettings;
            sourceTree = "<group>";
        };
        97DE91AF2B6EEF0A003D20E8 /* MainViewContextMenu */ = {
            isa = PBXGroup;
            children = (
                97B8A2FD2B6C4F090097D232 /* MainMenuContextMenuItems.swift */,
                97DE91B02B6EEF2F003D20E8 /* MainViewSingleSelectionContextMenu.swift */,
                97DE91B32B6EF098003D20E8 /* MainViewMultiSelectionContextMenu.swift */,
                97B651182BAB680800605D44 /* AddMenu */,
                97C6333D2BA8AB5E005DE243 /* MoveToMenu */,
            );
            path = MainViewContextMenu;
            sourceTree = "<group>";
        };
        97DE91B62B6EF19F003D20E8 /* MainView */ = {
            isa = PBXGroup;
            children = (
                97B8A2FF2B6C4FF70097D232 /* MainView.swift */,
                97356D592B72F5EC00FEB860 /* MainViewImageView */,
                97DE91BA2B6F64F1003D20E8 /* MainViewKeyPaths.swift */,
                97DE91AF2B6EEF0A003D20E8 /* MainViewContextMenu */,
            );
            path = MainView;
            sourceTree = "<group>";
        };
        97E7185E2B8FD1730011D43C /* EditView */ = {
            isa = PBXGroup;
            children = (
                975134542B51D6ED0018A62A /* EditView.swift */,
                97E7185F2B8FD1870011D43C /* EditViewModel.swift */,
                97E718622B8FDA960011D43C /* EditViewElement.swift */,
                97E718652B8FDC690011D43C /* SmartEditOption.swift */,
                97E718962B94464C0011D43C /* Array+AudioAsset.swift */,
                97E718992B9543630011D43C /* PlainTextReValue.swift */,
                97F91C532B8D376500FBCF7A /* TextFields */,
            );
            path = EditView;
            sourceTree = "<group>";
        };
        97E7186E2B9111280011D43C /* Sheets */ = {
            isa = PBXGroup;
            children = (
                97E718722B91113A0011D43C /* RegularExpressionSheet */,
            );
            path = Sheets;
            sourceTree = "<group>";
        };
        97E718722B91113A0011D43C /* RegularExpressionSheet */ = {
            isa = PBXGroup;
            children = (
                97E7186F2B9111360011D43C /* RegularExpressionSheetView.swift */,
                97E718762B91116B0011D43C /* RegularExpressionAlertViewModel.swift */,
                97E718732B9111540011D43C /* ReHelper.swift */,
            );
            path = RegularExpressionSheet;
            sourceTree = "<group>";
        };
        97E7187D2B9158380011D43C /* EditViewTextField */ = {
            isa = PBXGroup;
            children = (
                97F91C4D2B8D2C0A00FBCF7A /* EditViewTextField.swift */,
                97E7187E2B91584E0011D43C /* EditViewTextFieldViewModel.swift */,
                97E718802B91586E0011D43C /* EditSheets.swift */,
                97E7188C2B92690D0011D43C /* MultiEditValue.swift */,
                97831D952BA0171F00C4BBE7 /* MultiEditRangeValue.swift */,
                97E718852B9249480011D43C /* EditViewTextFieldMenu */,
            );
            path = EditViewTextField;
            sourceTree = "<group>";
        };
        97E718852B9249480011D43C /* EditViewTextFieldMenu */ = {
            isa = PBXGroup;
            children = (
                97E718862B9249540011D43C /* EditViewTextFieldMenu.swift */,
            );
            path = EditViewTextFieldMenu;
            sourceTree = "<group>";
        };
        97E718922B9293E70011D43C /* XPlatform */ = {
            isa = PBXGroup;
            children = (
                97E718932B9294090011D43C /* AccessoryBarlikeButton.swift */,
            );
            path = XPlatform;
            sourceTree = "<group>";
        };
        97E7189C2B96738B0011D43C /* Components */ = {
            isa = PBXGroup;
            children = (
                97E7189D2B9673A20011D43C /* SettingsButton.swift */,
                97E7189F2B9673B50011D43C /* SettingsLabel.swift */,
                97E718A92B9674EB0011D43C /* SettingsToggle.swift */,
                97480C612B96B80B002DE830 /* SettingsPickerElement.swift */,
                97480C672B96C37F002DE830 /* ButtonPicker.swift */,
                97579E5A2B99848200843C77 /* SettingsDurationPicker.swift */,
            );
            path = Components;
            sourceTree = "<group>";
        };
        97E882CB2B59951800BA5B08 /* Toolbars */ = {
            isa = PBXGroup;
            children = (
                97E882CC2B59952D00BA5B08 /* MainToolbar+iOS.swift */,
            );
            path = Toolbars;
            sourceTree = "<group>";
        };
        97E882CE2B59955200BA5B08 /* Toolbars */ = {
            isa = PBXGroup;
            children = (
                97E882CF2B59956100BA5B08 /* MainToolbar+macOS.swift */,
            );
            path = Toolbars;
            sourceTree = "<group>";
        };
        97F91C532B8D376500FBCF7A /* TextFields */ = {
            isa = PBXGroup;
            children = (
                97E7187D2B9158380011D43C /* EditViewTextField */,
                97F91C502B8D375800FBCF7A /* EditViewTextFieldValidated.swift */,
                97F91C542B8E8BBF00FBCF7A /* EditViewRange.swift */,
            );
            path = TextFields;
            sourceTree = "<group>";
        };
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
        97259023294A5DBD004310CD /* UnitTests */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 9725902C294A5DBE004310CD /* Build configuration list for PBXNativeTarget "UnitTests" */;
            buildPhases = (
                97259020294A5DBD004310CD /* Sources */,
                97259021294A5DBD004310CD /* Frameworks */,
                97259022294A5DBD004310CD /* Resources */,
            );
            buildRules = (
            );
            dependencies = (
                97259029294A5DBE004310CD /* PBXTargetDependency */,
                976089FD2951433E00B0532C /* PBXTargetDependency */,
            );
            name = UnitTests;
            productName = UnitTests;
            productReference = 97259024294A5DBD004310CD /* UnitTests.xctest */;
            productType = "com.apple.product-type.bundle.unit-test";
        };
        9735F4C32947B83200DE1D7E /* Audiosaic Desktop */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 9735F4D02947B83400DE1D7E /* Build configuration list for PBXNativeTarget "Audiosaic Desktop" */;
            buildPhases = (
                9735F4C02947B83200DE1D7E /* Sources */,
                9735F4C12947B83200DE1D7E /* Frameworks */,
                9735F4C22947B83200DE1D7E /* Resources */,
                9778F5432B4FCC5F0028BB53 /* ShellScript */,
            );
            buildRules = (
            );
            dependencies = (
            );
            name = "Audiosaic Desktop";
            packageProductDependencies = (
                976C1CD92B422BC400E2BF19 /* AppRoving */,
                971C646D2B4C8F3800C97731 /* LoadableView */,
                971C64812B4C97B100C97731 /* KeyPressEventManager */,
                971C649C2B4DDE8500C97731 /* LoadingManager */,
                971C64C02B4DE41000C97731 /* ToolbarManager */,
                9778F4D92B4F28B60028BB53 /* WindowManager */,
                9778F4EB2B4F36E80028BB53 /* UserPreferences */,
                9778F5142B4F50880028BB53 /* SwiftUISettings */,
                9778F53E2B4FC9C40028BB53 /* FirebaseAnalytics */,
                9778F5402B4FC9C40028BB53 /* FirebaseCrashlytics */,
                978196792B50FD6C00C3FF82 /* CoreDataStored */,
                975134652B52114F0018A62A /* ID3TagEditor */,
                975058DF2B5667F500BA6917 /* FileUrlExtensions */,
                97B8A2FB2B6C31930097D232 /* NestedTable */,
                972B40992B8B35BA00F0118C /* ProgrammaticCoreData */,
                97579E5F2B9A61CF00843C77 /* CoreDataStored */,
            );
            productName = MacOSAudiosaic;
            productReference = 9735F4C42947B83200DE1D7E /* Audiosaic Desktop.app */;
            productType = "com.apple.product-type.application";
        };
        9750236E27DFE4C900D773B5 /* Audiosaic */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 9750237D27DFE4CA00D773B5 /* Build configuration list for PBXNativeTarget "Audiosaic" */;
            buildPhases = (
                9750236B27DFE4C900D773B5 /* Sources */,
                9750236C27DFE4C900D773B5 /* Frameworks */,
                9750236D27DFE4C900D773B5 /* Resources */,
                9778F5422B4FCBAC0028BB53 /* ShellScript */,
            );
            buildRules = (
            );
            dependencies = (
            );
            name = Audiosaic;
            packageProductDependencies = (
                976C1CDF2B44C73A00E2BF19 /* AppRoving */,
                971C646F2B4C8F4500C97731 /* LoadableView */,
                971C64832B4C97C400C97731 /* KeyPressEventManager */,
                971C649A2B4DDE7C00C97731 /* LoadingManager */,
                971C64C22B4DE41800C97731 /* ToolbarManager */,
                9778F4E92B4F36E00028BB53 /* UserPreferences */,
                9778F53A2B4FC9AD0028BB53 /* FirebaseAnalytics */,
                9778F53C2B4FC9AD0028BB53 /* FirebaseCrashlytics */,
                9781967B2B5128CC00C3FF82 /* CoreDataStored */,
                975134672B52115D0018A62A /* ID3TagEditor */,
                975058E12B5667FE00BA6917 /* FileUrlExtensions */,
                975058F32B584BC500BA6917 /* SwiftUISettings */,
                971130152B7363420024BD81 /* NestedTable */,
                972B40972B8B359500F0118C /* ProgrammaticCoreData */,
                97579E5D2B9A61C200843C77 /* CoreDataStored */,
            );
            productName = Audiosaic;
            productReference = 9750236F27DFE4C900D773B5 /* Audiosaic.app */;
            productType = "com.apple.product-type.application";
        };
        97608A012951448200B0532C /* IosUnitTests */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 97608A082951448200B0532C /* Build configuration list for PBXNativeTarget "IosUnitTests" */;
            buildPhases = (
                976089FE2951448200B0532C /* Sources */,
                976089FF2951448200B0532C /* Frameworks */,
                97608A002951448200B0532C /* Resources */,
            );
            buildRules = (
            );
            dependencies = (
                97608A072951448200B0532C /* PBXTargetDependency */,
            );
            name = IosUnitTests;
            productName = IosUnitTests;
            productReference = 97608A022951448200B0532C /* IosUnitTests.xctest */;
            productType = "com.apple.product-type.bundle.unit-test";
        };
/* End PBXNativeTarget section */

/* Begin PBXProject section */
        9750236727DFE4C900D773B5 /* Project object */ = {
            isa = PBXProject;
            attributes = {
                BuildIndependentTargetsInParallel = 1;
                LastSwiftUpdateCheck = 1410;
                LastUpgradeCheck = 1500;
                TargetAttributes = {
                    97259023294A5DBD004310CD = {
                        CreatedOnToolsVersion = 14.1;
                        TestTargetID = 9735F4C32947B83200DE1D7E;
                    };
                    9735F4C32947B83200DE1D7E = {
                        CreatedOnToolsVersion = 14.1;
                    };
                    9750236E27DFE4C900D773B5 = {
                        CreatedOnToolsVersion = 13.2.1;
                    };
                    97608A012951448200B0532C = {
                        CreatedOnToolsVersion = 14.1;
                        TestTargetID = 9750236E27DFE4C900D773B5;
                    };
                };
            };
            buildConfigurationList = 9750236A27DFE4C900D773B5 /* Build configuration list for PBXProject "Audiosaic" */;
            compatibilityVersion = "Xcode 15.0";
            developmentRegion = en;
            hasScannedForEncodings = 0;
            knownRegions = (
                en,
                Base,
            );
            mainGroup = 9750236627DFE4C900D773B5;
            packageReferences = (
                976C1CD82B422B3F00E2BF19 /* XCRemoteSwiftPackageReference "AppRoving" */,
                971C646C2B4C8F3800C97731 /* XCRemoteSwiftPackageReference "LoadableView" */,
                971C64802B4C97B100C97731 /* XCLocalSwiftPackageReference "../AxelPods/KeyPressEventManager" */,
                971C64992B4DDE7C00C97731 /* XCRemoteSwiftPackageReference "LoadingManager" */,
                971C64BF2B4DE41000C97731 /* XCRemoteSwiftPackageReference "ToolbarManager" */,
                9778F4D82B4F28B60028BB53 /* XCRemoteSwiftPackageReference "WindowManager" */,
                9778F4E82B4F36E00028BB53 /* XCRemoteSwiftPackageReference "UserPreferences" */,
                9778F5132B4F50880028BB53 /* XCLocalSwiftPackageReference "../AxelPods/SwiftUISettings" */,
                9778F5392B4FC9AD0028BB53 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */,
                975134642B52114F0018A62A /* XCRemoteSwiftPackageReference "ID3TagEditor" */,
                975058DE2B5667F500BA6917 /* XCRemoteSwiftPackageReference "FileUrlExtensions" */,
                97B8A2FA2B6C31930097D232 /* XCLocalSwiftPackageReference "../AxelPods/NestedTable" */,
                972B40962B8B359500F0118C /* XCLocalSwiftPackageReference "../AxelPods/ProgrammaticCoreData" */,
                97579E5C2B9A61C200843C77 /* XCRemoteSwiftPackageReference "CoreDataStored" */,
            );
            productRefGroup = 9750237027DFE4C900D773B5 /* Products */;
            projectDirPath = "";
            projectRoot = "";
            targets = (
                9750236E27DFE4C900D773B5 /* Audiosaic */,
                9735F4C32947B83200DE1D7E /* Audiosaic Desktop */,
                97259023294A5DBD004310CD /* UnitTests */,
                97608A012951448200B0532C /* IosUnitTests */,
            );
        };
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
        97259022294A5DBD004310CD /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        9735F4C22947B83200DE1D7E /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                9735F52629491BE300DE1D7E /* Colors.xcassets in Resources */,
                9778F5492B4FCD8F0028BB53 /* GoogleService-Info.plist in Resources */,
                9735F4CE2947B83400DE1D7E /* Preview Assets.xcassets in Resources */,
                9735F4CB2947B83400DE1D7E /* Assets.xcassets in Resources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        9750236D27DFE4C900D773B5 /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                9735F52729491BFB00DE1D7E /* Colors.xcassets in Resources */,
                9778F5482B4FCD8F0028BB53 /* GoogleService-Info.plist in Resources */,
                9750237A27DFE4CA00D773B5 /* Preview Assets.xcassets in Resources */,
                9750237727DFE4CA00D773B5 /* Assets.xcassets in Resources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        97608A002951448200B0532C /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXResourcesBuildPhase section */

/* Begin PBXShellScriptBuildPhase section */
        9778F5422B4FCBAC0028BB53 /* ShellScript */ = {
            isa = PBXShellScriptBuildPhase;
            alwaysOutOfDate = 1;
            buildActionMask = 2147483647;
            files = (
            );
            inputFileListPaths = (
            );
            inputPaths = (
                "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}",
                "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}/Contents/Resources/DWARF/${PRODUCT_NAME}",
                "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}/Contents/Info.plist",
                "$(TARGET_BUILD_DIR)/$(UNLOCALIZED_RESOURCES_FOLDER_PATH)/GoogleService-Info.plist",
                "$(TARGET_BUILD_DIR)/$(EXECUTABLE_PATH)",
            );
            outputFileListPaths = (
            );
            outputPaths = (
            );
            runOnlyForDeploymentPostprocessing = 0;
            shellPath = /bin/sh;
            shellScript = "\\"${BUILD_DIR%/Build/*}/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/run\\"\\n\\n";
        };
        9778F5432B4FCC5F0028BB53 /* ShellScript */ = {
            isa = PBXShellScriptBuildPhase;
            alwaysOutOfDate = 1;
            buildActionMask = 2147483647;
            files = (
            );
            inputFileListPaths = (
            );
            inputPaths = (
                "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}",
                "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}/Contents/Resources/DWARF/${PRODUCT_NAME}",
                "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}/Contents/Info.plist",
                "$(TARGET_BUILD_DIR)/$(UNLOCALIZED_RESOURCES_FOLDER_PATH)/GoogleService-Info.plist",
                "$(TARGET_BUILD_DIR)/$(EXECUTABLE_PATH)",
            );
            outputFileListPaths = (
            );
            outputPaths = (
            );
            runOnlyForDeploymentPostprocessing = 0;
            shellPath = /bin/sh;
            shellScript = "\\"${BUILD_DIR%/Build/*}/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/run\\"\\n";
        };
/* End PBXShellScriptBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
        97259020294A5DBD004310CD /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        9735F4C02947B83200DE1D7E /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                9778F5122B4F4EA00028BB53 /* AppearanceSettingsView.swift in Sources */,
                97A443632B51BF9D00983906 /* AudioTrackEditWindowView.swift in Sources */,
                9763084C2B892646006D7622 /* HistoryEventView.swift in Sources */,
                9735F4EC2947BBFD00DE1D7E /* URL+Extensions.swift in Sources */,
                97259053294BD5A2004310CD /* ResumableTimer.swift in Sources */,
                97C633532BA8AFB4005DE243 /* Playlist.swift in Sources */,
                9778F54C2B506C750028BB53 /* AVAudioPlayerType.swift in Sources */,
                9778F4EF2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift in Sources */,
                97C633432BA8AC16005DE243 /* PlaylistsMenuView.swift in Sources */,
                97E718642B8FDA960011D43C /* EditViewElement.swift in Sources */,
                9735F4C92947B83300DE1D7E /* AllAssetsView.swift in Sources */,
                97A4FEAC2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift in Sources */,
                9767ADCC2BA2444600449AB9 /* PlayButton.swift in Sources */,
                976308332B86BB67006D7622 /* BookmarkManager.swift in Sources */,
                9778F5082B4F4C4E0028BB53 /* AudiosaicSettingsView.swift in Sources */,
                97B651292BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift in Sources */,
                97B651302BABA91500605D44 /* ContextMonad.swift in Sources */,
                9735F4DB2947BB9900DE1D7E /* MusicPlayerViewModel.swift in Sources */,
                971C64D32B4DE71800C97731 /* Colors.swift in Sources */,
                9735F52429491B4500DE1D7E /* DocumentPicker.swift in Sources */,
                97C633402BA8AB6A005DE243 /* MoveToMenuView.swift in Sources */,
                97A4FEAF2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift in Sources */,
                9735F4D52947BB0D00DE1D7E /* NowPlayingInfo.swift in Sources */,
                975134892B54DC4D0018A62A /* MetadataManager.swift in Sources */,
                9778F5562B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift in Sources */,
                9767ADC12BA20D6A00449AB9 /* ChapterNavigator.swift in Sources */,
                975D9F5C2B7EC47E00473CA9 /* CreateCatalogAlert.swift in Sources */,
                9751345C2B51E1630018A62A /* URLSchemes.swift in Sources */,
                97328C7A2B8515B5001AA422 /* HistorySettingsView.swift in Sources */,
                975D9F552B7D82E400473CA9 /* AlertManager.swift in Sources */,
                975D9F582B7EC43B00473CA9 /* View+Alert.swift in Sources */,
                9767ADDD2BA37D1A00449AB9 /* TimeRounding.swift in Sources */,
                9778F5592B506E5F0028BB53 /* AudioPlayerDelegate.swift in Sources */,
                971C64B32B4DE3B700C97731 /* ImportView.swift in Sources */,
                971130172B7363670024BD81 /* MainViewMultiSelectionContextMenu.swift in Sources */,
                975BF67F2B7C525D0061D332 /* CatalogsMenuView.swift in Sources */,
                97E718752B9111540011D43C /* ReHelper.swift in Sources */,
                97B6511F2BAB68E100605D44 /* AddMenuView.swift in Sources */,
                97DE91BC2B6F64F1003D20E8 /* MainViewKeyPaths.swift in Sources */,
                97E718A12B9673CA0011D43C /* SettingsLabel.swift in Sources */,
                97C6334A2BA8AF81005DE243 /* PlaylistElement.swift in Sources */,
                9735F51D294919EE00DE1D7E /* MainViewModel.swift in Sources */,
                972B40732B89A36000F0118C /* ListRowDateHeaderComponentView.swift in Sources */,
                97328C632B7ECE7B001AA422 /* Alerts.swift in Sources */,
                97E718672B8FDC690011D43C /* SmartEditOption.swift in Sources */,
                9778F5222B4F5C200028BB53 /* Formatters.swift in Sources */,
                97E718782B91116B0011D43C /* RegularExpressionAlertViewModel.swift in Sources */,
                97B8A3042B6C854A0097D232 /* KeyPathComparator+String.swift in Sources */,
                97E718822B91586E0011D43C /* EditSheets.swift in Sources */,
                97F91C562B8E8BBF00FBCF7A /* EditViewRange.swift in Sources */,
                971C648C2B4DC82400C97731 /* IcloudSync.swift in Sources */,
                9751345F2B51E3130018A62A /* DeepLinkManager.swift in Sources */,
                971C64B02B4DE3B700C97731 /* ErrorViewModel.swift in Sources */,
                97E718542B8FA5D90011D43C /* InitializationState.swift in Sources */,
                97E718AB2B9675040011D43C /* SettingsToggle.swift in Sources */,
                97AEBE6B2BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift in Sources */,
                9735F4D72947BB1400DE1D7E /* AvAudioPlayer+Extensions.swift in Sources */,
                975059012B58821800BA6917 /* MergeProgressView.swift in Sources */,
                97E718882B9249540011D43C /* EditViewTextFieldMenu.swift in Sources */,
                971C64B62B4DE3B700C97731 /* ErrorManager.swift in Sources */,
                97328C772B840881001AA422 /* EventHistoryManager.swift in Sources */,
                976308492B8915BF006D7622 /* GroupedEventViewData.swift in Sources */,
                97A4FEB22B59EA5500F25DF6 /* Mp3SharedAsset.swift in Sources */,
                9751348F2B54FDC60018A62A /* WindowForegroundManager.swift in Sources */,
                971C64B12B4DE3B700C97731 /* ErrorView.swift in Sources */,
                971C64CA2B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift in Sources */,
                9735F4E42947BBBB00DE1D7E /* FileReader.swift in Sources */,
                97E718A82B9674490011D43C /* URLs.swift in Sources */,
                972B40702B89A10800F0118C /* GroupedBookmarkViewData.swift in Sources */,
                9735F4E92947BBF300DE1D7E /* AudioAsset+CoreDataStored.swift in Sources */,
                975BF67C2B7C31B80061D332 /* ImageAssetManager.swift in Sources */,
                9751346C2B5252070018A62A /* DevCommands.swift in Sources */,
                97E718832B9158720011D43C /* EditViewTextFieldViewModel.swift in Sources */,
                976308462B8915AF006D7622 /* EventViewData.swift in Sources */,
                97831DA42BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift in Sources */,
                9735F51B294919BD00DE1D7E /* AudioAssetListViewData.swift in Sources */,
                97F91C4C2B8C07B900FBCF7A /* KeyEventBlocks.swift in Sources */,
                97E7185D2B8FB9CD0011D43C /* Array+Extensions.swift in Sources */,
                971EDFCC2B757AF70059888A /* CatalogEntity.swift in Sources */,
                9778F5102B4F4D8B0028BB53 /* GeneralSettingsView.swift in Sources */,
                97C6335C2BA8B004005DE243 /* SmartPlaylist.swift in Sources */,
                97C633612BA8B021005DE243 /* Podcast.swift in Sources */,
                9778F54F2B506CA70028BB53 /* AVPlayerBuilder.swift in Sources */,
                9735F4E82947BBEC00DE1D7E /* AudioFileEntity.swift in Sources */,
                975134752B548C7E0018A62A /* Table+Extensions.swift in Sources */,
                9767ADD72BA2509D00449AB9 /* TimedPlaybackData.swift in Sources */,
                9735F4D32947BAFD00DE1D7E /* AudioFileManager.swift in Sources */,
                97B651232BAB6FE500605D44 /* CreateTagAlert.swift in Sources */,
                97831D912B9F927500C4BBE7 /* Sequence+Extensions.swift in Sources */,
                9735F4E62947BBE500DE1D7E /* SongData.swift in Sources */,
                9735F4E12947BBAC00DE1D7E /* DragLocation.swift in Sources */,
                973BD0BE2B67060600F9EE9E /* PlaybackRecordEntity.swift in Sources */,
                97E7189B2B9543630011D43C /* PlainTextReValue.swift in Sources */,
                976308302B86B58F006D7622 /* AssetBookmark.swift in Sources */,
                97480C6F2B97A461002DE830 /* KeyPressManager+Combine.swift in Sources */,
                9778F51B2B4F58ED0028BB53 /* PlayerEventLogger.swift in Sources */,
                971C647C2B4C951D00C97731 /* AppState.swift in Sources */,
                97E718A72B96741A0011D43C /* Settings+AppVersion.swift in Sources */,
                97356D5F2B72F61C00FEB860 /* GroupImageView.swift in Sources */,
                97356D5C2B72F60500FEB860 /* AudioAssetImageView.swift in Sources */,
                97831D942B9FB17000C4BBE7 /* NSDomainError+Extensions.swift in Sources */,
                9735F4C72947B83300DE1D7E /* MacOSAudiosaicApp.swift in Sources */,
                975059042B588B1D00BA6917 /* PlaybackSettingsView.swift in Sources */,
                975058EE2B58417A00BA6917 /* AudioAsset+Preview.swift in Sources */,
                97C6334D2BA8AF92005DE243 /* AssetlPlaylistElement.swift in Sources */,
                9735F4E72947BBE800DE1D7E /* AudioAsset.swift in Sources */,
                97E718952B9294090011D43C /* AccessoryBarlikeButton.swift in Sources */,
                97B651332BABA92500605D44 /* ContextContainer.swift in Sources */,
                9718C8122B55EE07009CDA71 /* IOSToolbarManager.swift in Sources */,
                97579E632B9A8E9D00843C77 /* DropManager.swift in Sources */,
                9767ADFB2BA3A44700449AB9 /* SubscribedText.swift in Sources */,
                97328C7D2B8548A9001AA422 /* StateRestorationManager.swift in Sources */,
                97B651262BAB7DAC00605D44 /* TagEntity.swift in Sources */,
                97831D972BA0171F00C4BBE7 /* MultiEditRangeValue.swift in Sources */,
                97480C662B96B9C5002DE830 /* Settings_Previews.swift in Sources */,
                971C64CE2B4DE64A00C97731 /* TButton+Extensions.swift in Sources */,
                97480C692B96C37F002DE830 /* ButtonPicker.swift in Sources */,
                9778F5262B4F609E0028BB53 /* PlaybackStateProtocol.swift in Sources */,
                9778F51E2B4F5A2F0028BB53 /* UIImage+Extensions.swift in Sources */,
                976308422B89157C006D7622 /* EventHistoryViewModel.swift in Sources */,
                9778F50B2B4F4C8B0028BB53 /* AudiosaicSettingsViewModel.swift in Sources */,
                97C633502BA8AFA3005DE243 /* PlaylistType.swift in Sources */,
                976308362B86C1CF006D7622 /* AssetBookmarkEntity.swift in Sources */,
                9778F52D2B4F618F0028BB53 /* FrameType.swift in Sources */,
                971EDFD52B75943A0059888A /* CatalogManager.swift in Sources */,
                9735F4DE2947BBA200DE1D7E /* AudioPlayerState.swift in Sources */,
                97F91C522B8D375800FBCF7A /* EditViewTextFieldValidated.swift in Sources */,
                971C647A2B4C950900C97731 /* AppInitializer.swift in Sources */,
                97E4E7162B51C16200AF2BDA /* AudioTrackEditView.swift in Sources */,
                97E7185A2B8FB9860011D43C /* Primitives+Extensions.swift in Sources */,
                9763083F2B8910F1006D7622 /* KeyPathComparators.swift in Sources */,
                975058FE2B586F7800BA6917 /* Import+Errors.swift in Sources */,
                97E7186D2B9102310011D43C /* View+if.swift in Sources */,
                9767ADDA2BA250BB00449AB9 /* TimerDataView.swift in Sources */,
                97DE91AE2B6EEAB7003D20E8 /* ImportMethod.swift in Sources */,
                97831D9D2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift in Sources */,
                971C64892B4DC27200C97731 /* Data+Image.swift in Sources */,
                97AEBE6E2BA43D3000B1C867 /* BookmarkMenuElementView.swift in Sources */,
                975134722B534BF30018A62A /* EditAlbumCoverView.swift in Sources */,
                97328C742B8401F3001AA422 /* PlaybackEvent.swift in Sources */,
                97E882D42B59B81B00BA5B08 /* MainToolbar+shared.swift in Sources */,
                9751346F2B5253AD0018A62A /* DebugScreen.swift in Sources */,
                97E718A22B9673CF0011D43C /* SettingsButton.swift in Sources */,
                97D98C8F2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift in Sources */,
                9735F4E02947BBAA00DE1D7E /* Slider.swift in Sources */,
                975134632B51E3EA0018A62A /* URLAudiosaicAction.swift in Sources */,
                97B6512C2BABA17600605D44 /* ContextProvider.swift in Sources */,
                975D9F5F2B7ECBC100473CA9 /* RenameCatalogAlertView.swift in Sources */,
                97E718572B8FA8290011D43C /* AppErrorView.swift in Sources */,
                9778F5372B4F675B0028BB53 /* SessionStack.swift in Sources */,
                97579E592B990E3F00843C77 /* Preview+Utility.swift in Sources */,
                97480C722B97A781002DE830 /* AVAudioSession+Combine.swift in Sources */,
                9778F5332B4F62320028BB53 /* SessionStateMachine+Debug.swift in Sources */,
                972B406F2B89A10500F0118C /* BookmarkViewData.swift in Sources */,
                97C633592BA8AFF4005DE243 /* SmartPlaylistRule.swift in Sources */,
                971C64AF2B4DE3B700C97731 /* Alert.swift in Sources */,
                9778F4E22B4F2B620028BB53 /* EventHistoryView.swift in Sources */,
                972B40602B896EC000F0118C /* BookmarksWindowView.swift in Sources */,
                9778F4F22B4F385E0028BB53 /* PreferredColorScheme.swift in Sources */,
                972B40792B8AAA5400F0118C /* HapticItem.swift in Sources */,
                97831DA12BA0F93A00C4BBE7 /* ChapterEntity.swift in Sources */,
                975134862B54D6AC0018A62A /* MetadataSettingsView.swift in Sources */,
                971C64B22B4DE3B700C97731 /* ImportViewModel.swift in Sources */,
                9778F5292B4F61460028BB53 /* StateMachine.swift in Sources */,
                9778F5532B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift in Sources */,
                97D5252A2B4DFE040041BB5F /* Transitions.swift in Sources */,
                97B651202BAB68E700605D44 /* TagsMenuView.swift in Sources */,
                9735F5172949191900DE1D7E /* AssetState.swift in Sources */,
                971EDFD22B7581040059888A /* CatalogSettingsView.swift in Sources */,
                9778F5302B4F61E80028BB53 /* SMFrame.swift in Sources */,
                9735F4D42947BB0800DE1D7E /* MediaPlayerManager.swift in Sources */,
                9778F50E2B4F4CBC0028BB53 /* AudiosaicSettingsPath.swift in Sources */,
                97DE91B92B6EF1BD003D20E8 /* MainViewImageView.swift in Sources */,
                97480C6C2B96F4F9002DE830 /* AppDelegate.swift in Sources */,
                9735F4DD2947BBA000DE1D7E /* AudioPlayerProgress.swift in Sources */,
                9735F4E22947BBAF00DE1D7E /* Slider+Extensions.swift in Sources */,
                97DE91B22B6EEF2F003D20E8 /* MainViewSingleSelectionContextMenu.swift in Sources */,
                9767ADD02BA24B1A00449AB9 /* SetTimerMenu.swift in Sources */,
                97E7188E2B92690D0011D43C /* MultiEditValue.swift in Sources */,
                9735F512294903BB00DE1D7E /* DownloadObserver.swift in Sources */,
                9725902F294A71F9004310CD /* PlayerEvent.swift in Sources */,
                97356D622B7300D100FEB860 /* ArtworkView.swift in Sources */,
                9725906D294FE015004310CD /* Logging.swift in Sources */,
                973BD0CB2B68196400F9EE9E /* AudioAssetContentStore.swift in Sources */,
                97AEBE712BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift in Sources */,
                9735F4ED2947BC0000DE1D7E /* AVAudioSession+Extensions.swift in Sources */,
                97B8A3002B6C500E0097D232 /* MainView.swift in Sources */,
                9735F52029491A7000DE1D7E /* ProgressViewData.swift in Sources */,
                97E718982B94464C0011D43C /* Array+AudioAsset.swift in Sources */,
                97E718612B8FD1870011D43C /* EditViewModel.swift in Sources */,
                978196742B50A5A100C3FF82 /* PlaybackRecord.swift in Sources */,
                9725905F294E9CB9004310CD /* ProvisionallyPlayingSM.swift in Sources */,
                97B6511E2BAB68AA00605D44 /* TagManager.swift in Sources */,
                976308392B86C234006D7622 /* AssetBookmark+CoreDataStored.swift in Sources */,
                97B8A30A2B6C88900097D232 /* MainViewModel+iOS.swift in Sources */,
                973BD0C82B6708B000F9EE9E /* AudioFileDataModelFactory.swift in Sources */,
                971C64B42B4DE3B700C97731 /* IOToolbarElement.swift in Sources */,
                97B8A2FE2B6C4F130097D232 /* MainMenuContextMenuItems.swift in Sources */,
                9735F4DA2947BB9300DE1D7E /* MusicPlayerView.swift in Sources */,
                976308502B8928F0006D7622 /* HistoryEventView+Previews.swift in Sources */,
                975134782B5497960018A62A /* AssetSelectionManager.swift in Sources */,
                97C6333C2BA7AD7A005DE243 /* PlaylistManager.swift in Sources */,
                97B8A3072B6C87480097D232 /* MainViewModel+Import.swift in Sources */,
                975058E52B57705D00BA6917 /* EventHistoryCommandsViewModel.swift in Sources */,
                975058E92B5771B100BA6917 /* WindowForegroundObserver.swift in Sources */,
                975BF6762B7C1E4A0061D332 /* EditGroupViewModel.swift in Sources */,
                97B6511D2BAB68A700605D44 /* Tag.swift in Sources */,
                972B406E2B89A0FD00F0118C /* BookmarksViewModel.swift in Sources */,
                971EDFC92B7579000059888A /* Catalog.swift in Sources */,
                9767ADC82BA2362B00449AB9 /* ChapterNavigatorPicker.swift in Sources */,
                9778F4E42B4F2B710028BB53 /* Windows.swift in Sources */,
                971C64A02B4DDEEC00C97731 /* LoadingView.swift in Sources */,
                97AEBE742BA4B88200B1C867 /* View+AlertWithTextField.swift in Sources */,
                975BF6792B7C31000061D332 /* HardRefreshManager.swift in Sources */,
                97E882D12B59958700BA5B08 /* MainToolbar+macOS.swift in Sources */,
                9735F4D92947BB8E00DE1D7E /* Const.swift in Sources */,
                97831DA72BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift in Sources */,
                97C633562BA8AFE4005DE243 /* ManualPlaylist.swift in Sources */,
                976C1CDE2B44C71E00E2BF19 /* GeneralDebugging.swift in Sources */,
                97E718712B9111360011D43C /* RegularExpressionSheetView.swift in Sources */,
                9735F4DC2947BB9D00DE1D7E /* PlaybackManager.swift in Sources */,
                972B40652B89A02600F0118C /* BookmarkView.swift in Sources */,
                97480C632B96B80B002DE830 /* SettingsPickerElement.swift in Sources */,
                97328C712B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift in Sources */,
                9739A3292BA5711E0018CCDF /* EnvironmentKeys.swift in Sources */,
                97E7186A2B90F47D0011D43C /* View+Sheet.swift in Sources */,
                97831D9A2BA0F1FC00C4BBE7 /* Chapter.swift in Sources */,
                9735F4EA2947BBF600DE1D7E /* AudioEditor.swift in Sources */,
                971C64B52B4DE3B700C97731 /* ToolbarManager+IOViews.swift in Sources */,
                9778F4E02B4F2B490028BB53 /* EventHistoryWindowView.swift in Sources */,
                975058EB2B57D39500BA6917 /* ImportSettingsView.swift in Sources */,
                975134562B51D6ED0018A62A /* EditView.swift in Sources */,
                978196772B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift in Sources */,
                9763083C2B88619A006D7622 /* AppleDevice.swift in Sources */,
                97259032294A92F2004310CD /* PlayerStateMachine.swift in Sources */,
                9767ADD32BA2506400449AB9 /* TimedPlaybackManager.swift in Sources */,
                971C64CC2B4DE64A00C97731 /* MainToolbarElement.swift in Sources */,
                972B405D2B896D1E00F0118C /* BookmarksView.swift in Sources */,
                975134592B51D7150018A62A /* AudioTrackEditManager.swift in Sources */,
                971EDFCF2B757C230059888A /* Catalog+CoreDataStored.swift in Sources */,
                97328C6E2B8400AB001AA422 /* PlaybackEventEntity.swift in Sources */,
                97F91C4F2B8D2C0A00FBCF7A /* EditViewTextField.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        9750236B27DFE4C900D773B5 /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                97480C652B96B9C5002DE830 /* Settings_Previews.swift in Sources */,
                9750238427E137F000D773B5 /* DocumentPicker.swift in Sources */,
                975023A827E24C2800D773B5 /* MediaPlayerManager.swift in Sources */,
                976308482B8915BF006D7622 /* GroupedEventViewData.swift in Sources */,
                97831DA62BA0FC4400C4BBE7 /* ChapterEntity+CoreDataStored.swift in Sources */,
                9778F5582B506E5F0028BB53 /* AudioPlayerDelegate.swift in Sources */,
                971EDFCB2B757AF70059888A /* CatalogEntity.swift in Sources */,
                97259052294BD5A2004310CD /* ResumableTimer.swift in Sources */,
                976308352B86C1CF006D7622 /* AssetBookmarkEntity.swift in Sources */,
                9739A3282BA5711E0018CCDF /* EnvironmentKeys.swift in Sources */,
                975058F12B5848C100BA6917 /* SortView.swift in Sources */,
                97E718742B9111540011D43C /* ReHelper.swift in Sources */,
                971EDFC82B7579000059888A /* Catalog.swift in Sources */,
                97F91C552B8E8BBF00FBCF7A /* EditViewRange.swift in Sources */,
                97E7189E2B9673A20011D43C /* SettingsButton.swift in Sources */,
                97E882D32B59B01300BA5B08 /* MainToolbar+shared.swift in Sources */,
                971C64B72B4DE3E600C97731 /* Alert.swift in Sources */,
                9706889827ECF1A50018BFF6 /* Slider+Extensions.swift in Sources */,
                9750239D27E1A64F00D773B5 /* AudioAsset.swift in Sources */,
                9750239F27E1A67F00D773B5 /* AudioAsset+CoreDataStored.swift in Sources */,
                971EDFDA2B7A919F0059888A /* MediaPlayerRemoteCommandCenter_Capability+RawRepresentable.swift in Sources */,
                975D9F572B7EC43B00473CA9 /* View+Alert.swift in Sources */,
                9778F54B2B506C750028BB53 /* AVAudioPlayerType.swift in Sources */,
                97A4FEAE2B59EA4100F25DF6 /* AudioAssetListViewData+shared.swift in Sources */,
                973BD0C72B6708B000F9EE9E /* AudioFileDataModelFactory.swift in Sources */,
                97E718872B9249540011D43C /* EditViewTextFieldMenu.swift in Sources */,
                971C64BD2B4DE3F900C97731 /* ToolbarManager+IOViews.swift in Sources */,
                9751346E2B5253AD0018A62A /* DebugScreen.swift in Sources */,
                9778F52C2B4F618F0028BB53 /* FrameType.swift in Sources */,
                9778F52F2B4F61E80028BB53 /* SMFrame.swift in Sources */,
                9763083E2B8910F1006D7622 /* KeyPathComparators.swift in Sources */,
                971EDFD42B75943A0059888A /* CatalogManager.swift in Sources */,
                971C64D22B4DE71800C97731 /* Colors.swift in Sources */,
                97579E5B2B99848200843C77 /* SettingsDurationPicker.swift in Sources */,
                971C64B92B4DE3EC00C97731 /* ErrorView.swift in Sources */,
                9767ADC02BA20D6A00449AB9 /* ChapterNavigator.swift in Sources */,
                97E718842B9158730011D43C /* EditViewTextFieldViewModel.swift in Sources */,
                97B651282BAB7F7F00605D44 /* TagEntity+CoreDataStored.swift in Sources */,
                97DE91BB2B6F64F1003D20E8 /* MainViewKeyPaths.swift in Sources */,
                975058FA2B584CC100BA6917 /* ImportSettingsView.swift in Sources */,
                976308412B89157C006D7622 /* EventHistoryViewModel.swift in Sources */,
                97B6511C2BAB683100605D44 /* TagsMenuView.swift in Sources */,
                9735F4BA2946DA7900DE1D7E /* AudioPlayerProgress.swift in Sources */,
                97B8A3032B6C854A0097D232 /* KeyPathComparator+String.swift in Sources */,
                97F91C4E2B8D2C0A00FBCF7A /* EditViewTextField.swift in Sources */,
                9778F5522B506D0A0028BB53 /* AVAudioPlayer+AVAudioPlayerType.swift in Sources */,
                971C64BE2B4DE3FC00C97731 /* ErrorManager.swift in Sources */,
                9767ADCB2BA2444600449AB9 /* PlayButton.swift in Sources */,
                97E718A42B9673EC0011D43C /* URLs.swift in Sources */,
                971C64912B4DD08200C97731 /* IcloudSync.swift in Sources */,
                9751345E2B51E3130018A62A /* DeepLinkManager.swift in Sources */,
                971EDFCE2B757C230059888A /* Catalog+CoreDataStored.swift in Sources */,
                97B651222BAB6FE500605D44 /* CreateTagAlert.swift in Sources */,
                9750239827E1A60500D773B5 /* AudioFileManager.swift in Sources */,
                97328C7C2B8548A9001AA422 /* StateRestorationManager.swift in Sources */,
                97C6334F2BA8AFA3005DE243 /* PlaylistType.swift in Sources */,
                9778F5362B4F675B0028BB53 /* SessionStack.swift in Sources */,
                975BF6782B7C31000061D332 /* HardRefreshManager.swift in Sources */,
                975BF67E2B7C525D0061D332 /* CatalogsMenuView.swift in Sources */,
                97328C7F2B857B4E001AA422 /* HistorySheet.swift in Sources */,
                97E718592B8FB9860011D43C /* Primitives+Extensions.swift in Sources */,
                975D9F5B2B7EC47E00473CA9 /* CreateCatalogAlert.swift in Sources */,
                975134552B51D6ED0018A62A /* EditView.swift in Sources */,
                976308322B86BB67006D7622 /* BookmarkManager.swift in Sources */,
                975BF6752B7C1E4A0061D332 /* EditGroupViewModel.swift in Sources */,
                9750237527DFE4C900D773B5 /* MainView.swift in Sources */,
                97E7186C2B9102310011D43C /* View+if.swift in Sources */,
                97328C622B7ECE7B001AA422 /* Alerts.swift in Sources */,
                975134852B54D6AB0018A62A /* MetadataSettingsView.swift in Sources */,
                971C64BC2B4DE3F600C97731 /* IOToolbarElement.swift in Sources */,
                97831DA32BA0FB2300C4BBE7 /* Double+NanEncodedOptional.swift in Sources */,
                97C633602BA8B021005DE243 /* Podcast.swift in Sources */,
                971C64A12B4DDEF500C97731 /* LoadingView.swift in Sources */,
                9750237327DFE4C900D773B5 /* AudiosaicApp.swift in Sources */,
                9735F4B72946932F00DE1D7E /* PlaybackManager.swift in Sources */,
                975058E42B57705D00BA6917 /* EventHistoryCommandsViewModel.swift in Sources */,
                975134882B54DC4D0018A62A /* MetadataManager.swift in Sources */,
                9750239A27E1A62900D773B5 /* AudioFileEntity.swift in Sources */,
                97E718972B94464C0011D43C /* Array+AudioAsset.swift in Sources */,
                9767ADCF2BA24B1A00449AB9 /* SetTimerMenu.swift in Sources */,
                97E718942B9294090011D43C /* AccessoryBarlikeButton.swift in Sources */,
                9763084F2B8928F0006D7622 /* HistoryEventView+Previews.swift in Sources */,
                97831D932B9FB17000C4BBE7 /* NSDomainError+Extensions.swift in Sources */,
                97C6333B2BA7AD7A005DE243 /* PlaylistManager.swift in Sources */,
                97D42A6227E586C300D945D0 /* NowPlayingInfo.swift in Sources */,
                97B651152BAB67D100605D44 /* TagManager.swift in Sources */,
                972B40722B89A34900F0118C /* ListRowDateHeaderComponentView.swift in Sources */,
                971C64872B4C98BF00C97731 /* AppState.swift in Sources */,
                9735F4B5294663BB00DE1D7E /* AvAudioPlayer+Extensions.swift in Sources */,
                9735F4B32945D0DA00DE1D7E /* AudioEditor.swift in Sources */,
                9778F5252B4F609E0028BB53 /* PlaybackStateProtocol.swift in Sources */,
                97328C732B8401F3001AA422 /* PlaybackEvent.swift in Sources */,
                97E718602B8FD1870011D43C /* EditViewModel.swift in Sources */,
                97328C702B8400C9001AA422 /* PlaybackEventEntity+CoreDataStored.swift in Sources */,
                9767ADD22BA2506400449AB9 /* TimedPlaybackManager.swift in Sources */,
                9750238E27E14AB900D773B5 /* SongData.swift in Sources */,
                9778F4EE2B4F378A0028BB53 /* AudiosaicPreferenceKey.swift in Sources */,
                97A4FEB12B59EA5500F25DF6 /* Mp3SharedAsset.swift in Sources */,
                97C633492BA8AF81005DE243 /* PlaylistElement.swift in Sources */,
                9767ADFA2BA3A44700449AB9 /* SubscribedText.swift in Sources */,
                97C633552BA8AFE4005DE243 /* ManualPlaylist.swift in Sources */,
                97E718702B9111360011D43C /* RegularExpressionSheetView.swift in Sources */,
                97356D5E2B72F61C00FEB860 /* GroupImageView.swift in Sources */,
                97356D5B2B72F60500FEB860 /* AudioAssetImageView.swift in Sources */,
                9735F51A2949194300DE1D7E /* AudioAssetListViewData.swift in Sources */,
                97B6512F2BABA91500605D44 /* ContextMonad.swift in Sources */,
                975023A627E1A71700D773B5 /* AVAudioSession+Extensions.swift in Sources */,
                971C64B82B4DE3E900C97731 /* ErrorViewModel.swift in Sources */,
                97C6333F2BA8AB6A005DE243 /* MoveToMenuView.swift in Sources */,
                971C64862B4C98BB00C97731 /* AppInitializer.swift in Sources */,
                97E718AA2B9674EB0011D43C /* SettingsToggle.swift in Sources */,
                97C633582BA8AFF4005DE243 /* SmartPlaylistRule.swift in Sources */,
                9778F54E2B506CA70028BB53 /* AVPlayerBuilder.swift in Sources */,
                9763084B2B892646006D7622 /* HistoryEventView.swift in Sources */,
                97B6512B2BABA17600605D44 /* ContextProvider.swift in Sources */,
                9778F5552B506D630028BB53 /* AVdelegateAVAudioPlayerDelegate.swift in Sources */,
                9751346B2B5252070018A62A /* DevCommands.swift in Sources */,
                97AEBE732BA4B88200B1C867 /* View+AlertWithTextField.swift in Sources */,
                978196732B50A5A100C3FF82 /* PlaybackRecord.swift in Sources */,
                971C648A2B4DC29600C97731 /* Data+Image.swift in Sources */,
                975134712B534BF30018A62A /* EditAlbumCoverView.swift in Sources */,
                9718C8112B55EE07009CDA71 /* IOSToolbarManager.swift in Sources */,
                97831D902B9F927500C4BBE7 /* Sequence+Extensions.swift in Sources */,
                972B406B2B89A0CF00F0118C /* BookmarkViewData.swift in Sources */,
                97C6334C2BA8AF92005DE243 /* AssetlPlaylistElement.swift in Sources */,
                9711301D2B7368D70024BD81 /* MainMenuContextMenuItems.swift in Sources */,
                975058F62B584CB200BA6917 /* AudiosaicSettingsViewModel.swift in Sources */,
                97D98C8E2953D992005D2779 /* ProvisionallyPlayingSM+DebugTesting.swift in Sources */,
                97D42A7E27E866B600D945D0 /* Slider.swift in Sources */,
                97DE91AD2B6EEAB7003D20E8 /* ImportMethod.swift in Sources */,
                975059002B587ECE00BA6917 /* MergeProgressView.swift in Sources */,
                9735F5162949191600DE1D7E /* AssetState.swift in Sources */,
                975D9F5E2B7ECBC100473CA9 /* RenameCatalogAlertView.swift in Sources */,
                9750238227E084EB00D773B5 /* MusicPlayerView.swift in Sources */,
                97831D992BA0F1FC00C4BBE7 /* Chapter.swift in Sources */,
                9778F51D2B4F5A2F0028BB53 /* UIImage+Extensions.swift in Sources */,
                97579E582B990B1800843C77 /* Preview+Utility.swift in Sources */,
                9778F4DF2B4F2AF70028BB53 /* EventHistoryView.swift in Sources */,
                971130192B7366F70024BD81 /* AllAssetsView.swift in Sources */,
                97480C6E2B97A461002DE830 /* KeyPressManager+Combine.swift in Sources */,
                97B651252BAB7DAC00605D44 /* TagEntity.swift in Sources */,
                976308382B86C234006D7622 /* AssetBookmark+CoreDataStored.swift in Sources */,
                972B40642B899FB500F0118C /* BookmarkView.swift in Sources */,
                971C64922B4DD09700C97731 /* FileReader.swift in Sources */,
                971C64C92B4DE64A00C97731 /* MainToolbar+ToolbarManager.swift in Sources */,
                9751345B2B51E1630018A62A /* URLSchemes.swift in Sources */,
                972B40772B8AAA1700F0118C /* HapticItem.swift in Sources */,
                975058F92B584CBC00BA6917 /* AppearanceSettingsView.swift in Sources */,
                9778F4F12B4F385E0028BB53 /* PreferredColorScheme.swift in Sources */,
                972B405C2B896D1E00F0118C /* BookmarksView.swift in Sources */,
                973BD0BD2B67060600F9EE9E /* PlaybackRecordEntity.swift in Sources */,
                9735F4BC2946DA8700DE1D7E /* AudioPlayerState.swift in Sources */,
                9763082F2B86B58F006D7622 /* AssetBookmark.swift in Sources */,
                9767ADC72BA2362B00449AB9 /* ChapterNavigatorPicker.swift in Sources */,
                97328C6D2B8400AB001AA422 /* PlaybackEventEntity.swift in Sources */,
                9778F51A2B4F58ED0028BB53 /* PlayerEventLogger.swift in Sources */,
                975134742B548C7E0018A62A /* Table+Extensions.swift in Sources */,
                97F91C512B8D375800FBCF7A /* EditViewTextFieldValidated.swift in Sources */,
                971130212B73690E0024BD81 /* MainViewMultiSelectionContextMenuItemView.swift in Sources */,
                972B40682B89A09E00F0118C /* BookmarksViewModel.swift in Sources */,
                9750239227E14B7700D773B5 /* URL+Extensions.swift in Sources */,
                97E7189A2B9543630011D43C /* PlainTextReValue.swift in Sources */,
                975134622B51E3EA0018A62A /* URLAudiosaicAction.swift in Sources */,
                9778F5212B4F5C200028BB53 /* Formatters.swift in Sources */,
                9735F4F529483E2900DE1D7E /* AudioAssetListItemView.swift in Sources */,
                97E7185C2B8FB9CD0011D43C /* Array+Extensions.swift in Sources */,
                975059032B588B1D00BA6917 /* PlaybackSettingsView.swift in Sources */,
                97B651172BAB67E500605D44 /* Tag.swift in Sources */,
                97E718532B8FA5D90011D43C /* InitializationState.swift in Sources */,
                9711301F2B7368F40024BD81 /* MainViewSingleSelectionContextMenuItemView.swift in Sources */,
                975D9F542B7D82E400473CA9 /* AlertManager.swift in Sources */,
                9767ADD62BA2509D00449AB9 /* TimedPlaybackData.swift in Sources */,
                972B40752B89CF3E00F0118C /* HapticsSettingsView.swift in Sources */,
                97B6511A2BAB681A00605D44 /* AddMenuView.swift in Sources */,
                975BF67B2B7C31B80061D332 /* ImageAssetManager.swift in Sources */,
                9735F4EF2947F1C600DE1D7E /* DownloadObserver.swift in Sources */,
                97C633422BA8AC16005DE243 /* PlaylistsMenuView.swift in Sources */,
                97DE91B82B6EF1BD003D20E8 /* MainViewImageView.swift in Sources */,
                976308452B8915AF006D7622 /* EventViewData.swift in Sources */,
                975134772B5497960018A62A /* AssetSelectionManager.swift in Sources */,
                97F91C4B2B8C07B900FBCF7A /* KeyEventBlocks.swift in Sources */,
                97E718662B8FDC690011D43C /* SmartEditOption.swift in Sources */,
                975134582B51D7150018A62A /* AudioTrackEditManager.swift in Sources */,
                975058EF2B58419800BA6917 /* AudioAsset+Preview.swift in Sources */,
                97E718A62B9674080011D43C /* Settings+AppVersion.swift in Sources */,
                97E7188D2B92690D0011D43C /* MultiEditValue.swift in Sources */,
                97480C682B96C37F002DE830 /* ButtonPicker.swift in Sources */,
                97831D962BA0171F00C4BBE7 /* MultiEditRangeValue.swift in Sources */,
                977251C52B589DAA00DE66FE /* AudioTrackEditSheet.swift in Sources */,
                97480C622B96B80B002DE830 /* SettingsPickerElement.swift in Sources */,
                97E718562B8FA8290011D43C /* AppErrorView.swift in Sources */,
                97356D612B7300D100FEB860 /* ArtworkView.swift in Sources */,
                9725902E294A71F9004310CD /* PlayerEvent.swift in Sources */,
                972B406D2B89A0DF00F0118C /* GroupedBookmarkViewData.swift in Sources */,
                975058F72B584CB600BA6917 /* AudiosaicSettingsPath.swift in Sources */,
                978196762B50A5CE00C3FF82 /* PlaybackRecord+CoreDataStored.swift in Sources */,
                9767ADD92BA250BB00449AB9 /* TimerDataView.swift in Sources */,
                9767ADDC2BA37D1A00449AB9 /* TimeRounding.swift in Sources */,
                9725906C294FE014004310CD /* Logging.swift in Sources */,
                9778F5322B4F62320028BB53 /* SessionStateMachine+Debug.swift in Sources */,
                97328C762B840881001AA422 /* EventHistoryManager.swift in Sources */,
                975023A127E1A69300D773B5 /* Const.swift in Sources */,
                9751348E2B54FDC60018A62A /* WindowForegroundManager.swift in Sources */,
                9763083B2B88619A006D7622 /* AppleDevice.swift in Sources */,
                97B8A3092B6C88900097D232 /* MainViewModel+iOS.swift in Sources */,
                97480C742B97AECF002DE830 /* PlaybackManager+iOS.swift in Sources */,
                9711301B2B7368BA0024BD81 /* DefaultContextMenuItems.swift in Sources */,
                971EDFD12B7581040059888A /* CatalogSettingsView.swift in Sources */,
                9735F51F29491A5800DE1D7E /* ProgressViewData.swift in Sources */,
                9725905E294E9CB7004310CD /* ProvisionallyPlayingSM.swift in Sources */,
                9735F5112948483800DE1D7E /* CircularProgressView.swift in Sources */,
                971C64BB2B4DE3F300C97731 /* ImportView.swift in Sources */,
                9706889627ECF1790018BFF6 /* DragLocation.swift in Sources */,
                97B8A3062B6C87480097D232 /* MainViewModel+Import.swift in Sources */,
                97C633522BA8AFB4005DE243 /* Playlist.swift in Sources */,
                9778F5282B4F61460028BB53 /* StateMachine.swift in Sources */,
                97AEBE6A2BA4313800B1C867 /* RecentTimedPlaybackEventsStore.swift in Sources */,
                971C64BA2B4DE3F000C97731 /* ImportViewModel.swift in Sources */,
                975058E82B5771B100BA6917 /* WindowForegroundObserver.swift in Sources */,
                97E882CD2B59952D00BA5B08 /* MainToolbar+iOS.swift in Sources */,
                976C1CDD2B44C70900E2BF19 /* GeneralDebugging.swift in Sources */,
                97AEBE702BA4B0F600B1C867 /* PlaybackSpeedToggleButton.swift in Sources */,
                97579E622B9A8E7500843C77 /* DropManager.swift in Sources */,
                97A4FEAB2B59EA2500F25DF6 /* Mpeg4AudioSharedAsset.swift in Sources */,
                972B40622B896F3D00F0118C /* BookmarksSheet.swift in Sources */,
                97AEBE6D2BA43D3000B1C867 /* BookmarkMenuElementView.swift in Sources */,
                971C64A22B4DE0BF00C97731 /* Transitions.swift in Sources */,
                97C6335B2BA8B004005DE243 /* SmartPlaylist.swift in Sources */,
                97E718692B90F47D0011D43C /* View+Sheet.swift in Sources */,
                9781967F2B51ADEA00C3FF82 /* AudioTrackEditView.swift in Sources */,
                975058F52B584CAF00BA6917 /* AudiosaicSettingsView.swift in Sources */,
                97E718772B91116B0011D43C /* RegularExpressionAlertViewModel.swift in Sources */,
                9750238A27E1389E00D773B5 /* MainViewModel.swift in Sources */,
                971EDFD72B7A8E3D0059888A /* LockscreenSettingsView.swift in Sources */,
                97831DA02BA0F93A00C4BBE7 /* ChapterEntity.swift in Sources */,
                971C64CB2B4DE64A00C97731 /* MainToolbarElement.swift in Sources */,
                975058FD2B586DA400BA6917 /* Import+Errors.swift in Sources */,
                973BD0CA2B68196400F9EE9E /* AudioAssetContentStore.swift in Sources */,
                97E718632B8FDA960011D43C /* EditViewElement.swift in Sources */,
                97831D9C2BA0F4B100C4BBE7 /* AVAsset+Extensions.swift in Sources */,
                97328C792B8515B5001AA422 /* HistorySettingsView.swift in Sources */,
                97B651322BABA92500605D44 /* ContextContainer.swift in Sources */,
                97E718812B91586E0011D43C /* EditSheets.swift in Sources */,
                97480C712B97A781002DE830 /* AVAudioSession+Combine.swift in Sources */,
                971C64CD2B4DE64A00C97731 /* TButton+Extensions.swift in Sources */,
                9750238C27E14A9100D773B5 /* MusicPlayerViewModel.swift in Sources */,
                975058F82B584CB900BA6917 /* GeneralSettingsView.swift in Sources */,
                97259031294A92F2004310CD /* PlayerStateMachine.swift in Sources */,
                97E718A02B9673B50011D43C /* SettingsLabel.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        976089FE2951448200B0532C /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                97608A102951450D00B0532C /* Transition.swift in Sources */,
                97608A112951451100B0532C /* TestEventLogger.swift in Sources */,
                97608A0F2951450700B0532C /* MockTimer.swift in Sources */,
                97608A0D2951448F00B0532C /* SessionStateTests.swift in Sources */,
                97E7187C2B912EFB0011D43C /* EditTests.swift in Sources */,
                97608A0E2951448F00B0532C /* Assertions.swift in Sources */,
                97608A0C2951448F00B0532C /* ProvisionallyPlayingSMTests.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXSourcesBuildPhase section */

/* Begin PBXTargetDependency section */
        97259029294A5DBE004310CD /* PBXTargetDependency */ = {
            isa = PBXTargetDependency;
            target = 9735F4C32947B83200DE1D7E /* Audiosaic Desktop */;
            targetProxy = 97259028294A5DBE004310CD /* PBXContainerItemProxy */;
        };
        976089FD2951433E00B0532C /* PBXTargetDependency */ = {
            isa = PBXTargetDependency;
            target = 9750236E27DFE4C900D773B5 /* Audiosaic */;
            targetProxy = 976089FC2951433E00B0532C /* PBXContainerItemProxy */;
        };
        97608A072951448200B0532C /* PBXTargetDependency */ = {
            isa = PBXTargetDependency;
            target = 9750236E27DFE4C900D773B5 /* Audiosaic */;
            targetProxy = 97608A062951448200B0532C /* PBXContainerItemProxy */;
        };
/* End PBXTargetDependency section */

/* Begin XCBuildConfiguration section */
        9725902A294A5DBE004310CD /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                BUNDLE_LOADER = "$(TEST_HOST)";
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEAD_CODE_STRIPPING = YES;
                DEVELOPMENT_TEAM = D7MN23CD5F;
                GCC_PREPROCESSOR_DEFINITIONS = "TESTING=1";
                GENERATE_INFOPLIST_FILE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 16.1;
                MACOSX_DEPLOYMENT_TARGET = 13.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.UnitTests;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = auto;
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx";
                SUPPORTS_MACCATALYST = NO;
                SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG TESTING";
                SWIFT_EMIT_LOC_STRINGS = NO;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = 1;
                TEST_HOST = "$(BUILT_PRODUCTS_DIR)/MacOSAudiosaic.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/MacOSAudiosaic";
            };
            name = Debug;
        };
        9725902B294A5DBE004310CD /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                BUNDLE_LOADER = "$(TEST_HOST)";
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEAD_CODE_STRIPPING = YES;
                DEVELOPMENT_TEAM = D7MN23CD5F;
                GCC_PREPROCESSOR_DEFINITIONS = "TESTING=1";
                GENERATE_INFOPLIST_FILE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 16.1;
                MACOSX_DEPLOYMENT_TARGET = 13.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.UnitTests;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = auto;
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx";
                SUPPORTS_MACCATALYST = NO;
                SWIFT_EMIT_LOC_STRINGS = NO;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = 1;
                TEST_HOST = "$(BUILT_PRODUCTS_DIR)/MacOSAudiosaic.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/MacOSAudiosaic";
            };
            name = Release;
        };
        9735F4D12947B83400DE1D7E /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CODE_SIGN_ENTITLEMENTS = MacOSAudiosaic/MacOSAudiosaic.entitlements;
                CODE_SIGN_STYLE = Automatic;
                COMBINE_HIDPI_IMAGES = YES;
                CURRENT_PROJECT_VERSION = 11;
                DEAD_CODE_STRIPPING = YES;
                DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
                DEVELOPMENT_ASSET_PATHS = "\\"MacOSAudiosaic/Preview Content\\"";
                DEVELOPMENT_TEAM = D7MN23CD5F;
                ENABLE_HARDENED_RUNTIME = YES;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = MacOSAudiosaic/Info.plist;
                INFOPLIST_KEY_CFBundleDisplayName = Audiosaic;
                INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.entertainment";
                INFOPLIST_KEY_NSHumanReadableCopyright = "Axel Ancona Esselmann";
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/../Frameworks",
                );
                MACOSX_DEPLOYMENT_TARGET = 14.0;
                MARKETING_VERSION = 1.0.0;
                OTHER_LDFLAGS = (
                    "\\"-Wl,-no_warn_duplicate_libraries\\"",
                    "-ObjC",
                );
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.Audiosaic;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = macosx;
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
            };
            name = Debug;
        };
        9735F4D22947B83400DE1D7E /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CODE_SIGN_ENTITLEMENTS = MacOSAudiosaic/MacOSAudiosaic.entitlements;
                CODE_SIGN_STYLE = Automatic;
                COMBINE_HIDPI_IMAGES = YES;
                CURRENT_PROJECT_VERSION = 11;
                DEAD_CODE_STRIPPING = YES;
                DEVELOPMENT_ASSET_PATHS = "\\"MacOSAudiosaic/Preview Content\\"";
                DEVELOPMENT_TEAM = D7MN23CD5F;
                ENABLE_HARDENED_RUNTIME = YES;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = MacOSAudiosaic/Info.plist;
                INFOPLIST_KEY_CFBundleDisplayName = Audiosaic;
                INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.entertainment";
                INFOPLIST_KEY_NSHumanReadableCopyright = "Axel Ancona Esselmann";
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/../Frameworks",
                );
                MACOSX_DEPLOYMENT_TARGET = 14.0;
                MARKETING_VERSION = 1.0.0;
                OTHER_LDFLAGS = (
                    "\\"-Wl,-no_warn_duplicate_libraries\\"",
                    "-ObjC",
                );
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.Audiosaic;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = macosx;
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
            };
            name = Release;
        };
        9750237B27DFE4CA00D773B5 /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++17";
                CLANG_CXX_LIBRARY = "libc++";
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
                GCC_C_LANGUAGE_STANDARD = gnu11;
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
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                MACOSX_DEPLOYMENT_TARGET = 14.0;
                MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
                MTL_FAST_MATH = YES;
                ONLY_ACTIVE_ARCH = YES;
                SDKROOT = iphoneos;
                SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
                SWIFT_OPTIMIZATION_LEVEL = "-Onone";
            };
            name = Debug;
        };
        9750237C27DFE4CA00D773B5 /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++17";
                CLANG_CXX_LIBRARY = "libc++";
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
                GCC_C_LANGUAGE_STANDARD = gnu11;
                GCC_NO_COMMON_BLOCKS = YES;
                GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
                GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
                GCC_WARN_UNDECLARED_SELECTOR = YES;
                GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
                GCC_WARN_UNUSED_FUNCTION = YES;
                GCC_WARN_UNUSED_VARIABLE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                MACOSX_DEPLOYMENT_TARGET = 14.0;
                MTL_ENABLE_DEBUG_INFO = NO;
                MTL_FAST_MATH = YES;
                SDKROOT = iphoneos;
                SWIFT_COMPILATION_MODE = wholemodule;
                SWIFT_OPTIMIZATION_LEVEL = "-O";
                VALIDATE_PRODUCT = YES;
            };
            name = Release;
        };
        9750237E27DFE4CA00D773B5 /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_ENTITLEMENTS = Audiosaic/Audiosaic.entitlements;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 11;
                DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
                DEVELOPMENT_ASSET_PATHS = "\\"Audiosaic/Preview Content\\"";
                DEVELOPMENT_TEAM = D7MN23CD5F;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = Audiosaic/Info.plist;
                INFOPLIST_KEY_CFBundleDisplayName = Audiosaic;
                INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.entertainment";
                INFOPLIST_KEY_LSSupportsOpeningDocumentsInPlace = YES;
                INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
                INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
                INFOPLIST_KEY_UILaunchScreen_Generation = YES;
                INFOPLIST_KEY_UISupportedInterfaceOrientations = UIInterfaceOrientationPortrait;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/Frameworks",
                );
                MARKETING_VERSION = 1.0.0;
                OTHER_LDFLAGS = (
                    "-ObjC",
                    "\\"-Wl,-no_warn_duplicate_libraries\\"",
                );
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.Audiosaic;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator";
                SUPPORTS_MACCATALYST = NO;
                SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD = NO;
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = 1;
            };
            name = Debug;
        };
        9750237F27DFE4CA00D773B5 /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_ENTITLEMENTS = Audiosaic/Audiosaic.entitlements;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 11;
                DEVELOPMENT_ASSET_PATHS = "\\"Audiosaic/Preview Content\\"";
                DEVELOPMENT_TEAM = D7MN23CD5F;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = Audiosaic/Info.plist;
                INFOPLIST_KEY_CFBundleDisplayName = Audiosaic;
                INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.entertainment";
                INFOPLIST_KEY_LSSupportsOpeningDocumentsInPlace = YES;
                INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
                INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
                INFOPLIST_KEY_UILaunchScreen_Generation = YES;
                INFOPLIST_KEY_UISupportedInterfaceOrientations = UIInterfaceOrientationPortrait;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/Frameworks",
                );
                MARKETING_VERSION = 1.0.0;
                OTHER_LDFLAGS = (
                    "-ObjC",
                    "\\"-Wl,-no_warn_duplicate_libraries\\"",
                );
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.Audiosaic;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator";
                SUPPORTS_MACCATALYST = NO;
                SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD = NO;
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = 1;
            };
            name = Release;
        };
        97608A092951448200B0532C /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                BUNDLE_LOADER = "$(TEST_HOST)";
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_TEAM = D7MN23CD5F;
                GCC_PREPROCESSOR_DEFINITIONS = (
                    "DEBUG=1",
                    "$(inherited)",
                    "TESTING=1",
                );
                GENERATE_INFOPLIST_FILE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.IosUnitTests;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator";
                SUPPORTS_MACCATALYST = NO;
                SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD = NO;
                SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG TESTING";
                SWIFT_EMIT_LOC_STRINGS = NO;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = 1;
                TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Audiosaic.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Audiosaic";
            };
            name = Debug;
        };
        97608A0A2951448200B0532C /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                BUNDLE_LOADER = "$(TEST_HOST)";
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_TEAM = D7MN23CD5F;
                GENERATE_INFOPLIST_FILE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.IosUnitTests;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator";
                SUPPORTS_MACCATALYST = NO;
                SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD = NO;
                SWIFT_EMIT_LOC_STRINGS = NO;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = 1;
                TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Audiosaic.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Audiosaic";
            };
            name = Release;
        };
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
        9725902C294A5DBE004310CD /* Build configuration list for PBXNativeTarget "UnitTests" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                9725902A294A5DBE004310CD /* Debug */,
                9725902B294A5DBE004310CD /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        9735F4D02947B83400DE1D7E /* Build configuration list for PBXNativeTarget "Audiosaic Desktop" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                9735F4D12947B83400DE1D7E /* Debug */,
                9735F4D22947B83400DE1D7E /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        9750236A27DFE4C900D773B5 /* Build configuration list for PBXProject "Audiosaic" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                9750237B27DFE4CA00D773B5 /* Debug */,
                9750237C27DFE4CA00D773B5 /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        9750237D27DFE4CA00D773B5 /* Build configuration list for PBXNativeTarget "Audiosaic" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                9750237E27DFE4CA00D773B5 /* Debug */,
                9750237F27DFE4CA00D773B5 /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        97608A082951448200B0532C /* Build configuration list for PBXNativeTarget "IosUnitTests" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                97608A092951448200B0532C /* Debug */,
                97608A0A2951448200B0532C /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
/* End XCConfigurationList section */

/* Begin XCLocalSwiftPackageReference section */
        971C64802B4C97B100C97731 /* XCLocalSwiftPackageReference "../AxelPods/KeyPressEventManager" */ = {
            isa = XCLocalSwiftPackageReference;
            relativePath = ../AxelPods/KeyPressEventManager;
        };
        972B40962B8B359500F0118C /* XCLocalSwiftPackageReference "../AxelPods/ProgrammaticCoreData" */ = {
            isa = XCLocalSwiftPackageReference;
            relativePath = ../AxelPods/ProgrammaticCoreData;
        };
        9778F5132B4F50880028BB53 /* XCLocalSwiftPackageReference "../AxelPods/SwiftUISettings" */ = {
            isa = XCLocalSwiftPackageReference;
            relativePath = ../AxelPods/SwiftUISettings;
        };
        97B8A2FA2B6C31930097D232 /* XCLocalSwiftPackageReference "../AxelPods/NestedTable" */ = {
            isa = XCLocalSwiftPackageReference;
            relativePath = ../AxelPods/NestedTable;
        };
/* End XCLocalSwiftPackageReference section */

/* Begin XCRemoteSwiftPackageReference section */
        971C646C2B4C8F3800C97731 /* XCRemoteSwiftPackageReference "LoadableView" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = /Users/axelanconaesselmann/Documents/SwiftIOS/AxelPods/LoadableView;
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.3.9;
            };
        };
        971C64992B4DDE7C00C97731 /* XCRemoteSwiftPackageReference "LoadingManager" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/LoadingManager";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.1;
            };
        };
        971C64BF2B4DE41000C97731 /* XCRemoteSwiftPackageReference "ToolbarManager" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/ToolbarManager";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.1;
            };
        };
        975058DE2B5667F500BA6917 /* XCRemoteSwiftPackageReference "FileUrlExtensions" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/FileUrlExtensions";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.2;
            };
        };
        975134642B52114F0018A62A /* XCRemoteSwiftPackageReference "ID3TagEditor" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/chicio/ID3TagEditor.git";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 4.6.0;
            };
        };
        97579E5C2B9A61C200843C77 /* XCRemoteSwiftPackageReference "CoreDataStored" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/CoreDataStored";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.7;
            };
        };
        976C1CD82B422B3F00E2BF19 /* XCRemoteSwiftPackageReference "AppRoving" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/AppRoving";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.3.25;
            };
        };
        9778F4D82B4F28B60028BB53 /* XCRemoteSwiftPackageReference "WindowManager" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/WindowManager";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.1;
            };
        };
        9778F4E82B4F36E00028BB53 /* XCRemoteSwiftPackageReference "UserPreferences" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/anconaesselmann/UserPreferences/";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 0.0.6;
            };
        };
        9778F5392B4FC9AD0028BB53 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "https://github.com/firebase/firebase-ios-sdk.git";
            requirement = {
                kind = upToNextMajorVersion;
                minimumVersion = 10.19.1;
            };
        };
/* End XCRemoteSwiftPackageReference section */

/* Begin XCSwiftPackageProductDependency section */
        971130152B7363420024BD81 /* NestedTable */ = {
            isa = XCSwiftPackageProductDependency;
            productName = NestedTable;
        };
        971C646D2B4C8F3800C97731 /* LoadableView */ = {
            isa = XCSwiftPackageProductDependency;
            package = 971C646C2B4C8F3800C97731 /* XCRemoteSwiftPackageReference "LoadableView" */;
            productName = LoadableView;
        };
        971C646F2B4C8F4500C97731 /* LoadableView */ = {
            isa = XCSwiftPackageProductDependency;
            package = 971C646C2B4C8F3800C97731 /* XCRemoteSwiftPackageReference "LoadableView" */;
            productName = LoadableView;
        };
        971C64812B4C97B100C97731 /* KeyPressEventManager */ = {
            isa = XCSwiftPackageProductDependency;
            productName = KeyPressEventManager;
        };
        971C64832B4C97C400C97731 /* KeyPressEventManager */ = {
            isa = XCSwiftPackageProductDependency;
            productName = KeyPressEventManager;
        };
        971C649A2B4DDE7C00C97731 /* LoadingManager */ = {
            isa = XCSwiftPackageProductDependency;
            package = 971C64992B4DDE7C00C97731 /* XCRemoteSwiftPackageReference "LoadingManager" */;
            productName = LoadingManager;
        };
        971C649C2B4DDE8500C97731 /* LoadingManager */ = {
            isa = XCSwiftPackageProductDependency;
            package = 971C64992B4DDE7C00C97731 /* XCRemoteSwiftPackageReference "LoadingManager" */;
            productName = LoadingManager;
        };
        971C64C02B4DE41000C97731 /* ToolbarManager */ = {
            isa = XCSwiftPackageProductDependency;
            package = 971C64BF2B4DE41000C97731 /* XCRemoteSwiftPackageReference "ToolbarManager" */;
            productName = ToolbarManager;
        };
        971C64C22B4DE41800C97731 /* ToolbarManager */ = {
            isa = XCSwiftPackageProductDependency;
            package = 971C64BF2B4DE41000C97731 /* XCRemoteSwiftPackageReference "ToolbarManager" */;
            productName = ToolbarManager;
        };
        972B40972B8B359500F0118C /* ProgrammaticCoreData */ = {
            isa = XCSwiftPackageProductDependency;
            productName = ProgrammaticCoreData;
        };
        972B40992B8B35BA00F0118C /* ProgrammaticCoreData */ = {
            isa = XCSwiftPackageProductDependency;
            productName = ProgrammaticCoreData;
        };
        975058DF2B5667F500BA6917 /* FileUrlExtensions */ = {
            isa = XCSwiftPackageProductDependency;
            package = 975058DE2B5667F500BA6917 /* XCRemoteSwiftPackageReference "FileUrlExtensions" */;
            productName = FileUrlExtensions;
        };
        975058E12B5667FE00BA6917 /* FileUrlExtensions */ = {
            isa = XCSwiftPackageProductDependency;
            package = 975058DE2B5667F500BA6917 /* XCRemoteSwiftPackageReference "FileUrlExtensions" */;
            productName = FileUrlExtensions;
        };
        975058F32B584BC500BA6917 /* SwiftUISettings */ = {
            isa = XCSwiftPackageProductDependency;
            productName = SwiftUISettings;
        };
        975134652B52114F0018A62A /* ID3TagEditor */ = {
            isa = XCSwiftPackageProductDependency;
            package = 975134642B52114F0018A62A /* XCRemoteSwiftPackageReference "ID3TagEditor" */;
            productName = ID3TagEditor;
        };
        975134672B52115D0018A62A /* ID3TagEditor */ = {
            isa = XCSwiftPackageProductDependency;
            package = 975134642B52114F0018A62A /* XCRemoteSwiftPackageReference "ID3TagEditor" */;
            productName = ID3TagEditor;
        };
        97579E5D2B9A61C200843C77 /* CoreDataStored */ = {
            isa = XCSwiftPackageProductDependency;
            package = 97579E5C2B9A61C200843C77 /* XCRemoteSwiftPackageReference "CoreDataStored" */;
            productName = CoreDataStored;
        };
        97579E5F2B9A61CF00843C77 /* CoreDataStored */ = {
            isa = XCSwiftPackageProductDependency;
            package = 97579E5C2B9A61C200843C77 /* XCRemoteSwiftPackageReference "CoreDataStored" */;
            productName = CoreDataStored;
        };
        976C1CD92B422BC400E2BF19 /* AppRoving */ = {
            isa = XCSwiftPackageProductDependency;
            package = 976C1CD82B422B3F00E2BF19 /* XCRemoteSwiftPackageReference "AppRoving" */;
            productName = AppRoving;
        };
        976C1CDF2B44C73A00E2BF19 /* AppRoving */ = {
            isa = XCSwiftPackageProductDependency;
            package = 976C1CD82B422B3F00E2BF19 /* XCRemoteSwiftPackageReference "AppRoving" */;
            productName = AppRoving;
        };
        9778F4D92B4F28B60028BB53 /* WindowManager */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F4D82B4F28B60028BB53 /* XCRemoteSwiftPackageReference "WindowManager" */;
            productName = WindowManager;
        };
        9778F4E92B4F36E00028BB53 /* UserPreferences */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F4E82B4F36E00028BB53 /* XCRemoteSwiftPackageReference "UserPreferences" */;
            productName = UserPreferences;
        };
        9778F4EB2B4F36E80028BB53 /* UserPreferences */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F4E82B4F36E00028BB53 /* XCRemoteSwiftPackageReference "UserPreferences" */;
            productName = UserPreferences;
        };
        9778F5142B4F50880028BB53 /* SwiftUISettings */ = {
            isa = XCSwiftPackageProductDependency;
            productName = SwiftUISettings;
        };
        9778F53A2B4FC9AD0028BB53 /* FirebaseAnalytics */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F5392B4FC9AD0028BB53 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
            productName = FirebaseAnalytics;
        };
        9778F53C2B4FC9AD0028BB53 /* FirebaseCrashlytics */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F5392B4FC9AD0028BB53 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
            productName = FirebaseCrashlytics;
        };
        9778F53E2B4FC9C40028BB53 /* FirebaseAnalytics */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F5392B4FC9AD0028BB53 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
            productName = FirebaseAnalytics;
        };
        9778F5402B4FC9C40028BB53 /* FirebaseCrashlytics */ = {
            isa = XCSwiftPackageProductDependency;
            package = 9778F5392B4FC9AD0028BB53 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
            productName = FirebaseCrashlytics;
        };
        978196792B50FD6C00C3FF82 /* CoreDataStored */ = {
            isa = XCSwiftPackageProductDependency;
            productName = CoreDataStored;
        };
        9781967B2B5128CC00C3FF82 /* CoreDataStored */ = {
            isa = XCSwiftPackageProductDependency;
            productName = CoreDataStored;
        };
        97B8A2FB2B6C31930097D232 /* NestedTable */ = {
            isa = XCSwiftPackageProductDependency;
            productName = NestedTable;
        };
/* End XCSwiftPackageProductDependency section */
    };
    rootObject = 9750236727DFE4C900D773B5 /* Project object */;
}
"""

let mockProjectLocal = """
// !$*UTF8*$!
{
    archiveVersion = 1;
    classes = {
    };
    objectVersion = 60;
    objects = {

/* Begin PBXBuildFile section */
        970655852BFBFB3F00414BCC /* ContentViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 970655842BFBFB3F00414BCC /* ContentViewModel.swift */; };
        9729F17F2C07EBA700C39506 /* XProjParser in Frameworks */ = {isa = PBXBuildFile; productRef = 9729F17E2C07EBA700C39506 /* XProjParser */; };
        977D31CD2C07F56C00F08EDA /* Dependencies.swift in Sources */ = {isa = PBXBuildFile; fileRef = 977D31CC2C07F56C00F08EDA /* Dependencies.swift */; };
        97ADAC292BEC255C00F5DB84 /* LoadableResult.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97ADAC282BEC255C00F5DB84 /* LoadableResult.swift */; };
        97ADAC2C2BEC255E00F5DB84 /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 97ADAC2B2BEC255E00F5DB84 /* Assets.xcassets */; };
        97ADAC2F2BEC255E00F5DB84 /* PackageManagerManagerApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97ADAC2E2BEC255E00F5DB84 /* PackageManagerManagerApp.swift */; };
        97ADAC322BEC255E00F5DB84 /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97ADAC312BEC255E00F5DB84 /* ContentView.swift */; };
        97ADAC342BEC255E00F5DB84 /* AppInitializer.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97ADAC332BEC255E00F5DB84 /* AppInitializer.swift */; };
        97ADAC362BEC255E00F5DB84 /* AppState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97ADAC352BEC255E00F5DB84 /* AppState.swift */; };
        97ADAC3A2BEC255E00F5DB84 /* Preview Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 97ADAC392BEC255E00F5DB84 /* Preview Assets.xcassets */; };
        97B55DE02BF7F59300DDE6A6 /* Dependency.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B55DDF2BF7F59300DDE6A6 /* Dependency.swift */; };
        97B55DE22BF7F5A100DDE6A6 /* Target.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B55DE12BF7F5A100DDE6A6 /* Target.swift */; };
        97B55DE42BF7F5B100DDE6A6 /* RemoteVersionBehavior.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B55DE32BF7F5B100DDE6A6 /* RemoteVersionBehavior.swift */; };
        97B55DE72BF7FE3600DDE6A6 /* TargetManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97B55DE62BF7FE3600DDE6A6 /* TargetManager.swift */; };
        97D877F62BEECA8E004F0D24 /* mock.swift in Sources */ = {isa = PBXBuildFile; fileRef = 97D877F32BEECA8E004F0D24 /* mock.swift */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
        970655842BFBFB3F00414BCC /* ContentViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentViewModel.swift; sourceTree = "<group>"; };
        977D31CC2C07F56C00F08EDA /* Dependencies.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Dependencies.swift; sourceTree = "<group>"; };
        97ADAC252BEC255C00F5DB84 /* PackageManagerManager.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = PackageManagerManager.app; sourceTree = BUILT_PRODUCTS_DIR; };
        97ADAC282BEC255C00F5DB84 /* LoadableResult.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LoadableResult.swift; sourceTree = "<group>"; };
        97ADAC2B2BEC255E00F5DB84 /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
        97ADAC2E2BEC255E00F5DB84 /* PackageManagerManagerApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PackageManagerManagerApp.swift; sourceTree = "<group>"; };
        97ADAC312BEC255E00F5DB84 /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
        97ADAC332BEC255E00F5DB84 /* AppInitializer.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppInitializer.swift; sourceTree = "<group>"; };
        97ADAC352BEC255E00F5DB84 /* AppState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppState.swift; sourceTree = "<group>"; };
        97ADAC372BEC255E00F5DB84 /* PackageManagerManager.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = PackageManagerManager.entitlements; sourceTree = "<group>"; };
        97ADAC392BEC255E00F5DB84 /* Preview Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = "Preview Assets.xcassets"; sourceTree = "<group>"; };
        97ADAC3B2BEC255E00F5DB84 /* README.MD */ = {isa = PBXFileReference; lastKnownFileType = net.daringfireball.markdown; name = README.MD; path = ../../README.MD; sourceTree = "<group>"; };
        97B55DDF2BF7F59300DDE6A6 /* Dependency.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Dependency.swift; sourceTree = "<group>"; };
        97B55DE12BF7F5A100DDE6A6 /* Target.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Target.swift; sourceTree = "<group>"; };
        97B55DE32BF7F5B100DDE6A6 /* RemoteVersionBehavior.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RemoteVersionBehavior.swift; sourceTree = "<group>"; };
        97B55DE62BF7FE3600DDE6A6 /* TargetManager.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TargetManager.swift; sourceTree = "<group>"; };
        97D877F32BEECA8E004F0D24 /* mock.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = mock.swift; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
        97ADAC222BEC255C00F5DB84 /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
                9729F17F2C07EBA700C39506 /* XProjParser in Frameworks */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
        97ADAC1C2BEC255C00F5DB84 = {
            isa = PBXGroup;
            children = (
                97ADAC272BEC255C00F5DB84 /* PackageManagerManager */,
                97ADAC262BEC255C00F5DB84 /* Products */,
            );
            sourceTree = "<group>";
        };
        97ADAC262BEC255C00F5DB84 /* Products */ = {
            isa = PBXGroup;
            children = (
                97ADAC252BEC255C00F5DB84 /* PackageManagerManager.app */,
            );
            name = Products;
            sourceTree = "<group>";
        };
        97ADAC272BEC255C00F5DB84 /* PackageManagerManager */ = {
            isa = PBXGroup;
            children = (
                97D877F32BEECA8E004F0D24 /* mock.swift */,
                977D31CC2C07F56C00F08EDA /* Dependencies.swift */,
                97B55DDE2BF7F57F00DDE6A6 /* SpmmTools */,
                97ADAC282BEC255C00F5DB84 /* LoadableResult.swift */,
                97ADAC2A2BEC255E00F5DB84 /* Constants */,
                97ADAC2D2BEC255E00F5DB84 /* App */,
                97ADAC302BEC255E00F5DB84 /* UI */,
                97B55DE52BF7FE1B00DDE6A6 /* Managers */,
                97ADAC382BEC255E00F5DB84 /* Preview Content */,
            );
            path = PackageManagerManager;
            sourceTree = "<group>";
        };
        97ADAC2A2BEC255E00F5DB84 /* Constants */ = {
            isa = PBXGroup;
            children = (
                97ADAC2B2BEC255E00F5DB84 /* Assets.xcassets */,
            );
            path = Constants;
            sourceTree = "<group>";
        };
        97ADAC2D2BEC255E00F5DB84 /* App */ = {
            isa = PBXGroup;
            children = (
                97ADAC2E2BEC255E00F5DB84 /* PackageManagerManagerApp.swift */,
                97ADAC332BEC255E00F5DB84 /* AppInitializer.swift */,
                97ADAC352BEC255E00F5DB84 /* AppState.swift */,
                97ADAC372BEC255E00F5DB84 /* PackageManagerManager.entitlements */,
                97ADAC3B2BEC255E00F5DB84 /* README.MD */,
            );
            path = App;
            sourceTree = "<group>";
        };
        97ADAC302BEC255E00F5DB84 /* UI */ = {
            isa = PBXGroup;
            children = (
                97ADAC312BEC255E00F5DB84 /* ContentView.swift */,
                970655842BFBFB3F00414BCC /* ContentViewModel.swift */,
            );
            path = UI;
            sourceTree = "<group>";
        };
        97ADAC382BEC255E00F5DB84 /* Preview Content */ = {
            isa = PBXGroup;
            children = (
                97ADAC392BEC255E00F5DB84 /* Preview Assets.xcassets */,
            );
            path = "Preview Content";
            sourceTree = "<group>";
        };
        97B55DDE2BF7F57F00DDE6A6 /* SpmmTools */ = {
            isa = PBXGroup;
            children = (
                97B55DDF2BF7F59300DDE6A6 /* Dependency.swift */,
                97B55DE12BF7F5A100DDE6A6 /* Target.swift */,
                97B55DE32BF7F5B100DDE6A6 /* RemoteVersionBehavior.swift */,
            );
            path = SpmmTools;
            sourceTree = "<group>";
        };
        97B55DE52BF7FE1B00DDE6A6 /* Managers */ = {
            isa = PBXGroup;
            children = (
                97B55DE62BF7FE3600DDE6A6 /* TargetManager.swift */,
            );
            path = Managers;
            sourceTree = "<group>";
        };
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
        97ADAC242BEC255C00F5DB84 /* PackageManagerManager */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 97ADAC3E2BEC255E00F5DB84 /* Build configuration list for PBXNativeTarget "PackageManagerManager" */;
            buildPhases = (
                97ADAC212BEC255C00F5DB84 /* Sources */,
                97ADAC222BEC255C00F5DB84 /* Frameworks */,
                97ADAC232BEC255C00F5DB84 /* Resources */,
            );
            buildRules = (
            );
            dependencies = (
            );
            name = PackageManagerManager;
            packageProductDependencies = (
                9729F17E2C07EBA700C39506 /* XProjParser */,
            );
            productName = PackageManagerManager;
            productReference = 97ADAC252BEC255C00F5DB84 /* PackageManagerManager.app */;
            productType = "com.apple.product-type.application";
        };
/* End PBXNativeTarget section */

/* Begin PBXProject section */
        97ADAC1D2BEC255C00F5DB84 /* Project object */ = {
            isa = PBXProject;
            attributes = {
                BuildIndependentTargetsInParallel = 1;
                LastSwiftUpdateCheck = 1530;
                LastUpgradeCheck = 1530;
                TargetAttributes = {
                    97ADAC242BEC255C00F5DB84 = {
                        CreatedOnToolsVersion = 15.3;
                    };
                };
            };
            buildConfigurationList = 97ADAC202BEC255C00F5DB84 /* Build configuration list for PBXProject "PackageManagerManager" */;
            compatibilityVersion = "Xcode 14.0";
            developmentRegion = en;
            hasScannedForEncodings = 0;
            knownRegions = (
                en,
                Base,
            );
            mainGroup = 97ADAC1C2BEC255C00F5DB84;
            packageReferences = (
                9729F17D2C07EBA700C39506 /* XCLocalSwiftPackageReference "../AxelPods/XProjParser" */,
            );
            productRefGroup = 97ADAC262BEC255C00F5DB84 /* Products */;
            projectDirPath = "";
            projectRoot = "";
            targets = (
                97ADAC242BEC255C00F5DB84 /* PackageManagerManager */,
            );
        };
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
        97ADAC232BEC255C00F5DB84 /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                97ADAC3A2BEC255E00F5DB84 /* Preview Assets.xcassets in Resources */,
                97ADAC2C2BEC255E00F5DB84 /* Assets.xcassets in Resources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
        97ADAC212BEC255C00F5DB84 /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                977D31CD2C07F56C00F08EDA /* Dependencies.swift in Sources */,
                97B55DE22BF7F5A100DDE6A6 /* Target.swift in Sources */,
                97ADAC342BEC255E00F5DB84 /* AppInitializer.swift in Sources */,
                97B55DE72BF7FE3600DDE6A6 /* TargetManager.swift in Sources */,
                97D877F62BEECA8E004F0D24 /* mock.swift in Sources */,
                97B55DE02BF7F59300DDE6A6 /* Dependency.swift in Sources */,
                97ADAC362BEC255E00F5DB84 /* AppState.swift in Sources */,
                97ADAC2F2BEC255E00F5DB84 /* PackageManagerManagerApp.swift in Sources */,
                97ADAC292BEC255C00F5DB84 /* LoadableResult.swift in Sources */,
                97B55DE42BF7F5B100DDE6A6 /* RemoteVersionBehavior.swift in Sources */,
                97ADAC322BEC255E00F5DB84 /* ContentView.swift in Sources */,
                970655852BFBFB3F00414BCC /* ContentViewModel.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
        97ADAC3C2BEC255E00F5DB84 /* Debug */ = {
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
        97ADAC3D2BEC255E00F5DB84 /* Release */ = {
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
        97ADAC3F2BEC255E00F5DB84 /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_ENTITLEMENTS = PackageManagerManager/App/PackageManagerManager.entitlements;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_ASSET_PATHS = "\\"PackageManagerManager/Preview Content\\"";
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
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.PackageManagerManager;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SDKROOT = auto;
                SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx";
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Debug;
        };
        97ADAC402BEC255E00F5DB84 /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_ENTITLEMENTS = PackageManagerManager/App/PackageManagerManager.entitlements;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_ASSET_PATHS = "\\"PackageManagerManager/Preview Content\\"";
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
                PRODUCT_BUNDLE_IDENTIFIER = com.anconaesselmann.PackageManagerManager;
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
        97ADAC202BEC255C00F5DB84 /* Build configuration list for PBXProject "PackageManagerManager" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                97ADAC3C2BEC255E00F5DB84 /* Debug */,
                97ADAC3D2BEC255E00F5DB84 /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        97ADAC3E2BEC255E00F5DB84 /* Build configuration list for PBXNativeTarget "PackageManagerManager" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                97ADAC3F2BEC255E00F5DB84 /* Debug */,
                97ADAC402BEC255E00F5DB84 /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
/* End XCConfigurationList section */

/* Begin XCLocalSwiftPackageReference section */
        9729F17D2C07EBA700C39506 /* XCLocalSwiftPackageReference "../AxelPods/XProjParser" */ = {
            isa = XCLocalSwiftPackageReference;
            relativePath = ../AxelPods/XProjParser;
        };
/* End XCLocalSwiftPackageReference section */

/* Begin XCSwiftPackageProductDependency section */
        9729F17E2C07EBA700C39506 /* XProjParser */ = {
            isa = XCSwiftPackageProductDependency;
            productName = XProjParser;
        };
/* End XCSwiftPackageProductDependency section */
    };
    rootObject = 97ADAC1D2BEC255C00F5DB84 /* Project object */;
}
"""
