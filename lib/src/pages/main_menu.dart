import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectroots/activities.dart';

class MainMenu extends ConsumerWidget {
  final Map<String, dynamic> user;
  const MainMenu(this.user, {super.key});

  _navigateToScreen(context, path) {
    Navigator.of(context).pushNamed(path);
  }

  List<Widget> _getMenuItemsForUser(context, user) {
    switch (user['profile_type']) {
      case 1:
        return [
          ElevatedButton(
            onPressed: () =>
                _navigateToScreen(context, ReverseSpellActivity.path),
            child: Text('ToDo'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToScreen(context, '/'),
            child: Text('Word Search'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToScreen(context, '/'),
            child: Text('Reverse Spell'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToScreen(context, '/'),
            child: Text('Picture Quiz'),
          ),
        ];
      case 2:
        return [
          ElevatedButton(
            onPressed: () =>
                _navigateToScreen(context, ReverseSpellActivity.path),
            child: Text('ToDo'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToScreen(context, '/'),
            child: Text('Word Search'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToScreen(context, '/'),
            child: Text('Reverse Spell'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToScreen(context, '/'),
            child: Text('Picture Quiz'),
          ),
        ];
      default:
        return [
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
        ];
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> children = _getMenuItemsForUser(context, user);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
