import 'package:flutter/material.dart';
import 'package:temporalobe/ui/box/services/index.dart';
import 'package:temporalobe/ui/box/settings/index.dart';
import 'package:temporalobe/ui/router.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({
    super.key,
    required this.tab,
  });

  final BoxTab tab;

  @override
  Widget build(BuildContext context) {
    final index = tab.index;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: IndexedStack(
        index: index,
        children: const [
          ServicesPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) => BoxRoute(BoxTab.values[index]).go(context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}

enum BoxTab { home, setting }
