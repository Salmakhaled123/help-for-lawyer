import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_lawyer/core/app_router.dart';
import 'package:help_lawyer/models/onboarding_item_model.dart';
import 'package:help_lawyer/cubits/on_boarding/onboarding_cubit.dart';
import 'package:help_lawyer/views/lawyer_name/widgets/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit()..initialPage(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: onBoardingItems.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(onBoardingItems[i].image),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              onBoardingItems[i].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              onBoardingItems[i].discription,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        onBoardingItems.length,
                        (index) => Container(
                              height: 10,
                              width: currentIndex == index ? 25 : 10,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal,
                              ),
                            )),
                  ),
                ),
                Container(
                    height: 55,
                    margin: EdgeInsets.all(40),
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Skip',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.lawyerName);
                      },
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
