import 'dart:math';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // Generate Letter Grid
    final letters =
        List.generate(26, (index) => String.fromCharCode(index + 65));

    for (var i = 0; i <= 10; i++) {
      List<String> row = [];
      for (var j = 0; j <= 10; j++) {
        // row.insert(j, letters.elementAt(random.nextInt(letters.length)));
        row.insert(j, "*");
      }
      letterGrid.insert(i, row);
    }

    const words = ["rohan", "varuni", "harani","monica"];
    // TODO: Refactor to avoid collisions on origin values;
    for (final word in words) {
      Axis wordDirection = Axis.values.elementAt(random.nextInt(Axis.values.length));
      
      final wordAsList = word.split('');
      // final origin = [1, 1]; 
      final origin = getWordOrigin(word, wordDirection);
      int startX = origin[0];
      int startY = origin[1];


      for (int i = 0; i < word.length; i++) {
        if (wordDirection == Axis.horizontal) {
          letterGrid[startX + i][startY] =
              wordAsList.elementAt(i).toUpperCase();
        } else {
          letterGrid[startX][startY + i] =
              wordAsList.elementAt(i).toUpperCase();
        }
      }
      solutions[word] = [startX, startY];
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

  Widget _buildWordGrid(BuildContext context, List<List<String>> letterGrid) {
    final _grid = List.generate(
      letterGrid.length,
      (int rowIndex) => List.generate(
        letterGrid.length,
        (int columnIndex) => GridCell(
            x: rowIndex,
            y: columnIndex,
            onSelect: (x, y) => {
                  if (!selection.contains([x, y]))
                    {
                      setState(() => selection.add([x, y]))
                    }
                },
            isPartOfWord: selection.fold(false, (previousValue, element) {
              if (element[0] == rowIndex && element[1] == columnIndex) {
                return true;
              }
              return false;
            }),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse Search"),
      ),
      body: Center(child: _buildWordGrid(context, letterGrid)),
    );
  }
}

class GridCell extends StatelessWidget {
  final int x;
  final int y;
  final String letter;
  final bool isPartOfWord;
  final Function onSelect;
  const GridCell({
    Key? key,
    required this.x,
    required this.y,
    required this.letter,
    required this.onSelect,
    this.isPartOfWord = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(x, y),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: isPartOfWord ? Colors.green : Theme.of(context).canvasColor,
          border: Border.all(),
        ),
        child: Text(
          letter,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 4),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}