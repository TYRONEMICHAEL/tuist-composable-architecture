import ProjectDescription

extension Project {

    public struct App {
        let name: String
        let organisationName: String
        let platform: Platform
        let packages: [Package]
        let infoPlist: [String: InfoPlist.Value]
        let actions: [TargetAction]

        public init(name: String,
                    organisationName: String,
                    platform: Platform = .iOS,
                    infoPlist: [String: InfoPlist.Value] = [:],
                    packages: [Package] = [],
                    actions: [TargetAction] = []) {
            self.name = name
            self.organisationName = organisationName
            self.packages = packages
            self.infoPlist = infoPlist
            self.platform = platform
            self.actions = actions
        }
    }

}
