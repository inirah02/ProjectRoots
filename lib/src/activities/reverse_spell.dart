import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:projectroots/src/extensions/string.dart';
import 'dart:async';

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
    final confettiController = ConfettiController();
    


    @override
    void dispose() {
      confettiController.dispose();
      super.dispose();
    }

    @override
    String result = "";
    if (correctAns != null && correctAns!) {
      result = "Correct!";
      flutterTts.speak("You got it right!");
    } else if (correctAns != null && !correctAns!) {
      result = "Try again";
      flutterTts.speak("Lets give it another try");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(116, 152, 87, 1),
        title: Text('Reverse Spell'),
      ),
      body: Container(
        constraints: const BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            minHeight: double.infinity,
            minWidth: double.infinity),
        decoration: BoxDecoration(
          color: Color(0xfffffde8),
          image: DecorationImage(
            image: AssetImage("assets/images/patient_main_menu_bg.jpg"),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        height: 1000.0,
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //crossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          children: [
            ConfettiWidget(
              confettiController: confettiController,
              shouldLoop: true,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _textEditingController,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  correctAns = _textEditingController.text.toLowerCase() ==
                      widget.targetWord.reverse().toLowerCase();
                });
                
                if (correctAns!) {
                  confettiController.play();
                  Timer(const Duration(seconds: 2), () {
                    confettiController.stop();
                  });
                }
              },
              child: const Text(
                'Submit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 244, 246),
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  primary: Color.fromARGB(255, 10, 10, 10),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _repeat,
              child: Text(
                "Repeat word",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  primary: Color.fromARGB(255, 10, 10, 10),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
            const SizedBox(
              height: 45,
            ),
            Text(result,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(116, 152, 87, 1),
                )),
          ],
        ),
      ),
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
        backgroundColor: Colors.white10,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(116, 152, 87, 1),
          title: Text('Reverse Spell'),
        ),
        body: Container(
          constraints: const BoxConstraints(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              minHeight: double.infinity,
              minWidth: double.infinity),
          decoration: BoxDecoration(
            color: Color(0xfffffde8),
            image: DecorationImage(
              image: AssetImage("assets/images/patient_main_menu_bg.jpg"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          height: 1000.0,
          padding: const EdgeInsets.symmetric(vertical: 100.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 280),
            child: ElevatedButton(
              onPressed: _speakWord,
              child: const Text(
                'Start Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  primary: Color.fromARGB(255, 10, 10, 10),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
        ));
  }
}
