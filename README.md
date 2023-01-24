## Easy Go

Easy Go is a powerful Flutter package that makes navigation between pages a breeze.
With a simple and intuitive API, this package allows you to easily navigate between
pages with beautiful animations and custom transitions.

![Imgur Image](https://imgur.com/a/uiIlJ1q.gif)
## images
![Imgur Image](https://imgur.com/a/4Z7Z2Zg.gif)
![Imgur Image](https://imgur.com/a/4Z7Z2Zg)
## Features

The package provides a wide range of features to enhance your app's navigation, such as:

- Support for custom page transitions and animations
- Provides an easy way to set transitions for each platform (iOS, Android, Web, etc.)
- Built-in animations such as slide, fade, and scale
- Support for named routes and automatic route generation
- The ability to pass data between pages
- Easy to debug and test


A simple and easy-to-use API that can be integrated seamlessly into your existing app

## Getting started

Add the package to your pubspec.yaml file:

```yaml
dependencies:
  easy_go: latest_version
```
import the package in your dart file:
``` dart
import 'package:easy_go/easy_go.dart';
```
run the following command in your project's root directory to init the package:
```bash
dart go_init.dart --name=NamedRoutes
```
This will create a file named named_routes.dart in your project's root directory.
This file will contain all the named routes in your app.
You can add more routes to this file manually.


## Setup the Package

1.Pass the navigator key (Go.navigatorKey) to the MaterialApp widget
```dart
MaterialApp(
  navigatorKey: Go.navigatorKey,
  home: const HomePage(),
),
```
2. To use named routes, you need to make sure that named_routes.dart is imported in your dart file.
3. Create a Router Generator class that extends GoGenerator giving your customizations for each route.
 ex :
```dart
class RouterGenerator extends GoGenerator {
  @override
  Route<dynamic> goRoutes(RouteSettings settings) {
    final namedRoute = routerName(settings); /// You must include that line
    switch (namedRoute) {
      case NamedRoutes.home:
        return GoBuilder().build(
          const HomePage(),
          settings: settings,
          transition: TransitionType.fade,
        );
      case NamedRoutes.secondPage:
        return GoBuilder().build(
          const SecondPage(),
          settings: settings,
          transition: TransitionType.fade,
        );
      case NamedRoutes.thirdPage:
        return GoBuilder().build(const ThirdPage(), settings: settings);
      case NamedRoutes.fourthPage:
        return GoBuilder().build(const FourthPage(), settings: settings);
    }
  }

  @override
  Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route exists here ! '),
        ),
      ),
    );
  }
}

```
4. Pass the Router Generator class to MaterialApp's onGenerateRoute parameter.
```dart
MaterialApp(
  navigatorKey: Go.navigatorKey,
  onGenerateRoute: RouterGenerator().goRoutes,
  home: const HomePage(),
),
```


# Usage
Once you finished setting up the package, you can use it in your app by calling the Go class methods.

* For Simple navigation between pages
```dart
TextButton(
  onPressed: () {
    /// This will create a fade transition between the current page and the next page
     Go.to(const SecondPage(), transition:  TransitionType.fade,options:FadeAnimationOptions());
  },
  child: Text('Go to page 2'),
),
```
* For passing data between pages with named routes

```dart
TextButton(
  onPressed: () {
    /// This will create a fade transition between the current page and the next page
    Go.toNamed(NamedRoutes.first, arguments: 'Hello World');
  },
  child: Text('Go to second'),
),
```
to get the data in the second page, you can use the following code:
```dart
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.arguments ;
    return Scaffold(
      body: Center(
        child: Text(data), /// This will display 'Hello World'
      ),
    );
  }
}
```
# Platform Specific Transitions

By default Go provides a suitable transition for each platform ios , android and web.

To use a custom transition for a specific platform, you can use the GoBuilder class before running the app

ex :
```dart
void main() {
  GoBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.slide,
        parentOptions: const SlideAnimationOptions(
          direction: SlideDirection.topToBottom,
        ),
      ),
       /// ios: Add IOS Animation Options
      /// web: Add Web Animation Options
    ),
  );
  runApp(MyApp());
}
```
This will create a slide transition for android and the default transition for ios (Cupertino Transition) and web.


## Parameters

- **page**: The page to navigate to
- **transition**: The transition type to use it can be one of the following:
  - **TransitionType.slide**: Slide transition
  - **TransitionType.fade**: Fade transition
  - **TransitionType.scale**: Scale transition
  and many more ....
- **options**: The transition options to use for each transitionType
  - **SlideAnimationOptions**: The options for the slide transition
  - **FadeAnimationOptions**: The options for the fade transition
  and many more ....

## Options Parameters

- **duration**: The duration of the transition
- **reverseDuration**: The duration of the reverse transition
- **curve**: The curve of the transition
- **reverseCurve**: The curve of the reverse transition
- **secondaryTransition**: The secondary gives a combination of two transitions for example: Slide and Fade
Note : The secondary transition is set to false by default,
       if enabled it gives a fade added to the current transition for now (update coming soon)


## Publisher Notes

- This package is still under development and will be updated frequently.
- If you have any suggestions or issues, please feel free to open an issue on GitHub or contact me on Gmail <ahmed.elsherbiny2020@gmail.com>.
- If you like this package, please consider giving it a star on GitHub. It helps a lot!

## License

MIT License (MIT)

# Contact me

- Gmail: ahmed.elsherbiny2020@gmail.com
- LinkedIn:<a href="https://www.linkedin.com/in/ahmed-elsherbiny-0b0b1b1b9/"> Sherbini</a>
- linktree: <a href="https://linktr.ee/sherbinovic"> Sherbinovic</a>

# Donate

If you like this package, you can buy me a coffee :)
<a href="https://www.buymeacoffee.com/sherbinovic" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>


# Contributing

If you would like to contribute to the package, please check out our GitHub repository. We welcome all contributions, including bug reports, feature requests, and pull requests.
If you encounter any issues with the package, please file a bug report on our GitHub repository. Our team will do our best to respond to your report in a timely manner.
Thank you for using easy_go and we hope it makes your development experience more enjoyable!"

Made with love by Sherbini ❤


