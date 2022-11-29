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
        // return Wrap(
        //     direction: Axis.vertical,
        //     alignment: WrapAlignment.center,
        //     spacing: 20.0,
        //     runAlignment: WrapAlignment.center,
        //     runSpacing: 20.0,
        //     crossAxisAlignment: WrapCrossAlignment.center,
        //     textDirection: TextDirection.rtl,
        //     verticalDirection: VerticalDirection.up,
        //     children: [
        //       ElevatedButton(
        //         onPressed: () => _navigateToScreen(context, TodoActivity.path),
        //         child: const Text(TodoActivity.name),
        //       ),
        //       ElevatedButton(
        //         onPressed: () =>
        //             _navigateToScreen(context, ReverseSpellActivity.path),
        //         child: const Text(ReverseSpellActivity.name),
        //       ),
        //       ElevatedButton(
        //         onPressed: () =>
        //             _navigateToScreen(context, WordSearchActivity.path),
        //         child: const Text(WordSearchActivity.name),
        //       ),
        //       ElevatedButton(
        //         onPressed: () =>
        //             _navigateToScreen(context, PictureQuizActivity.path),
        //         child: const Text(PictureQuizActivity.name),
        //       ),
        //       ElevatedButton(
        //         onPressed: () =>
        //             _navigateToScreen(context, PhoneRecallActivity.path),
        //         child: const Text(PhoneRecallActivity.name),
        //       ),
        //     ]);
        return Theme(
            data: ThemeData.dark()
                .copyWith(scaffoldBackgroundColor: Colors.greenAccent),
            child: Scaffold(
              //appBar: AppBar(backgroundColor: Color(0xFFA4C639)),
              body: Container(
                constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    maxWidth: double.infinity,
                    minHeight: double.infinity,
                    minWidth: double.infinity),
                decoration: const BoxDecoration(
                  color: Color(0xfffffde8),
                  image: DecorationImage(
                    image: AssetImage("assets/images/patient_main_menu_bg.jpg"),
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(255, 213, 210, 210), BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 900.0,
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Center(
                            heightFactor: 1.5,
                            child: Center(
                                heightFactor: 1.5,
                                child: Text("What would you like to do today",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 3, 3, 3),
                                        fontSize: 26,
                                        fontFamily: 'bold',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal)))),
                        Center(
                            heightFactor: 1.5,
                            child: ButtonTheme(
                                minWidth: 600.0,
                                height: 100.0,
                                child: ElevatedButton(
                                  onPressed: () => _navigateToScreen(
                                      context, TodoActivity.path),
                                  child: const Text("To-do Reminders"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 10, 10, 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20)),
                                ))),
                        Center(
                            heightFactor: 1.5,
                            child: ButtonTheme(
                                minWidth: 600.0,
                                height: 100.0,
                                child: ElevatedButton(
                                  onPressed: () => _navigateToScreen(
                                      context, WordSearchActivity.path),
                                  child: const Text("Word Search"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 10, 10, 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20)),
                                ))),
                        Center(
                            heightFactor: 1.5,
                            child: ButtonTheme(
                                minWidth: 600.0,
                                height: 100.0,
                                child: ElevatedButton(
                                  onPressed: () => _navigateToScreen(
                                      context, ReverseSpellActivity.path),
                                  child: const Text("Reverse Spell"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 10, 10, 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20)),
                                ))),
                        Center(
                            heightFactor: 1.7,
                            child: ButtonTheme(
                                minWidth: 600.0,
                                height: 170.0,
                                child: ElevatedButton(
                                    child: const Text("Picture Quiz"),
                                    onPressed: () => _navigateToScreen(
                                        context, PictureQuizActivity.path),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 10, 10, 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20))))),
                      ]),
                ),
              ),
            ));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget childt = _getMenuItemsForUser(context, user);
    return Scaffold(appBar: AppBar(title: Text("Main menu")), body: childt);
  }
}
