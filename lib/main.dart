import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Post.dart';
import 'package:flutter_app/view/LinkedinPostWidget.dart';
import 'package:flutter_app/view/settings/SettingsWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Orest Shemeliuk TI-72'),
        '/routingScreen': (context) => RoutingScreen(),
      },
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
  static List<Post> posts = [
    Post(
      userName: "Orest Shemeliuk",
      userStatus: "Open for new Opportunities",
      userText: "When you market on Linkedin, you reach customers who "
          "are ready to do business whenerer the happen",
      userAvatar:
          'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
      userPostImage:
          'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
    ),
    Post(
      userName: "Andrii Vasyliabs",
      userStatus: "Open for new Opportunities",
      userText: "Winter holidays are coming, hurry up to apply for our open"
          " positions and moonshot your career in 2021 with the industry leader in BI",
      userAvatar:
          'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
      userPostImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/80-391-9007_Kyiv_DSC_5895.jpg/250px-80-391-9007_Kyiv_DSC_5895.jpg',
    ),
    Post(
      userName: "Andrii Vasyliabs",
      userStatus: "Open for new Opportunities",
      userText: "Winter holidays are coming, hurry up to apply for our open"
          " positions and moonshot your career in 2021 with the industry leader in BI",
      userAvatar:
          'https://www.news4jax.com/resizer/b89RYEm5oAgzxJxWIGoyLJ9lZu8=/960x960/smart/filters:format(jpeg):strip_exif(true):strip_icc(true):no_upscale(true):quality(65)/'
          'cloudfront-us-east-1.images.arcpublishing.com/gmg/X462YQ4HIJEGHHX2I3LXRV4G7A.jpg',
      userPostImage:
          'https://cdn.statcdn.com/Infographic/images/normal/19728.jpeg',
    ),
    Post(
      userName: "Andrii Vasyliabs",
      userStatus: "Open for new Opportunities",
      userText: "Winter holidays are coming, hurry up to apply for our open"
          " positions and moonshot your career in 2021 with the industry leader in BI",
      userAvatar:
          'https://lh3.googleusercontent.com/proxy/LLz6mu3T-x3hnkslpViePSLatOND_lIrZHGd6fnG6A'
          'sc_YwL0fFHJdDJvJVAuJSHCk27YJBJznEUY4OseVX2hnu5iXdhOfv6Uf2nnSRZy8mYCyUsJY2LcQ',
      userPostImage:
          'https://media-cdn.tripadvisor.com/media/photo-m/1280/1a/d2/06/e1/little-beautiful-church.jpg',
    ),
    Post(
      userName: "Andrii Vasyliabs",
      userStatus: "Open for new Opportunities",
      userText: "Winter holidays are coming, hurry up to apply for our open"
          " positions and moonshot your career in 2021 with the industry leader in BI",
      userAvatar:
          'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
      userPostImage:
          'https://cdn.the-scientist.com/assets/articleNo/66864/aImg/35078/foresttb-m.jpg',
    ),
  ];

  int _currentIndex = 0;

  final tabs = [
    ListView.separated(
      itemCount: posts.length,
      separatorBuilder: (_, index) => Divider(
        color: Colors.grey[300],
        thickness: 15,
      ),
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, index) => LinkedinPostWidget(
        post: posts[index],
      ),
    ),
    NavigationExample(),
    Center(
      child: Text("Post"),
    ),
    Center(
      child: Text("Notifications"),
    ),
    SettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined),
              label: "My Network",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Jobs",
            ),
          ],
          onTap: (index) => {
            setState(() {
              _currentIndex = index;
            })
          },
        ),
      ),
    );
  }
}

class NavigationExample extends StatelessWidget {
  const NavigationExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          RaisedButton(
            color: Colors.amberAccent[100],
            onPressed: () {
              _showSnackBarWithReturnedTextFromNavigator(context);
            },
            child: Text(
              'Navigator nav',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 30),
          RaisedButton(
            color: Colors.green[500],
            onPressed: () {
              Navigator.pushNamed(context, '/routingScreen',
                  arguments: "Passed arguments");
            },
            child: Text('Routing nav', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  _showSnackBarWithReturnedTextFromNavigator(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigatorScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class NavigatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'return text!');
                },
                child: Text('Back to Previos Screen!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Routing Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text(args),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Previos Screen!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
