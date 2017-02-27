import PackageDescription

let package = Package(
    name: "ESGistsModule",
    dependencies: [
        .Package(url: "https://github.com/es-kumagai/Swim", majorVersion: 0, minor: 1),
        .Package(url: "https://github.com/es-kumagai/Ocean", majorVersion: 0, minor: 1),
		.Package(url: "https://github.com/es-kumagai/ESThread", majorVersion: 0, minor: 3)
    ]
)

