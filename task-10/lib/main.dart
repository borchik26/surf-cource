import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        hintColor: Colors.tealAccent,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 18,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Визитка'),
          backgroundColor: Colors.teal,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal[200]!, Colors.teal[700]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/images/profile_picture.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Люлин Владислав Витальевич',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'О себе',
                      content:
                          'В поисках своего предназначения перепробывал множество профессий, думал уже не найду что будет одновремно интересно мне, нужно людям, востребованно, но в своих поисках наткнулся на Flutter. Зажигающие идеи проектов не дают опускать руки. Кажется я на правильном пути)',
                      iconPath: 'assets/icons/about_icon.svg',
                    ),
                    _buildSection(
                      title: 'Увлечения',
                      content: 'Мотогонки, музыка, походы в горы',
                      iconPath: 'assets/icons/hobbies_icon.svg',
                    ),
                    _buildSection(
                      title: 'Опыт в разработке',
                      content:
                          'Небольшой опыт в сфере Data Science в роли ученика на Яндекс Практикуме, а еще раньше в создании сайтов и интернет магазинов на фрилансе',
                      iconPath: 'assets/icons/experience_icon.svg',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title,
      required String content,
      required String iconPath}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    content,
                    style: TextStyle(
                      fontFamily: 'Timesnewroman',
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
