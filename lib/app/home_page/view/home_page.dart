import 'package:flutter/material.dart';

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
                height: size.height / 4.3,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                        Column(
                          
                          children: const [
                            Icon(Icons.arrow_back),
                            Text("sd"),
                            Icon(Icons.arrow_back),
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
                          
                          children: const [
                            Text("Bond 25"),
                            SizedBox(height: 20,),
                            CustomRichText(
                                mainTitle: 'Genere :',
                                subTitle: 'Action,acbdbd'),
                            CustomRichText(
                                mainTitle: 'Genere :',
                                subTitle: 'Action,acbdbd'),
                            CustomRichText(
                                mainTitle: 'Genere :',
                                subTitle: 'Action,acbdbd'),
                            Text("min | Enflis |2 Apr"),
                            Text("min | Enflis |2 Aprssdsd"),
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
              color: Color.fromARGB(255, 85, 85, 85), fontSize: 10),
          children: <TextSpan>[
            TextSpan(
              text: subTitle,
              style: const TextStyle(
                  color: Color.fromARGB(255, 12, 12, 12), fontSize: 10),
            )
          ]),
    );
  }
}
