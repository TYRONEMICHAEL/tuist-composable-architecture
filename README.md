# The Composable Microfeature Architecture

This little project is an opinionated, yet simple tool, that leverages the work of two excellent open-sourced projects namely [Tuist](https://tuist.io) and [TCA](https://github.com/pointfreeco/swift-composable-architecture#what-is-the-composable-architecture) (The Composable Architecture). The aim of this little project is to help you get started building a scalable and modular application immediately without all the boilerplate.

## The MicroFeatures Architecture

> The MicroFeatures Architecture or uFeatures is an architectural approach to structure Apple OS applications to enable scalability, optimize build and test cycles, and ensure good practices in your team. Its core idea is to build your apps by building independent features that are interconnected using clear and concise APIs.

[Learn more](https://tuist.io/docs/building-at-scale/microfeatures/#µfeatures-architecture)

## The Composable Architecture

> The Composable Architecture (TCA, for short) is a library for building applications in a consistent and understandable way, with composition, testing, and ergonomics in mind.

[Learn more](https://github.com/pointfreeco/swift-composable-architecture#what-is-the-composable-architecture)

By combining the two architectures, we get something that is easy to use, easy to follow, and most importantly modular and thus scalable among teams.

This little project requires that you are both familiar with [TCA](https://github.com/pointfreeco/swift-composable-architecture#what-is-the-composable-architecture), and [Tuist](https://tuist.io).

## How to get started?

Install Tuist with the following command:

```swift
bash <(curl -Ls https://install.tuist.io)
```

Now to get started run the following command in your terminal:

```swift
tuist scaffold generate --name YourProjectName
```

This will bootstrap your iOS application.  You can now edit your project by running the following command and see all the code provided by this little project:

```swift
tuist edit
```

Finally to get started run the following command:

```swift
tuist generate && tuist focus YourProjectName
```

## Creating Microfeatures

Now we can start creating Microfeatures. Microfeatures allow you to write features in isolation without having to create and write boilerplate code.

You can create a MicroFeature using the following command:

```swift
tuist scaffold feature --name YourFeatureName
```

Now you need to write a little code to add the feature to your project. First type the following command:

```swift
tuist edit
```

And then add your feature to the project as follows:

```swift
...

let additionalTargets: [Project.Framework] = [
    .remote(info: .init(name: "ComposableArchitectureFramework",
                        organisationName: organisationName,
                        platform: platform,
                        dependencies: ["ComposableArchitecture"])),

    .feature(info: Project.FeatureInfo(name: "YourFeatureName",
                                       organisationName: organisationName,
                                       platform: platform,
                                       dependencies: ["ComposableArchitectureFramework"],
                                       testdependencies: ["ComposableArchitectureFramework"]))
]

...
```

Finally run the following command to regenerate your project:

```swift
tuist generate
```

Now you can either open the the workspace and plugin your feature, or you can run and write the feature in isolation with the following command:

```swift
tuist focus YourFeatureName
```

## Checking out the example Todo project

If you are a little unsure how everything fits together, you can checkout the example project, by typing out the following command:

```swift
tuist scaffold example
```

This will generate a fully functional Todo example project together with tests. This is the original TCA todo example that is using the Micro

## References

- [ComposableTuistArchitecture](https://github.com/fortmarek/ComposableTuistArchitecture)
- [Tuist init: How to use Tuist templates to bootstrap your project](https://sarunw.com/posts/tuist-init/)
- [Customize Your Xcode Project With Tuist](https://betterprogramming.pub/customize-your-xcodeproject-with-tuist-6fc41fb59262)