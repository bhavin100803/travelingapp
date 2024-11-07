import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

// class dynamicLinkProvider {
//   Future<String> createLink(String refCode) async {
//     final String url = "https://travelbuddyapp.page.link/downloads$refCode";
//
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//         androidParameters: const AndroidParameters(
//             packageName: "com.example.travelbuddy", minimumVersion: 0),
//         iosParameters: const IOSParameters(
//             bundleId: "app.travelbuddy", minimumVersion: "0"),
//         link: Uri.parse(url),
//         uriPrefix: "https://travelbuddyapp.page.link");
//
//     final FirebaseDynamicLinks link = await FirebaseDynamicLinks.instance;
//
//     final refLink = await link.buildShortLink(parameters);
//     return refLink.shortUrl.toString();
//   }
//
//   void initDynamicLink()async{
//     final instancLink = await   FirebaseDynamicLinks.instance.getInitialLink();
//     if(instancLink != null){
//       final Uri refLink = instancLink.link;
//
//       Share.share("${refLink.data}");
//     }
//   }
// }


class DynamicLinkService {
  Future<Uri> createDynamicLink(String postId, String postTitle) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: '"https://travelbuddyapp.page.link', // Replace with your dynamic link domain
      link: Uri.parse('https://travelbuddyapp.page.link/downloads=$postId'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.travelbuddy', // Replace with your app's package name
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.travelbuddy', // Replace with your app's bundle ID
        minimumVersion: '1.0.0',
      ),
    );

    final ShortDynamicLink shortDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    return shortDynamicLink.shortUrl;
  }
}