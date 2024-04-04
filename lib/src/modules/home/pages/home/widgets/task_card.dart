import 'package:flutter/material.dart';
import 'package:listinha/src/shared/services/realm/models/task/task_model.dart';

enum TaskCardStatus {
  pending(icon: Icons.access_time_rounded, text: 'Pendente'),
  done(icon: Icons.done_rounded, text: 'Concluida'),
  disable(icon: Icons.do_not_disturb_alt_outlined, text: 'Desativada');

  final IconData icon;
  final String text;

  const TaskCardStatus({required this.icon, required this.text});
}

class TaskCard extends StatelessWidget {
  final TaskBoard board;
  final double height;
  const TaskCard({super.key, required this.board, this.height = 130.0});

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) return 0;
    final completes = tasks.where((task) => task.done).length;
    return completes / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    final completes = tasks.where((task) => task.done).length;
    return '$completes / ${tasks.length}';
  }

  TaskCardStatus getTaskStatus(TaskBoard board, double progress) {
    if (board.enable) return TaskCardStatus.pending;
    if (progress < 1.0) return TaskCardStatus.done;
    return TaskCardStatus.pending;
  }

  Color getCardBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.done:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disable:
        return theme.colorScheme.errorContainer;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final progress = getProgress(board.tasks);
    final status = getTaskStatus(board, progress);
    final icon = status.icon;
    final title = board.title;
    final tasksDone = getProgressText(board.tasks);
    final backgroundColorCard = getCardBackgroundColor(status, theme);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColorCard.withOpacity(0.7),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: theme.iconTheme.color?.withOpacity(0.5),
              ),
              const Spacer(),
              Text(
                status.text.toUpperCase(),
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                  color: textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          if (board.tasks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: getProgress(board.tasks),
                  color: backgroundColorCard,
                ),
                const SizedBox(height: 6),
                Text(
                  tasksDone,
                  style: textTheme.bodyMedium,
                ),
              ],
            )
        ],
      ),
    );
  }
}
