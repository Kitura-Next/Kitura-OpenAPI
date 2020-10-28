<p align="center">
<a href="http://kituranext.org/">
<img src="https://raw.githubusercontent.com/Kitura-Next/Kitura/master/Sources/Kitura/resources/kitura-bird.svg?sanitize=true" height="100" alt="Kitura">
</a>
</p>


<p align="center">
<a href="http://www.kituranext.org/">
<img src="https://img.shields.io/badge/docs-kitura-1FBCE4.svg" alt="Docs">
</a>
<a href="https://travis-ci.org/Kitura-Next/Kitura-OpenAPI">
<img src="https://travis-ci.org/Kitura-Next/Kitura-OpenAPI.svg?branch=master" alt="Build Status - Master">
</a>
<img src="https://img.shields.io/badge/os-macOS-green.svg?style=flat" alt="macOS">
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
<img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
<a href="http://swift-at-ibm-slack.mybluemix.net/">
<img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg" alt="Slack Status">
</a>
</p>

# Kitura-OpenAPI

Kitura-OpenAPI is a library which makes it easy to add [OpenAPI](https://www.openapis.org/) (aka Swagger) support to your Codable routing-based [Kitura](https://github.com/Kitura-Next/Kitura) application.

By using Kitura-OpenAPI you can:

1. Host an automatically generated OpenAPI definition of your application on a defined endpoint, for example `/openapi`.
2. Host the SwaggerUI tool on a defined endpoint, for example `/openapi/ui`.

## Getting Started

Add `Kitura-OpenAPI` to the dependencies within your application's `Package.swift` file. Substitute `"x.x.x"` with the latest `Kitura-OpenAPI` [release](https://github.com/Kitura-Next/Kitura-OpenAPI/releases).

```swift
.package(url: "https://github.com/Kitura-Next/Kitura-OpenAPI.git", from: "x.x.x")
```
Add `KituraOpenAPI` to your target's dependencies:

```Swift
.target(name: "example", dependencies: ["KituraOpenAPI"]),
```

Import the package inside your application:

```swift
import KituraOpenAPI
```

## Example

Inside your application, add a call to `KituraOpenAPI.addEndpoints(to:with:)` during startup, passing through the Kitura `Router` that you want to host the OpenAPI endpoints on. The `with` parameter optionally allows you to configure where the endpoints are hosted.

For example:

```swift
KituraOpenAPI.addEndpoints(to: router) // Use the default endpoints
```

You can then visit `/openapi` in a web browser to view the generated OpenAPI definition, and `/openapi/ui` to view SwaggerUI.

If you wish, you can customize the endpoint paths:

```swift
let config = KituraOpenAPIConfig(apiPath: "/swagger", swaggerUIPath: "/swagger/ui")
KituraOpenAPI.addEndpoints(to: router, with: config)
```

### Writing OpenAPI definition to a file

You can easily write the OpenAPI definition for your Kitura router to a file:
```swift
try KituraOpenAPI.writeOpenAPI(from: router, to: "/myProject/kitura-server.json")
```

## Limitations

Kitura-OpenAPI works by using Kitura's ability to introspect the registered Codable routes at runtime, a feature added in Kitura 2.4. Because Codable routes provide the strong type information required in order to generate an OpenAPI definition at runtime, this feature unfortunately cannot currently support 'raw' routes.

## Community

We love to talk server-side Swift and Kitura. Join our [Slack](http://swift-at-ibm-slack.mybluemix.net/) to meet the team!

## License

This library is licensed under Apache 2.0. Full license text is available in [LICENSE](https://github.com/Kitura-Next/Kitura-OpenAPI/blob/master/LICENSE).

This library includes components from [Swagger-UI](https://github.com/swagger-api/swagger-ui), which is licensed under Apache 2.0. Full license text is available in [swagger-ui/LICENSE](https://github.com/swagger-api/swagger-ui/blob/master/LICENSE).
