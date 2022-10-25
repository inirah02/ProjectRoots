import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:projectroots/src/extensions/string.dart';

class ReverseSpellActivity extends StatefulWidget {
  static const path = '/reverse_spelling';
  static const name = 'Reverse Spell';
  final String targetWord;

  const ReverseSpellActivity({
    super.key,
    required this.targetWord,
  });

  @override
  State<ReverseSpellActivity> createState() => _ReverseSpellActivityState();
}

class _ReverseSpellActivityState extends State<ReverseSpellActivity> {
  bool isStarted = false;
  bool? correctAns;
  FlutterTts flutterTts = FlutterTts();
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  void _onStart() {
    setState(() {
      isStarted = true;
    });
  }

  void _speakWord() {
    flutterTts.setLanguage("en-IN");
    flutterTts.setPitch(1);
    flutterTts.speak("Reverse spell the word");
    flutterTts.speak(widget.targetWord);
    _onStart();
  }

  void _repeat() {
    flutterTts.speak(widget.targetWord);
  }

  void _onEvaluateAnswer() {
    print(widget.targetWord.reverse());
    setState(() {
      correctAns = _textEditingController.text.toLowerCase() ==
          widget.targetWord.reverse().toLowerCase();
    });
  }

  Widget _buildActiviyWidget(BuildContext context) {
    String result = "";
    if (correctAns != null && correctAns!) {
      result = "Correct!";
      flutterTts.speak("You got it right!");
    } else if (correctAns != null && !correctAns!) {
      result = "Try again";
      flutterTts.speak("Lets give it another try");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _textEditingController,
        ),
        const SizedBox(
          height: 45,
        ),
        ElevatedButton(
            onPressed: _onEvaluateAnswer,
            child: const Text(
              'Submit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 181, 114, 185),
                fontSize: 25,
              ),
            )),
        Text(result),
        ElevatedButton(onPressed: _repeat, child: Text("Repeat word")),
        const SizedBox(
          height: 45,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // start game button
    // onclick pick one name and send to tts
    // target word spoken out loud by the app(text to speech)
    //input text box the user can type the answer
    //o/p for success
    // repeat word button to repeat word
    // success/failure
    if (isStarted) {
      return Material(child: _buildActiviyWidget(context));
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 116, 177),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Reverse Spell'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _speakWord,
          child: const Text(
            'Start Game',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 235, 143, 15),
              fontSize: 70,
            ),
          ),
        ),
      ),
    );
  }
}
