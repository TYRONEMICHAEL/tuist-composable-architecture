import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let platformAttribute: Template.Attribute = .optional("platform", default: "ios")

let projectPath = "."
let appPath = "Targets/"

let template = Template(
    description: "Project template",
    attributes: [
        nameAttribute,
        platformAttribute
    ],
    files: [
        .file(path: projectPath + "/Project.swift",
              templatePath: "Project.stencil"),

        .file(path: appPath + "\(nameAttribute)/Sources/\(nameAttribute).swift",
              templatePath: "App.stencil"),

        .file(path: appPath + "\(nameAttribute)/Tests/\(nameAttribute)Tests.swift",
              templatePath: "AppTests.stencil"),

        .file(path: appPath + "\(nameAttribute)/Sources/\(nameAttribute)Store.swift",
              templatePath: "AppStore.stencil"),

        .file(path: appPath + "\(nameAttribute)/Sources/ContentView.swift",
              templatePath: "ContentView.stencil"),

        .file(path: appPath + "\(nameAttribute)/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
              templatePath: "Contents.json.stencil"),

        .file(path: appPath + "\(nameAttribute)/Resources/LaunchScreen.storyboard",
              templatePath: "LaunchScreen.storyboard.stencil")
    ]
)
