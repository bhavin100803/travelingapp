class UnbordingContent {
  String image;
    String   title;
 String desc;
  UnbordingContent({
    required this.image,
    required this.title,
     required this.desc,
  });

}

List<UnbordingContent> contents = [
  UnbordingContent(
    image: "assets/onbording1.jpg",

     title: "Discover New Destination ",
     desc: "Join us to explore hidden game and make unforgettable memories",
  ),
  UnbordingContent(
    image: "assets/onboarding2.jpg",
    title: "Easy & Secure Travel",
    desc:"Enjoy a seamless journey with all planning and support covered"
    // "",
  ),
  UnbordingContent(
    image: "assets/onboarding3.jpg",
    title: "Quick Start to Adventure ",
    desc: "Just a few clicks, and you're off to your dream destination"
    // "",
  ),
];
