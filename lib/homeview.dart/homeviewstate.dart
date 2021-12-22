import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _isSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contacts",
            style: Theme.of(context).appBarTheme.titleTextStyle),
        bottom: PreferredSize(
          child: const TextField(
            decoration: InputDecoration(
                hintText: "search contacts", icon: Icon(Icons.search)),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.timer,
              ),
              label: "Timer"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
              ),
              label: "Contact"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.voicemail,
              ),
              label: "Voicemail"),
        ],
        selectedIconTheme:
            Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        currentIndex: _selectedIndex,
        onTap: _isSelected,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Mukaramatu",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              "+233555033679",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      TextButton(onPressed: () {}, child: Text("Edit"))
                    ],
                  ),
                );
              },
              icon: Icon(Icons.more_horiz),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
