import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureMaster(),
    );
  }
}

class GestureMaster extends StatefulWidget {
  const GestureMaster({super.key});

  @override
  State<GestureMaster> createState() => _GestureMasterState();
}

class _GestureMasterState extends State<GestureMaster> {
  double left = 0;
  double top = 0;
  Color color = Colors.red;
  bool _isSquare = true;
  double _rotation = 0;

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      left += details.delta.dx;
      top += details.delta.dy;
    });
  }

  void _onTap() {
    setState(() {
      color = color == Colors.black ? Colors.red : Colors.black;
      _isSquare = !_isSquare;
    });
  }

  void _onLongPress() {
    setState(() {
      _rotation += 0.25;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            left: size.width / 2 - (_isSquare ? 50 : 75) + left,
            top: size.height / 2 - 50 + top,
            child: GestureDetector(
              onPanUpdate: _onDragUpdate,
              onTap: _onTap,
              onLongPress: _onLongPress,
              child: Transform.rotate(
                angle: _rotation * 3.14159 / 2,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: _isSquare ? 100 : 150,
                    height: 100,
                    color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
