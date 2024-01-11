import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portofolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portofolio'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.10, 1.0],
                colors: [Colors.blue, Colors.blueAccent],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('images/img_ogek_1.jpg'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Gusti Ayu Putri Dyah Pithaloka',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Student',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 2.0),
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 11, 12, 12),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'A student from the Information Technology program at UNDIKNAS University, who has an interest in exploring the world of technology. Known as a creative thinker, curious learner, and tenacious individual who brings a positive atmosphere. Equipped with strong work ethics and a strong sense of leadership, with a record of organizational experiences.',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.0),
                  buildSkillsCard(['Canva', 'Figma', 'Google Workspace']),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildContactButton(
                        'Instagram',
                        FontAwesomeIcons.instagram,
                        'https://www.instagram.com/username',
                      ),
                      buildContactButton('Twitter', FontAwesomeIcons.twitter,
                          'https://www.twitter.com/username'),
                      buildContactButton(
                        'Facebook',
                        FontAwesomeIcons.facebook,
                        'https://www.facebook.com/username',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactButton(String label, IconData icon, String link) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icon),
            color: Colors.blue,
            onPressed: () {},
          ),
          SizedBox(height: 5.0),
          Text(
            label,
            style: TextStyle(color: const Color.fromARGB(255, 6, 6, 6)),
          ),
        ],
      ),
    );
  }

  Widget buildSkillsCard(List<String> skills) {
    List<String> skillTitles = [
      '5',
      '5',
      '4',
    ];

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber, // Warna emas
                ),
                SizedBox(width: 4.0),
                Text(
                  'Skills',
                  style: TextStyle(
                    color: Color.fromARGB(255, 12, 12, 12),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: skills.asMap().entries.map((entry) {
                int index = entry.key;
                String skill = entry.value;
                String skillTitle = index < skillTitles.length
                    ? skillTitles[index]
                    : 'Undefined Skill';

                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16.0, // Ukuran bintang
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '$skillTitle: $skill',
                        style: TextStyle(
                          color: Colors.black, // Warna teks
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
