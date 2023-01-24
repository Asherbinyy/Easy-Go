import 'package:easy_go/easy_go.dart';
import 'package:flutter/material.dart';

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Go Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Go.to(SecondPage());
            // Go.toNamed(
            //   NamedRoutes.initial,
            //   arguments: {
            //     'data': 'Hello I was sent from screen Home',
            //   },
            // );
          },
          child: const Text('home page '),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = context.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text('second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                /// previw image in full screen
                Go.to(
                  Scaffold(
                    appBar: AppBar(
                      title: const Text('Image'),
                    ),
                    body: Center(
                      child: Image.network(
                        'https://blog.logrocket.com/wp-content/uploads/2022/02/Best-IDEs-Flutter-2022.png',
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  transition: TransitionType.size,
                  options: SizeAnimationOptions(
                      secondaryTransition: true
                  ),
                );
              },
              child: Image.network(
                'https://blog.logrocket.com/wp-content/uploads/2022/02/Best-IDEs-Flutter-2022.png',
                height: 200,
                width: 200,
              ),
            ),
            // Text(args['data'].toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CloseButton(
                  onPressed: () {
                    Go.back('Hello');
                  },
                ),
                TextButton(
                  onPressed: () {
                    Go.to(const ThirdPage(),
                        transition: TransitionType.rotation);
                  },
                  child: const Text(' 3rd page'),
                ),
                TextButton(
                  onPressed: () {
                    Go.to(const FourthPage(), transition: TransitionType.shake);
                  },
                  child: const Text('4th page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('third page'),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Text(
          'fourth page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
