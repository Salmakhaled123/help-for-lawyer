class OnBoardingContent{
  String image ;
  String title;
  String discription;
  OnBoardingContent({required this.image , required this.title , required this.discription});
}

List<OnBoardingContent> onBoardingItems = [
  OnBoardingContent(image: 'assets/onboarding1.png', title: 'Welcome', discription: 'Welcome to maktabi app'),
  OnBoardingContent(image: 'assets/onboarding2.png', title: 'organize and remind', discription: 'Through the app you can organize your dates and we will remind you throuh the app'),
  OnBoardingContent(image: 'assets/onboarding3.png', title: 'easy and free', discription: 'our app is developed to help lawyers easily and you can use it free for a limited time'),
];