import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:temporalobe/ui/box/services/create.dart';
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

    final t = Theme.of(context);
    final scheme = t.colorScheme;

    final openContainer = OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 400),
      openBuilder: (context, closedContainer) {
        return ServiceCreatePage(closed: closedContainer);
      },
      openColor: t.scaffoldBackgroundColor,
      closedColor: scheme.primaryContainer,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      closedElevation: 6,
      closedBuilder: (context, openContainer) {
        return FloatingActionButton(
          onPressed: () {
            openContainer();
          },
          elevation: 0,
          child: const Icon(Icons.add),
        );
      },
    );

    return Scaffold(
      floatingActionButton: tab == BoxTab.home ? openContainer : null,
      body: IndexedStack(
        index: index,
        children: const [
          ServicesPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) =>
            BoxRoute(BoxTab.values[index]).go(context),
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}

enum BoxTab { home, setting }
