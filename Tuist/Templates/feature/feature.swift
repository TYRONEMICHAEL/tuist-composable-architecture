import ProjectDescription

let featureName: Template.Attribute = .required("name")
let featurePath = "Targets/"

let featureTemplate = Template(
    description: "Feature template",
    attributes: [
        featureName
    ],
    files: [
        .file(path: featurePath + "\(featureName)/Sources/\(featureName)Store.swift",
              templatePath: "FeatureStore.stencil"),
        .file(path: featurePath + "\(featureName)/Sources/\(featureName).swift",
              templatePath: "FeatureView.stencil"),
        .file(path: featurePath + "\(featureName)/Tests/\(featureName)Tests.swift",
              templatePath: "FeatureTests.stencil"),
        .file(path: featurePath + "\(featureName)/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
              templatePath: "Contents.json.stencil")
    ]
)
