import 'package:flutter/material.dart';
import 'package:flutter_animation/about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isBig = false;
  var _isSquare = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isBig = !_isBig;
                });
              },
              child: const Text('Resize'),
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 500,
              ),
              color: Colors.green,
              width: _isBig ? 200 : 100,
              height: _isBig ? 200 : 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AboutPage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: const Offset(0, 0.5),
                        end: Offset.zero,
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Slide to About Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AboutPage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: 0.0,
                        end: 1.0,
                      );
                      return FadeTransition(
                        opacity: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Fade to About Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AboutPage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: 0.0,
                        end: 1.0,
                      );
                      return ScaleTransition(
                        scale: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Scale to About Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AboutPage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: 0.0,
                        end: 1.0,
                      );
                      return RotationTransition(
                        turns: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Ratate to About Page'),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _isSquare = !_isSquare;
              }),
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 500,
                ),
                width: _isBig ? 200 : 100,
                height: _isBig ? 200 : 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      _isSquare ? 0 : 90,
                    ),
                  ),
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
