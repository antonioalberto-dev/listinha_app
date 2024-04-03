import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/store/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Tema',
              style: textTheme.titleMedium,
            ),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              title: const Text('Sistema'),
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              title: const Text('Light'),
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile(
                value: ThemeMode.dark,
                groupValue: appStore.themeMode.value,
                title: const Text('Dark'),
                onChanged: appStore.changeThemeMode),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: appStore.deleteApp,
              child: const Text(
                'Apagar cache e reiniciar app',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
