import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenu extends ConsumerWidget {
  final Map<String,dynamic> user;
  const MainMenu(this.user,{super.key});


  _navigateToScreen(context, path) {
    Navigator.of(context).pushNamed(path);
  }

  Widget _buildMainMenuForUser(context) {
    print("Building Menu for profile type");
    switch (user['profile_type']) {
      case 1:
        return Text("Care Giver Menu");
      case 2:
        return Text("Doctor Menu");
      default:
        return Column(
          children: [
            ElevatedButton(onPressed: () => _navigateToScreen(context, '/reverse_spell'), child: Text('ToDo'),),
            ElevatedButton(onPressed: () => _navigateToScreen(context, '/reverse_spell'), child: Text('Word Search'),),
            ElevatedButton(onPressed: () => _navigateToScreen(context, '/reverse_spell'), child: Text('Reverse Spell'),),
            ElevatedButton(onPressed: () => _navigateToScreen(context, '/reverse_spell'), child: Text('Picture Quiz'),),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildMainMenuForUser(context);
  }
}