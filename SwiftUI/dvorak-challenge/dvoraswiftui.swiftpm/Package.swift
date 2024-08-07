// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "dvoraswiftui",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "dvoraswiftui",
            targets: ["AppModule"],
            bundleIdentifier: "com.heguchi.dvoraswiftui",
            teamIdentifier: "L3T5JNALVT",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .binoculars),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
