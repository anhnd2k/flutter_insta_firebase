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
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  List<Widget> _addedWidget = [];
  
  bool _showDeleteBottom = false;
  bool _isDeleteButtonActive = false;

//
  Color color = Colors.white;
//

  final List<Widget> _dummyWidget = [
    const TextField(
      decoration: InputDecoration(
        hintText: 'Enter a search term',
      ),
    ),
    const Icon(Icons.hearing, size: 60, color: Colors.amber),
    const Icon(Icons.hail_outlined, size: 90, color: Colors.amber),
    const Icon(Icons.heart_broken, size: 60, color: Colors.amber),
  ];

  void Function(String)? onChanged() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    TextField textField = TextField(
        decoration: const InputDecoration(hintText: 'enter'),
        controller: controller,
        onChanged: onChanged());
    Container container = Container(
      height: 50,
      width: 150,
      color: color,
      child: textField,
    );
    return Center(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            if (_addedWidget.length < _dummyWidget.length)
              {
                setState(() {
                  _addedWidget.add(OverLayedWidget(
                    key: Key(_addedWidget.length.toString()),
                    // child: _dummyWidget.elementAt(_addedWidget.length),
                    child: container,
                    onDragStart: () {
                      if (!_showDeleteBottom) {
                        setState(() {
                          _showDeleteBottom = true;
                        });
                      }
                    },
                    onDragEnd: (offset, key) {
                      if (_showDeleteBottom) {
                        setState(() {
                          _showDeleteBottom = false;
                        });
                      }
                      if (offset.dy >
                          (MediaQuery.of(context).size.height - 100)) {
                        _addedWidget.removeWhere((widget) => widget.key == key);
                      }
                    },
                    onDragUpdate: (offset, key) {
                      if (offset.dy >
                          (MediaQuery.of(context).size.height - 100)) {
                        if (!_isDeleteButtonActive) {
                          setState(() {
                            _isDeleteButtonActive = true;
                          });
                        }
                      } else {
                        if (_isDeleteButtonActive) {
                          setState(() {
                            _isDeleteButtonActive = false;
                          });
                        }
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.delete,
                  size: _isDeleteButtonActive ? 38 : 28,
                  color: _isDeleteButtonActive ? Colors.red : Colors.white70,
                ),
              ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('white color');
                      setState(() {
                        Widget clone = _addedWidget[_addedWidget.length - 1];

                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
