import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/home/widgets/custom_drawer.dart';
import 'package:listinha/src/home/widgets/user_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          UserImageButton(),
        ],
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nova Atividade'),
        icon: const Icon(Icons.edit_note_rounded),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SegmentedButton<int>(
                segments: const [
                  ButtonSegment(
                    value: 0,
                    label: Text('Todos'),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('A fazer'),
                  ),
                  ButtonSegment(
                    value: 2,
                    label: Text('Feito'),
                  ),
                  ButtonSegment(
                    value: 3,
                    label: Text('Excluidos'),
                  ),
                ],
                selected: const {0},
                onSelectionChanged: (values) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
