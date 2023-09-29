## Introduction

Navigating between screens is a fundamental aspect of mobile app development. In development, efficient routing and navigation can greatly impact the user experience and development process. To simplify this, Flutter have quite a few routing packages that we can use. One such package that stands out is `auto_route`. In this blog post, I will introduce you to the `auto_route` package and show you how it can make routing in your Flutter app a breeze.


## What is auto_route?

`auto_route` is a powerful routing package that helps developer simplifies the process of defining, generating, and navigating between routes. It combines code generation with a simple and intuitive syntax to make routing in your Flutter app more efficient and maintainable.


## Benefits of Using auto_route

- **Type-safe routing**: `auto_route` generates strongly-typed route classes with typed parameter, ensuring that you always navigate to the defined page with correct parameter.
    
- **Clean and maintainable code**: With declarative route definitions and code generation, your routing code stays organized and easy to understand, even as your app grows.


## Getting Started with auto_route

To get started with `auto_route`, you'll need the following setups

1. Add dependencies to `pubspec.yaml`

```yaml
dependencies:
  auto_route: ^7.8.3

dev_dependencies:
  auto_route_generator: ^7.3.1
  build_runner: ^2.4.6
```


2. Add `@RoutePage()` to your page

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
```

3. Create router class 
   
```dart
import 'package:auto_route/auto_route.dart';
import 'package:typed_route_with_auto_route/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
        ),
      ];
}
```

4. Run `build_runner`

`dart run build_runner watch`

5. Modify `App` to use the router class for navigation

```dart
class App extends StatelessWidget {
  App({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
    );
  }
}
```


## Defining Routes

One of the standout features of `auto_route` is its declarative route definition. You define your app's routes using Dart annotations and generate the routing code automatically. As we did in step 2 and 3, to define a route we simply annotate a page with `@RoutePage()`, Then add it to the `AppRouter` class with `AutoRoute` wrapper.


## Generating Routing Code

Once you've defined your routes, you need generate the routing code by running the following command:

`dart run build_runner build`

This command will generate strongly-typed page arguments for every declared AutoRoute.


## Navigating

With your routes defined and code generated, you can easily navigate between screens in your app. Here's an example of how you can navigate from the `HomePage` to the `SettingPage` using `auto_route`:

```dart
context.pushRoute(SettingRoute());
```

`context.pushRoute` is a quick way to push a new page into current stack, if you want to access the router your can use `context.router` which also contains a push method.

    
### Conclusion

In this post, I've introduced the basic concepts and usage of the `auto_route` package, showcasing how it can make routing in your app more efficient and less error-prone. However, there are still numerous features within the package that can simplify routing in various ways, including components such as `AutoTabsRouter` and `AutoRouteGuard`, among others. I will delve into these features in my future posts. Until then give it a try in your next Flutter project and experience the benefits of type-safe and code-generated routing. Happy coding!