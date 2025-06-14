import 'package:flutter/material.dart';

class CreateMessageTextFormField extends StatelessWidget {
  const CreateMessageTextFormField({
    super.key,
    this.onSubmitted,
    required this.textEditingController,
    this.onChanged,
  });
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          errorMaxLines: 2,
          hintText: "Tape your message",
          hintStyle: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.7),
          ),
          enabledBorder: border(color: const Color(0xff252525)),
          focusedBorder: border(color: const Color.fromARGB(255, 13, 169, 91)),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onSubmitted: onSubmitted,
        onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder border({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }
}
