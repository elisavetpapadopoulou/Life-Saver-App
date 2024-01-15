import 'package:flutter/material.dart';
import 'Homepage.dart';
//import 'allergic_reaction.dart';

class InjectorPage extends StatelessWidget {
  const InjectorPage({Key? key}) : super(key: key);
  static const String routeName = '/InjectorPage';

  @override
  Widget build(BuildContext context) {
    const String imagePath = 'pictures/injector.png';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 182, 206),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomepageScreen()),
            ),
          ),
        ],
        title: const Text('Use of Injector'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 206),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  imagePath), // The instructional image for using an injector
              // You can add additional content or text here if necessary
            ],
          ),
        ),
      ),
    );
  }
}
