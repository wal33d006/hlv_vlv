import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'HLV VLV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyClass> _items;
  List<Story> _stories;
  List<Story> _cards;
  List<Story> _requests;

  @override
  void initState() {
    super.initState();
    _populateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter text to search',
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildStoryListView(),
                _buildCardListView(),
                _buildRequestListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildStoryListView() {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemExtent: 100.0,
        itemBuilder: (context, index) {
          var item = _stories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item.storyUrl,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://iisy.fi/wp-content/uploads/2018/08/user-profile-male-logo.jpg',
                        ),
                        radius: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _populateData() {
    _stories = <Story>[
      Story(
          name: 'Hello',
          storyUrl:
          'https://images.unsplash.com/photo-1519501025264-65ba15a82390?ixlib=rb-1.2.1&w=1000&q=80'),
      Story(
          name: 'Waleed',
          storyUrl:
          'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg'),
      Story(
          name: 'Flutter',
          storyUrl:
          'http://paranoidandroid.co/assets/wallpapers/2018/submerged_desktop_thumb.jpg'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://images.pexels.com/photos/799443/pexels-photo-799443.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://i.pinimg.com/originals/90/ff/c3/90ffc3cc0cfe33f1940d548a6c7602d1.jpg'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    ];
    _cards = <Story>[
      Story(
          name: 'Community',
          storyUrl: 'https://wallpaperaccess.com/full/1079198.jpg'),
      Story(
          name: 'Google',
          storyUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdx5NkTqe7sjEU1vNXBl-X_v8t5cBM21L-vOs_z6qwVu5JLHjKhw&s'),
      Story(
          name: 'Dart',
          storyUrl:
          'https://images.unsplash.com/photo-1535370976884-f4376736ab06?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
      Story(
          name: 'Dart',
          storyUrl: 'https://wallpaperplay.com/walls/full/7/c/f/34782.jpg'),
      Story(
          name: 'Dart',
          storyUrl:
          'https://pbs.twimg.com/profile_images/779305023507271681/GJJhYpD2_400x400.jpg'),
      Story(
          name: 'Dart',
          storyUrl:
          'https://d33wubrfki0l68.cloudfront.net/495c5afa46922a41983f6442f54491c862bdb275/67c35/static/images/wallpapers/playground-07.png'),
    ];
    _requests = <Story>[
      Story(
          name: 'Card',
          storyUrl:
          'https://cdn.shopify.com/s/files/1/0407/6641/files/PDW_2560x1600_SPACEWALK.jpg?16884965820929473526'),
      Story(
          name: 'Material',
          storyUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDkSuT0b8kv-uKwraId5H_B_R7_eLSpjJ8Kaah3XhgcDc116r_&s'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/fd7cf597-29e6-4db9-bde8-25fc850c6ec4/d4ywq58-0b3d335d-1839-488c-ad9f-464957d57d8f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ZkN2NmNTk3LTI5ZTYtNGRiOS1iZGU4LTI1ZmM4NTBjNmVjNFwvZDR5d3E1OC0wYjNkMzM1ZC0xODM5LTQ4OGMtYWQ5Zi00NjQ5NTdkNTdkOGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KrGaOUYlIKp47LBzkNOAlZWqUpoJPGg4K9Rote_REj4'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://images.squarespace-cdn.com/content/v1/5925832e03596efb6d4b502a/1552467575287-2JMW8W2J3EJFYMP2QZQR/ke17ZwdGBToddI8pDm48kNvT88LknE-K9M4pGNO0Iqd7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1USOFn4xF8vTWDNAUBm5ducQhX-V3oVjSmr829Rco4W2Uo49ZdOtO_QXox0_W7i2zEA/DRG_Wallpaper_GlacialStrata.jpg?format=2500w'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://images.pexels.com/photos/556416/pexels-photo-556416.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      Story(
          name: 'Flutter',
          storyUrl:
          'https://prodimages.the-neon-store.com/350/flex350/tns-f624531-razer-logo-neon-flex-sign.jpg'),
    ];
  }

  Widget _buildCardListView() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cards.length,
        itemExtent: 200.0,
        itemBuilder: (context, index) {
          var item = _cards[index];
          return Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item.storyUrl,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black26,
                          BlendMode.darken,
                        ),
                      ),
                      color: Colors.grey,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text(item.name),
                  subtitle: Text(
                    'waleedarshad@email.com',
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRequestListView() {
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _requests.length,
        itemExtent: 240.0,
        itemBuilder: (context, index) {
          var item = _cards[index];
          return Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item.storyUrl,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black26,
                          BlendMode.darken,
                        ),
                      ),
                      color: Colors.grey,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              item.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Reject'),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text('Accept'),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Story {
  final String name;
  final String email;
  final String profileUrl;
  final String storyUrl;

  Story({this.name, this.profileUrl, this.storyUrl, this.email});
}

class MyClass {
  List<Story> values;

  MyClass({this.values});
}
