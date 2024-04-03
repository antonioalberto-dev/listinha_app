import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  final String? name;
  final EdgeInsets? padding;

  const UserImageButton({
    super.key,
    this.name,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        child:
            name != null ? Text(name ?? '') : const Icon(Icons.person_outlined),
      ),
    );
  }
}
