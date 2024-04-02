import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Row(
            children: [
              Text(
                'Sincronizar',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 15),
              Text('31/03/2024', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.settings),
          label: Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
