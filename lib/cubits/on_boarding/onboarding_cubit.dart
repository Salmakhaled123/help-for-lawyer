import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) =>
      BlocProvider.of<OnboardingCubit>(context);
  int currentIndex = 0;
  PageController _controller = PageController();

  void initialPage() {
    _controller = PageController(initialPage: 0);
    emit(OnboardingInitialPage());
  }

  onPageChanged(int index) {
    currentIndex = index;
    emit(PageChangedSuccessfuly());
  }
}
