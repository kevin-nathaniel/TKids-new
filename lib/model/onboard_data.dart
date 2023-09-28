class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\nTKids App',
    image: 'assets/images/onboarding/onboarding_image_1.png',
  ),
  OnBoarding(
    title: 'Kids monitoring app',
    image: 'assets/images/onboarding/onboarding_image_2.png',
  ),
  OnBoarding(
    title: 'Keep track your kids progress',
    image: 'assets/images/onboarding/onboarding_image_3.png',
  ),
  OnBoarding(
    title: 'Join Us',
    image: 'assets/images/onboarding/onboarding_image_4.png',
  ),
];
