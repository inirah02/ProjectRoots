import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PhoneRecallActivity extends StatefulWidget {
  static const path = '/phone-recall';
  static const name = 'Phone Recall';
  const PhoneRecallActivity({
    super.key,
  });

  @override
  State<PhoneRecallActivity> createState() => _PhoneRecallActivityState();
}

class _PhoneRecallActivityState extends State<PhoneRecallActivity> {
  late final TextEditingController _textEditingController;
  bool? correctAns;
  FlutterTts flutterTts = FlutterTts();

  @override
  initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  _onEvaluateAnswer() {
    setState(() {
      correctAns = _textEditingController.text == "8762354645";
    });
  }

  void _repeat() {
    flutterTts.speak("Can you recall your phone number");
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text("Phone Recall"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter your phone number", // Heading Text Style
              style: Theme.of(context).textTheme.headline4!,
            ),
            const SizedBox(
              height: 45,
            ),
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 45,
            ),
            Align(
              child: ElevatedButton(
                  onPressed: _onEvaluateAnswer,
                  child: const Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 53, 227, 218),
                      fontSize: 25,
                    ),
                  )),
            ),
            Text(result),
            ElevatedButton.icon(
              onPressed: _repeat,
              icon: const Icon(Icons.repeat),
              label: const Text("Repeat word"),
            ),
            const SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
