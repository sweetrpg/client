// swift-tools-version:5.4

import PackageDescription


let package = Package(name: "sweetrpg-sdk",
        platforms: [
            .macOS(.v11),
        ],
        products: [
            .library(name: "SDK", targets: [ "SDK" ])
        ],
        dependencies: [
            // 💧 A server-side Swift web framework.
            .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
            .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
            //            .package(url: "https://github.com/vapor/fluent-mongo-driver.git", from: "1.0.0"),
            //            .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
            //            .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0"),
            //            .package(url: "https://github.com/vapor-community/sendgrid.git", from: "4.0.0"),
            //            .package(url: "https://github.com/vapor/redis.git", from: "4.0.0"),
            // .package(name: "sweetrpg-users-model", path: "../UsersModel"),
            .package(url: "ssh://git@github.com/paulyhedral/sweetrpg-library-model.git", .branch("develop")),
            .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        ],
        targets: [
            .target(
                    name: "SDK",
                    dependencies: [
                        .product(name: "Logging", package: "swift-log"),
                        .product(name: "Fluent", package: "fluent"),
                        //                        .product(name: "FluentMongoDriver", package: "fluent-mongo-driver"),
                        //                        .product(name: "Leaf", package: "leaf"),
                        //                        .product(name: "JWT", package: "jwt"),
                        .product(name: "Vapor", package: "vapor"),
                        //                        .product(name: "ImperialGoogle", package: "Imperial"),
                        //                        .product(name: "ImperialGitHub", package: "Imperial"),
                        //                        .product(name: "SendGrid", package: "sendgrid"),
                        //                        .product(name: "Redis", package: "redis"),
                        .product(name: "LibraryModel", package: "sweetrpg-library-model"),
                    ],
                    swiftSettings: [
                        // Enable better optimizations when building in Release configuration. Despite the use of
                        // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                        // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                        .unsafeFlags([ "-cross-module-optimization" ], .when(configuration: .release)),
                    ]
            ),
            .testTarget(name: "SDKTests", dependencies: [
                .target(name: "SDK"),
            ]),
        ]
)

// Prometheus
// Logging
// Stripe
// Auth0
// APM (NewRelic?)
// Sentry?
