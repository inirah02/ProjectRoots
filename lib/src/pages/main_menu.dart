import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/activities.dart';
import 'package:projectroots/pages.dart';
import 'package:projectroots/src/activities/patient_records.dart';
//import 'package:projectroots/activities/table.dart';

class MainMenu extends ConsumerWidget {
  final Map<String, dynamic> user;
  const MainMenu(this.user, {super.key});

  _navigateToScreen(context, path) {
    Navigator.of(context).pushNamed(path);
  }

  Widget _getMenuItemsForUser(context, user) {
    switch (user['profile_type']) {
      case 1:
        return Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 20.0,
            runAlignment: WrapAlignment.center,
            runSpacing: 20.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            textDirection: TextDirection.rtl,
            verticalDirection: VerticalDirection.up,
            children: [
              ElevatedButton(
                onPressed: () => _navigateToScreen(context, TodoActivity.path),
                child: Text('Add ToDo Reminder'),
              ),
              ElevatedButton(
                onPressed: () => _navigateToScreen(context, MedicineList.path),
                child: Text('View Medication List'),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, ReverseSpellActivity.path),
                child: Text('Check GPS Location of patient'),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, PictureQuizActivity.path),
                child: Text('Check vitals of patient'),
              ),
            ]);

      case 2:
        return Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 20.0,
            runAlignment: WrapAlignment.center,
            runSpacing: 20.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            textDirection: TextDirection.rtl,
            verticalDirection: VerticalDirection.up,

            //padding:const EdgeInsets.symmetric(vertical: 100.0), child:Column( children:[
            children: [
              Container(
                  child: Image.asset("assets/images/patient_proflie_pic.png")),
              ElevatedButton(
                onPressed: () => _navigateToScreen(context, MedicineList.path),
                child: Text('Medication'),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, WordSearchActivity.path),
                child: Text('Game Stats'),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, PatientRecords.path),
                child: Text('Patient History'),
              ),
            ]);
      default:
        return Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 20.0,
            runAlignment: WrapAlignment.center,
            runSpacing: 20.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            textDirection: TextDirection.rtl,
            verticalDirection: VerticalDirection.up,
            children: [
              ElevatedButton(
                onPressed: () => _navigateToScreen(context, TodoActivity.path),
                child: const Text(TodoActivity.name),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, ReverseSpellActivity.path),
                child: const Text(ReverseSpellActivity.name),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, WordSearchActivity.path),
                child: const Text(WordSearchActivity.name),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, PictureQuizActivity.path),
                child: const Text(PictureQuizActivity.name),
              ),
              ElevatedButton(
                onPressed: () =>
                    _navigateToScreen(context, PhoneRecallActivity.path),
                child: const Text(PhoneRecallActivity.name),
              ),
            ]);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget childt = _getMenuItemsForUser(context, user);
    return Scaffold(appBar: AppBar(title: Text("Main menu")), body: childt);
  }
}
