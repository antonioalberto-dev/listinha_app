import 'package:flutter/material.dart';
import 'package:listinha/src/modules/home/pages/home/widgets/custom_drawer.dart';
import 'package:listinha/src/modules/home/pages/home/widgets/task_card.dart';
import 'package:listinha/src/modules/home/pages/home/widgets/user_image_button.dart';
import 'package:listinha/src/shared/services/realm/models/task/task_model.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final paddingLeftRight = 50.0;
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
        elevation: 2,
        label: const Text('Nova Atividade'),
        icon: const Icon(Icons.edit_note_rounded),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 45,
                  left: paddingLeftRight,
                  right: paddingLeftRight,
                  bottom: 90,
                ),
                itemBuilder: (_, index) {
                  final board = TaskBoard(Uuid.v4(), 'Nova lista de Tarefas');
                  return TaskCard(
                    board: board,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: 20,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SegmentedButton<int>(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
