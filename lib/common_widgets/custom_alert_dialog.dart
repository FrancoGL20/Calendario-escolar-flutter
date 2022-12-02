import 'package:calendario_escolar/common_widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.defaultActionText,
      this.cancelActionText})
      : super(key: key);
  final String title;
  final String content;
  final String defaultActionText;
  final String? cancelActionText;

  Future<bool?> show(BuildContext context) async {
    return await showDialog<bool>(
        context: context,
        builder: (context) => this,
        barrierDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = [];
    if (cancelActionText != null) {
      actions.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelActionText!,style: TextStyle(color: ColorsF().escoger("primario"))),
        ),
      );
    }

    actions.add(
      TextButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(defaultActionText,style: TextStyle(color: ColorsF().escoger("primario")),),
      ),
    );

    return List<Widget>.from(actions);
  }
}
