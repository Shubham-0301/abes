import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ABES CONNECT'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          
            children: <Widget>[
              clickableContainer('Attendance', 'assets/attendance.png',
                  'https://abes.web.simplifii.com/dashboard.php?tab_id=0&config=student&h_tab_id=1&page=1'),
              clickableContainer('Quize', 'assets/quiz.png',
                  'https://quiz.abesaims.site/#/access-quiz?unique_code=NHQ1&pin=1234&user_unique_code=TEST001'),
              clickableContainer(
                  'Wifi', 'assets/wifi.png', 'http://192.168.1.254:8090/'),
              clickableContainer('Aktu Result', 'assets/result.png',
                  'https://erp.aktu.ac.in/webpages/oneview/oneview.aspx'),
              clickableContainer(
                  'Aktu Question Paper',
                  'assets/QuestionPaper.png',
                  'https://www.aktuonline.com/aktu-first-year-papers.html'),
              clickableContainer(
                  'Aktu ERP', 'assets/erp.png', 'https://erp.aktu.ac.in/'),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget clickableContainer(String text, String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        _launchURL(Uri.parse(url));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(15.0),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  //finction to open a url in the browser when called
  Future<void> _launchURL(Uri url) async {
    // async keyword indicated that this funtion may perform asynchronous operation...

    //check if the url can be launched usinng the launchURl function
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not lanch the $url');
    }
  }
}
