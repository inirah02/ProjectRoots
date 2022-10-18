import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  const WordSearchActivity({Key? key}) : super(key: key);

  @override
  State<WordSearchActivity> createState() => WordSearchActivityState();
}

class WordSearchActivityState extends State<WordSearchActivity> {
  Map<String, List<int>> solutions = {};
  Set<List<int>> selection = {};
  late final List<List<String>> letterGrid = [];
  final random = Random();
  Offset lineStart = Offset.zero;
  Offset lineEnd = Offset.zero;
  final GlobalKey _wordGridKey = GlobalKey();
  late final List<List<LocalKey>> gridCellKeys = [];
  final List<String> _letters = [];
  final int gridSize = 10;
  final Set<GridCellRenderObject> selectedCells = {};
  final List<int> selectedCellIndexes = [];
  final Set<GridCellRenderObject> activeCells = {};
  final List<int> activeCellIndexes = [];
  final targetWords = ["rohan", "monica"];

  @override
  void initState() {
    // Generate Letter Grid
    for (var i = 0; i <= 10; i++) {
      List<String> row = [];
      for (var j = 0; j <= 10; j++) {
        // row.insert(j, letters.elementAt(random.nextInt(letters.length)));
        row.insert(j, "*");
      }
      letterGrid.insert(i, row);
    }

    for (var i = 0; i < (gridSize * gridSize); i++) {
      _letters.insert(i,"*");
      // _letters.insert(i, letters.elementAt(random.nextInt(letters.length)));
    }

    // TODO: Refactor to avoid collisions on origin values;
    for (final word in targetWords) {
      Axis wordDirection =
          Axis.values.elementAt(random.nextInt(Axis.values.length));

      final wordAsList = word.split('');
      final origin = getWordOrigin(word, wordDirection);
      int startX = origin[0];

      for (int i = 0; i < word.length; i++) {
        _letters[startX + i] = wordAsList.elementAt(i).toUpperCase();
        // if (wordDirection == Axis.horizontal) {
        //   letterGrid[startX + i][startY] =
        //       wordAsList.elementAt(i).toUpperCase();
        // } else {
        //   letterGrid[startX][startY + i] =
        //       wordAsList.elementAt(i).toUpperCase();
        // }
      }
      solutions[word] = [startX];
    }

    super.initState();
  }

  List<int> getWordOrigin(String word, Axis direction) {
    if (direction == Axis.horizontal) {
      return [
        random.nextInt(letterGrid.length - word.length),
        random.nextInt(letterGrid.length),
      ];
    }
    return [
      random.nextInt(letterGrid.length),
      random.nextInt(letterGrid.length - word.length),
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
    String selectedWord = _letters.getRange(activeCellIndexes.first, activeCellIndexes.last + 1).join();

    for (final word in targetWords) {
      if(word.toUpperCase() == selectedWord) {
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

  Widget _buildWordGrid(BuildContext context, List<List<String>> letterGrid) {
    final _grid = List.generate(
      letterGrid.length,
      (int rowIndex) => List.generate(
        letterGrid.length,
        (int columnIndex) => GridCellContainer(
            key: gridCellKeys[rowIndex][columnIndex],
            letter: letterGrid[rowIndex][columnIndex]),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _grid
          .map<Widget>(
            (e) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: e.map<Widget>((cell) => cell).toList(),
            ),
          )
          .toList(),
    );
  }

  String getLetter(index) {
    return _letters.elementAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse Search"),
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
            // child: _buildWordGrid(context, letterGrid),
            child: SizedBox(
              width: 640,
              height: 640,
              child: GridView.builder(
                  itemCount: (gridSize * gridSize),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10, mainAxisExtent: 64),
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
