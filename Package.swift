// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "feather",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .executable(name: "Feather", targets: ["Feather"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/feather-core", from: "1.0.0-beta"),
        /// drivers
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0-beta"),
        /// modules
        .package(name: "file-module", url: "https://github.com/feather-modules/file", from: "1.0.0-beta"),
        .package(name: "redirect-module", url: "https://github.com/feather-modules/redirect", from: "1.0.0-beta"),
        .package(name: "blog-module", url: "https://github.com/feather-modules/blog", from: "1.0.0-beta"),
//        .package(name: "analytics-module", url: "https://github.com/feather-modules/analytics", from: "1.0.0-beta"),
//        .package(name: "aggregator-module", url: "https://github.com/feather-modules/aggregator", from: "1.0.0-beta"),
        .package(name: "sponsor-module", url: "https://github.com/feather-modules/sponsor", from: "1.0.0-beta"),
        .package(name: "swifty-module", url: "https://github.com/feather-modules/swifty", from: "1.0.0-beta"),
        .package(name: "markdown-module", url: "https://github.com/feather-modules/markdown", from: "1.0.0-beta"),
    ],
    targets: [
        .target(name: "Feather", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            /// drivers
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            /// modules
            .product(name: "FileModule", package: "file-module"),
            .product(name: "RedirectModule", package: "redirect-module"),
            .product(name: "BlogModule", package: "blog-module"),
//            .product(name: "AnalyticsModule", package: "analytics-module"),
//            .product(name: "AggregatorModule", package: "aggregator-module"),
            .product(name: "SponsorModule", package: "sponsor-module"),
            .product(name: "SwiftyModule", package: "swifty-module"),
            .product(name: "MarkdownModule", package: "markdown-module"),
        ], exclude: [
            "Modules/README.md",
        ], swiftSettings: [
            .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
        ]),
//        .testTarget(name: "FeatherTests", dependencies: [
//            .target(name: "Feather"),
//            .product(name: "XCTVapor", package: "vapor"),
//        ])
    ]
)
