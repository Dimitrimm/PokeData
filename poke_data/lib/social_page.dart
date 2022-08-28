import 'package:flutter/material.dart';

void main() {
  runApp(const SocialPage());
}

class SocialPage extends StatelessWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserFollows(),
    );
  }
}

class UserFollows extends StatefulWidget {
  const UserFollows({Key? key}) : super(key: key);

  @override
  State<UserFollows> createState() => _UserFollowsState();
}

class _UserFollowsState extends State<UserFollows> {
  String currentTab = "Following";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 42, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _userProfile(),
                const SizedBox(
                  height: 20,
                ),
                _tabBar(),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                tabController(),
              ],
            )));
  }

  _userProfile() {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/jogador.png",
                height: 100,
                width: 100,
              ),
              const Text(
                "User",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          )),
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          size: 18.0,
        ))
    ]);
  }

  _tabBar() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => _selectTabItem("Following"),
          child: Text(
            "Following",
            style: TextStyle(
                fontSize: 13,
                fontWeight: (currentTab == "Following"
                    ? FontWeight.bold
                    : FontWeight.normal)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () => _selectTabItem("Followers"),
          child: Text(
            "Followers",
            style: TextStyle(
                fontSize: 13,
                fontWeight: (currentTab == "Followers"
                    ? FontWeight.bold
                    : FontWeight.normal)),
          ),
        ),
      // IconButton(
      //     onPressed: _selectTabItem("Followers"),
      //     icon: const Icon(
      //     Icons.add,
      //     size: 18.0,
      //   ))
      ],
    );
  }

  _selectTabItem(String tabName) {
    if (tabName != currentTab) {
      if (tabName == "Followers") {
        currentTab = "Followers";
        setState(() {});
      } else {
        currentTab = "Following";
        setState(
          () {},
        );
      }
    }
  }

  _followingListView() {
    return Expanded(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        _userCard("assets/images/jogador.png", "RGamer Loko"),
        _userCard("assets/images/jogadora.png", "Eldarya Lima"),
        _userCard("assets/images/jogadora.png", "Dudexxz"),
        _userCard("assets/images/jogador.png", "Feltz"),
        _userCard("assets/images/jogadora.png", "XPaolaX"),
      ],
    ));
  }

    _followersListView() {
    return Expanded(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        _userCard("assets/images/jogadora.png", "XLuizaX"),
        _userCard("assets/images/jogadora.png", "feh lins"),
        _userCard("assets/images/jogador.png", "Guih lopes"),
        _userCard("assets/images/jogador.png", "moutz"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
        _userCard("assets/images/jogadora.png", "lila"),
      ],
    ));
  }

  _userCard(String assetString, String name) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(height: 60, width: 60, assetString),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        ));
  }

  tabController() {
    if (currentTab == "Following") {
      return _followingListView();
    } else {
      return _followersListView();
    }
  }
}
