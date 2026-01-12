// swift-tools-version: 5.10

import PackageDescription

// Approachable Concurrency settings for Swift 6.2
let approachableConcurrencySettings: [SwiftSetting] = [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("GlobalActorIsolatedTypesUsability"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("InferSendableFromCaptures"),
    // .enableUpcomingFeature("NonisolatedNonsendingByDefault")
]

let defaultMainActorIsolationSettings = approachableConcurrencySettings + [
    .unsafeFlags(["-Xfrontend", "-default-isolation", "-Xfrontend", "MainActor"])
]

let package = Package(
    name: "swift-windowsfoundation",
    products: [
        .library(name: "WindowsFoundation", type: .dynamic, targets: ["WindowsFoundation"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/thebrowsercompany/swift-cwinrt",
            revision: "eb46cdb66f770a1e006f9fcfebbf9e99a0fba811"
        ),
    ],
    targets: [
        .target(
            name: "WindowsFoundation",
            dependencies: [
                .product(name: "CWinRT", package: "swift-cwinrt"),
            ],
            swiftSettings: defaultMainActorIsolationSettings
        ),
    ]
)
