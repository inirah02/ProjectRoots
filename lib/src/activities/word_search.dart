import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'hints.dart';

const letters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class WordSearchActivity extends StatefulWidget {
  static const path = '/word-search';
  static const name = 'Word Search';

  const WordSearchActivity({Key? key}) : super(key: key);

  @override
  State<WordSearchActivity> createState() => WordSearchActivityState();
}

class WordSearchActivityState extends State<WordSearchActivity> {
  final random = Random();
  // Global key used to identify the grid in the widget tree
  final GlobalKey _wordGridKey = GlobalKey();
  // For the Line Painter
  Offset lineStart = Offset.zero;
  Offset lineEnd = Offset.zero;
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Map<String, List<int>> solutions = {};
  // Grid Variables
  final int gridSize = 10;
  final List<String> gridLetters = [];
  // Selection and Activation on interaction
  final List<int> selectedCellIndexes = [];
  final Set<GridCellRenderObject> activeCells = {};
  final List<int> activeCellIndexes = [];
  // Test words
  Future<List<String>> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) {
      return Future.value([]);
    } else {
      Map<String, dynamic> user_deets =
          (await _fireStore.collection('users').doc(user.uid).get()).data()!;
      return await [
        user_deets["first_name"],
        user_deets["spouse_name"],
        user_deets["fav_colour"]
      ];
    }
  }

  late List targetWords = [];
  //["rohan", "monica", "bangalore", "green", "peanuts"];

  int get gridArea => gridSize * gridSize;

  @override
  void initState() {
    generateLetterGrid();
    getCurrentUser().then((value) {
      setState(() {
        targetWords = value;
      });
    });

    // TODO: Refactor to avoid collisions on origin values;
    for (final word in targetWords) {
      print(word);
      Axis wordDirection =
          Axis.values.elementAt(random.nextInt(Axis.values.length));

      final wordAsList = word.split('');
      final origin = getWordOrigin(word, Axis.vertical);
      int startX = origin[0];
      int startY = origin[1];
      print("$startX, $startY");

      for (int i = 0; i < word.length; i++) {
        if (wordDirection == Axis.horizontal) {
          gridLetters[(gridSize * startY) + (startX + i)] =
              wordAsList.elementAt(i).toUpperCase();
        } else {
          gridLetters[(gridSize * (startY + i)) + (startX)] =
              wordAsList.elementAt(i).toUpperCase();
        }
      }
      solutions[word] = [startX, startY];
    }

    super.initState();
  }

  void generateLetterGrid() {
    for (var i = 0; i < gridArea; i++) {
      //gridLetters.insert(i, "*");
      gridLetters.insert(i, letters.elementAt(random.nextInt(letters.length)));
    }
  }

  List<int> getWordOrigin(String word, Axis direction) {
    if (direction == Axis.horizontal) {
      return [
        random.nextInt(gridSize - word.length),
        random.nextInt(gridSize),
      ];
    }
    return [
      random.nextInt(gridSize),
      random.nextInt(gridSize - word.length),
    ];
  }

  void _startLine(details) {
    setState(() {
      lineStart = details.localPosition;
      lineEnd = details.localPosition;
    });
  }

  void _updateLine(details) {
    setState(() => lineEnd = details.localPosition);
    _hitTestGridCell(details.globalPosition);
  }

  void _clearLine() {
    setState(() {
      lineStart = Offset.zero;
      lineEnd = Offset.zero;
    });

    String selectedWord =
        activeCellIndexes.map((i) => gridLetters.elementAt(i)).join("");

    for (final word in targetWords) {
      if (word.toUpperCase() == selectedWord) {
        setState(() {
          selectedCellIndexes.addAll(activeCellIndexes);
        });
      }
    }

    setState(() {
      activeCellIndexes.clear();
      activeCells.clear();
    });
  }

  _hitTestGridCell(position) {
    final RenderBox box =
        _wordGridKey.currentContext!.findRenderObject() as RenderBox;
    final BoxHitTestResult result = BoxHitTestResult();
    Offset localPosition = box.globalToLocal(position);
    if (box.hitTestChildren(result, position: localPosition)) {
      for (final hit in result.path) {
        final target = hit.target;
        if (target is GridCellRenderObject && !activeCells.contains(target)) {
          setState(() {
            activeCells.add(target);
            activeCellIndexes.add(target.index);
          });
        }
      }
    }
  }

  String getLetter(index) {
    return gridLetters.elementAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(106, 153, 78, 1),
        title: Text("Word Search"),
      ),
      body: Center(
        child: GestureDetector(
          key: _wordGridKey,
          onPanStart: (details) => _startLine(details),
          onPanUpdate: (details) => _updateLine(details),
          onPanEnd: (details) => _clearLine(),
          child: CustomPaint(
            size: Size.infinite,
            foregroundPainter: LinePainter(lineStart, lineEnd),
            child: SizedBox(
              width: 640,
              height: 640,
              child: GridView.builder(
                  itemCount: gridArea,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    mainAxisExtent: 64,
                  ),
                  itemBuilder: (context, index) => GridCell(
                        index: index,
                        child: GridCellContainer(
                          letter: getLetter(index),
                          isActive: activeCellIndexes.contains(index),
                          isSelected: selectedCellIndexes.contains(index),
                        ),
                      )),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: (() => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Hints()))),
          child: Text("Hints")),
    );
  }
}

@immutable
class GridCell extends SingleChildRenderObjectWidget {
  final int index;

  const GridCell({required this.index, required Widget child, Key? key})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return GridCellRenderObject(index);
  }
}

class GridCellRenderObject extends RenderProxyBox {
  GridCellRenderObject(this.index) : super();
  int index;
}

class GridCellContainer extends StatelessWidget {
  final String letter;
  final bool isSelected;
  final bool isActive;
  const GridCellContainer({
    Key? key,
    required this.letter,
    this.isSelected = false,
    this.isActive = false,
  }) : super(key: key);

  Color getBackgroundColor(context) {
    if (isSelected) {
      return Colors.green;
    } else if (isActive) {
      return Colors.lightBlue.shade300;
    }
    return Theme.of(context).canvasColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: getBackgroundColor(context),
        border: Border.all(),
      ),
      child: Text(
        letter,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 4),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  Offset lineStart = Offset.zero;
  Offset lineEnd = Offset.zero;

  LinePainter(this.lineStart, this.lineEnd);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    final path = Path()
      ..moveTo(lineStart.dx, lineStart.dy)
      ..lineTo(lineEnd.dx, lineEnd.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) => true;
}
