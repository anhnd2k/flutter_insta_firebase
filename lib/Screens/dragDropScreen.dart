import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/overlayedWidget.dart';

class DragDropScreen extends StatefulWidget {
  const DragDropScreen({super.key});

  @override
  State<DragDropScreen> createState() => _DragDropScreenState();
}

class _DragDropScreenState extends State<DragDropScreen> {
  List<Widget> _addedWidget = [];
  bool _showDeleteBottom = false;
  final List<Widget> _dummyWidget = [
    const Icon(Icons.headphones, size: 40, color: Colors.amber),
    const Icon(Icons.hearing, size: 60, color: Colors.amber),
    const Icon(Icons.hail_outlined, size: 90, color: Colors.amber),
    const Icon(Icons.heart_broken, size: 60, color: Colors.amber),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            if (_addedWidget.length < _dummyWidget.length)
              {
                setState(() {
                  _addedWidget.add(OverLayedWidget(
                    child: _dummyWidget.elementAt(_addedWidget.length),
                    onDragStart: () {
                      if (!_showDeleteBottom) {
                        setState(() {
                          _showDeleteBottom = true;
                        });
                      }
                    },
                    onDragEnd: () {
                      if (_showDeleteBottom) {
                        setState(() {
                          _showDeleteBottom = false;
                        });
                      }
                    },
                  ));
                })
              }
          },
          child: const Icon(Icons.add),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/bg_wallpaper.png',
                fit: BoxFit.fill,
              ),
            ),
            for (int i = 0; i < _addedWidget.length; i++) _addedWidget[i],
            if (_showDeleteBottom)
              const Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.delete,
                  size: 50,
                  color: Colors.white70,
                ),
              )
          ],
        ),
      ),
    );
  }
}