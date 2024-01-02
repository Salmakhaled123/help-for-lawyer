import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_lawyer/cubits/lawyer_name/lawyer_cubit.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.text,
    this.onChanged,
  });
  final String text;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
            value: text,
            groupValue: BlocProvider.of<LawyerCubit>(context).language,
            onChanged: onChanged),
        Text(text),
      ],
    );
  }
}
