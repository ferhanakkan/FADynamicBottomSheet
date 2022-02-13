// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FADynamicBottomSheet",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FADynamicBottomSheet",
            targets: ["FADynamicBottomSheet"]),
    ],
    targets: [
        .target(
            name: "FADynamicBottomSheet",
            dependencies: []),
        .testTarget(
            name: "FADynamicBottomSheetTests",
            dependencies: ["FADynamicBottomSheet"]),
    ],
    swiftLanguageVersions: [.v5]
)
