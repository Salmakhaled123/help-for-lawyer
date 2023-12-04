import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'lawyer_state.dart';

class LawyerCubit extends Cubit<LawyerState> {
  LawyerCubit() : super(LawyerInitial());
  TextEditingController nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}
