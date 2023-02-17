import 'packagefluttermaterial.dart';

class PhoneRecall extends StatefulWidget {
  @override
  _PhoneRecallState createState() = _PhoneRecallState();
}

class _PhoneRecallState extends StatePhoneRecall {
  TextEditingController _phoneNumberController = TextEditingController();
  bool _phoneNumberValid = false;

  void _validatePhoneNumber(String phoneNumber) {
     Regular expression to match a valid phone number
    RegExp regExp = new RegExp(r'^d{10}$');

    if (regExp.hasMatch(phoneNumber)) {
      setState(() {
        _phoneNumberValid = true;
      });
    } else {
      setState(() {
        _phoneNumberValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar AppBar(
        title Text('Phone Recall'),
      ),
      body Container(
        padding EdgeInsets.all(16.0),
        child Column(
          children Widget[
            TextField(
              controller _phoneNumberController,
              decoration InputDecoration(
                labelText 'Phone Number',
              ),
              onChanged (value) {
                _validatePhoneNumber(value);
              },
            ),
            SizedBox(height 16.0),
            RaisedButton(
              child Text('Recall'),
              onPressed _phoneNumberValid
                   () {
                       Implement phone recall functionality here
                      String phoneNumber = _phoneNumberController.text;
                       Do something with the phone number
                    }
                   null,
            ),
          ],
        ),
      ),
    );
  }
}
