import ProjectDescription

extension Project {

    public enum Framework {
        case feature(info: FeatureInfo)
        case remote(info: RemoteInfo)
    }

    public struct FeatureInfo {
        let name: String
        let organisationName: String
        let platform: Platform
        let dependencies: [String]
        let testdependencies: [String]

        public init(name: String,
                    organisationName: String,
                    platform: Platform,
                    dependencies: [String],
                    testdependencies: [String]) {
            self.name = name
            self.organisationName = organisationName
            self.platform = platform
            self.dependencies = dependencies
            self.testdependencies = testdependencies
        }

    }

    public struct RemoteInfo {
        let name: String
        let organisationName: String
        let platform: Platform
        let dependencies: [String]

        public init(name: String,
                    organisationName: String,
                    platform: Platform,
                    dependencies: [String]) {
            self.name = name
            self.organisationName = organisationName
            self.platform = platform
            self.dependencies = dependencies
        }
    }

}

extension Project.Framework {

    var name: String {
        switch self {
        case .feature(let info):
            return info.name
        case .remote(let info):
            return info.name
        }
    }

    var organisationName: String {
        switch self {
        case .feature(let info):
            return info.organisationName
        case .remote(let info):
            return info.organisationName
        }
    }

    var platform: Platform {
        switch self {
        case .feature(let info):
            return info.platform
        case .remote(let info):
            return info.platform
        }
    }

    var sources: SourceFilesList {
        switch self {
        case .feature:
            return ["Targets/\(name)/Sources/**"]
        case .remote:
            return []
        }
    }

    var dependencies: [TargetDependency] {
        switch self {
        case .feature(let info):
            return info.dependencies.map(TargetDependency.target(name:))
        case .remote(let info):
            return info.dependencies.map(TargetDependency.package(product:))
        }
    }

    var resources: [ProjectDescription.FileElement]? {
        switch self {
        case .feature:
            return ["Targets/\(name)/Resources/**"]
        default:
            return nil
        }
    }

    var target: Target {
        Target(name: name,
               platform: .iOS,
               product: .framework,
               bundleId: "\(organisationName).\(name)",
               infoPlist: .default,
               sources: sources,
               resources: resources,
               dependencies: dependencies)
    }

    var targetDependency: TargetDependency {
        .target(name: name)
    }

    var testTarget: Target? {
        switch self {
        case .feature(let info):
            return Target(name: "\(name)Tests",
                          platform: platform,
                          product: .unitTests,
                          bundleId: "\(organisationName).\(name)Tests",
                          infoPlist: .default,
                          sources: ["Targets/\(name)/Tests/**"],
                          resources: [],
                          dependencies: [.target(name: name)]
                            + info.testdependencies.map { .target(name: $0) })
        case .remote:
            return nil
        }

    }

}

