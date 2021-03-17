import ProjectDescription

extension Project {

    public static func app(app: App, additionalTargets: [Framework]) -> Project {
        return Project(name: app.name,
                       organizationName: app.organisationName,
                       packages: app.packages,
                       targets: makeTargets(app: app, additionalTargets: additionalTargets))
    }


}

private extension Project {

    static func makeTargets(app: App, additionalTargets: [Framework]) -> [Target] {
        let mainTarget = Target(name: app.name,
                                platform: app.platform,
                                product: .app,
                                bundleId: "\(app.organisationName).\(app.name)",
                                infoPlist: .extendingDefault(with: app.infoPlist),
                                sources: ["Targets/\(app.name)/Sources/**"],
                                resources: ["Targets/\(app.name)/Resources/**"],
                                dependencies: additionalTargets.map(\.targetDependency))


        let testTarget = Target(name: "\(app.name)Tests",
                                platform: app.platform,
                                product: .unitTests,
                                bundleId: "\(app.organisationName).\(app.name)Tests",
                                infoPlist: .default,
                                sources: ["Targets/\(app.name)/Tests/**"],
                                dependencies: [
                                    .target(name: "\(app.name)")
                                ] + additionalTargets.map(\.targetDependency))

        return [mainTarget, testTarget]
            + additionalTargets.map(\.target)
            + additionalTargets.compactMap(\.testTarget)
    }

}
