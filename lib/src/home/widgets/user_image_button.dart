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
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child:
            name != null ? Text(name ?? '') : const Icon(Icons.person_outlined),
      ),
    );
  }
}
