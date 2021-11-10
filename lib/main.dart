import 'package:app/SongScreen/ArtistSong.dart';
import 'package:app/SongScreen/MusicPlayer.dart';
import 'package:app/chats/Screens/chatGroupScreen.dart';
import 'package:app/chats/components/createGroup.dart';
import 'package:app/chats/searchGroup.dart';
import 'package:app/chats/searchUser.dart';
import 'package:app/globalHelpers/routes.dart';
import 'package:app/homeScreen/Favourite.dart';
import 'package:app/homeScreen/HomeScreen.dart';
import 'package:app/loginScreen/editprofile.dart';
import 'package:app/loginScreen/loginPage.dart';
import 'package:app/loginScreen/register.dart';
import 'package:app/loginScreen/resetPassword.dart';
import 'package:app/loginScreen/splashScreen.dart';
import 'package:app/profileSection/profileItems/changePassword.dart';
import 'package:app/profileSection/profileSection.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

import 'SongScreen/searchSong.dart';
import 'chats/chats_main_screen.dart';
import 'chats/components/message.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final navigator = VxNavigator(routes: {
    '/': (_, __) => MaterialPage(child: SplashScreen()),
    Routes.loginPage: (_, __) => MaterialPage(child: LoginPage()),
    Routes.homeScreen: (_, __) => MaterialPage(child: HomeScreen()),
    Routes.register: (_, __) => MaterialPage(child: RegistrationPage()),
    Routes.artistSongList: (uri, __) {
      final artist_id = uri.queryParameters["id"];
      return MaterialPage(child: ArtistSongList(artist_id: artist_id));
    },
    Routes.searchSong: (uri, __) {
      final title = uri.queryParameters["title"];
      return MaterialPage(child: SearchSong(title: title));
    },
    Routes.searchUser: (uri, __) {
      final name = uri.queryParameters["name"];
      return MaterialPage(child: SearchUser(name: name));
    },
    Routes.searchGroup: (uri, __) {
      final name = uri.queryParameters["name"];
      return MaterialPage(child: SearchGroup(name: name));
    },
    Routes.profile: (_, __) => MaterialPage(child: Profile()),
    Routes.changePassword: (_, __) => MaterialPage(child: ChangePassword()),
    Routes.fav: (_, __) => MaterialPage(child: Fav()),
    Routes.musicPlayer: (uri, _) {
      final song_id = uri.queryParameters["id"];
      return MaterialPage(
        child: MusicPlayer(
          song_id: song_id,
        ),
      );
    },
    Routes.chatScreen: (_, __) => MaterialPage(child: MainScreen()),
    Routes.messageScreen: (_, __) => MaterialPage(child: MessageScreen()),
    Routes.editProfile: (_, __) => MaterialPage(child: EditProfile()),
    Routes.resetPassword: (_, __) => MaterialPage(child: ResetPasswordPage()),
    Routes.createGroup: (_, __) => MaterialPage(child: CreateGroup()),
    Routes.groups: (_, __) => MaterialPage(child: GroupChatScreen()),
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: VxInformationParser(),
      routerDelegate: navigator,
    );
  }
}
