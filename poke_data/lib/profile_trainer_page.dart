import 'package:flutter/material.dart';

class ProfileTrainerPage extends StatefulWidget {
  const ProfileTrainerPage({Key? key}) : super(key: key);
  @override
  State<ProfileTrainerPage> createState() => _ProfileTrainerPageState();
}

class _ProfileTrainerPageState extends State<ProfileTrainerPage> {
  String currentTab = "favorites";
  String user = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 42, left: 22, right: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _userInfo(),
            const SizedBox(
              height: 20,
            ),
            _tabBar(),
            const Divider(color: Colors.black, thickness: 1),
            tabController(),
          ],
        ));
  }

  _userInfo() {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/default_user_icon.png",
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
            Icons.arrow_back_ios_new,
            size: 18.0,
          ))
    ]);
  }

  _tabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => _selectTabItem("favorites"),
          child: Text(
            "Favorites",
            style: TextStyle(
                fontSize: 13,
                fontWeight: (currentTab == "favorites"
                    ? FontWeight.bold
                    : FontWeight.normal)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () => _selectTabItem("teams"),
          child: Text(
            "Teams",
            style: TextStyle(
              fontSize: 13,
              fontWeight:
                  (currentTab == "teams" ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }

  _selectTabItem(String tabName) {
    if (tabName != currentTab) {
      if (tabName == "teams") {
        currentTab = "teams";
        setState(() {});
      } else {
        currentTab = "favorites";
        setState(
          () {},
        );
      }
    }
  }

  _pokemonListView() {
    return Expanded(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        _pokemonCard("assets/images/charmander.png", "Charmander", "Fire", "1"),
        _pokemonCard("assets/images/dratini.png", "Dratini", "Dragon", "2"),
        _pokemonCard("assets/images/snorlax.png", "Snorlax", "Normal", "3"),
        _pokemonCard(
            "assets/images/jigglypuff.png", "Jigglypuff", "Fairy", "4"),
        _pokemonCard("assets/images/charmander.png", "Charmander", "Fire", "1"),
        _pokemonCard("assets/images/dratini.png", "Dratini", "Dragon", "2"),
        _pokemonCard("assets/images/snorlax.png", "Snorlax", "Normal", "3"),
        _pokemonCard(
            "assets/images/jigglypuff.png", "Jigglypuff", "Fairy", "4"),
        _pokemonCard("assets/images/charmander.png", "Charmander", "Fire", "1"),
        _pokemonCard("assets/images/dratini.png", "Dratini", "Dragon", "2"),
        _pokemonCard("assets/images/snorlax.png", "Snorlax", "Normal", "3"),
        _pokemonCard(
            "assets/images/jigglypuff.png", "Jigglypuff", "Fairy", "4"),
      ],
    ));
  }

  _pokemonCard(String assetString, String name, String type, String index) {
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
                    ),
                    Text(
                      type,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ]),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    index.length == 1 ? "#0$index" : "#$index",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  )),
            ],
          ),
        ));
  }

  _teamsListView() {
    return ListView();
  }

  tabController() {
    if (currentTab == "favorites") {
      return _pokemonListView();
    } else {
      return _pokemonListView();
    }
  }
}