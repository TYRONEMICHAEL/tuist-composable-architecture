import ProjectDescription

let examplePath = "Targets/"
let exampleProjectPath = "."

let exampleTemplate = Template(
    description: "Example template",
    attributes: [],
    files: [
        .file(path: exampleProjectPath + "/Project.swift",
              templatePath: "Project.stencil"),

        // Todo Feature
        .file(path: examplePath + "Todo/Sources/Todo.swift",
              templatePath: "Todo.stencil"),

        .file(path: examplePath + "Todo/Sources/TodoStore.swift",
              templatePath: "TodoStore.stencil"),

        .file(path: examplePath + "Todo/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
              templatePath: "Contents.json.stencil"),

        .file(path: examplePath + "Todo/Tests/TodoTests.swift",
              templatePath: "TodoTests.stencil"),

        // Todos Feature
        .file(path: examplePath + "Todos/Sources/Todos.swift",
              templatePath: "Todos.stencil"),

        .file(path: examplePath + "Todos/Sources/TodosStore.swift",
              templatePath: "TodosStore.stencil"),

        .file(path: examplePath + "Todos/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
              templatePath: "Contents.json.stencil"),

        .file(path: examplePath + "Todos/Tests/TodosTests.swift",
              templatePath: "TodosTests.stencil"),

        .file(path: examplePath + "Todos/Sources/ContentView.swift",
              templatePath: "ContentView.stencil")

    ]
)
