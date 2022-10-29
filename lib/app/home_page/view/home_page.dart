import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/fonts.dart';
import 'package:movie_project_banglore/app/core/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: SizedBox(
                height: size.height / 4.2,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Icon(Icons.arrow_upward_rounded),
                            ),
                            Text("sd"),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Icon(Icons.arrow_downward),
                            ),
                            height10,
                            Text("data")
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            "assets/e.jpg",
                            height: size.height / 6.5,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bond 25",
                              style: gFontsSans(sz: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const CustomRichText(
                                mainTitle: 'Genere :',
                                subTitle: 'Action,acbdbd'),
                            const CustomRichText(
                                mainTitle: 'Genere :',
                                subTitle: 'Action,acbdbd'),
                            const CustomRichText(
                                mainTitle: 'Genere :',
                                subTitle: 'Action,acbdbd'),
                            const Text("min | Enflis |2 Apr"),
                            const Text("min | Enflis |2 Aprssdsd"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        width: size.width / 1.1,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("sds")))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  const CustomRichText({
    Key? key,
    required this.mainTitle,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: mainTitle,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(
              text: subTitle,
              style: const TextStyle(
                  color: Color.fromARGB(255, 12, 12, 12), fontSize: 15),
            )
          ]),
    );
  }
}
