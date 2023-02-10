import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key? key}) : super(key: key);

  @override
  State<SandBox> createState() => _SandBoxState();
}

// Good Practice Tarek

class _SandBoxState extends State<SandBox> {
  double _width = 200;
  double _opacity = 1;
  double _margin = 0;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          margin: EdgeInsets.all(_margin),
          color: _color,
          width: _width,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => setState(() {
                  _margin = 50;
                }),
                child: const Text('Animated margin'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _color = Colors.purple;
                }),
                child: const Text('Animated color'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _width = 400;
                }),
                child: const Text('Animated width'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _opacity = 0;
                }),
                child: const Text('Animated opacity'),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: const Text(
                  'Hide Me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
