import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/fonts.dart';
import 'package:movie_project_banglore/app/core/widget.dart';

class CustomContainerUi extends StatelessWidget {
  const CustomContainerUi({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
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
                    Text("0"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Icon(Icons.arrow_downward),
                    ),
                    height10,
                    Text("Votes")
                  ],
                ),
                Container(
                  height: size.height / 6,
                  width: size.width / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage("assets/e.jpg"))),
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
                        mainTitle: 'Genere :', subTitle: 'Action,acbdbd'),
                    const CustomRichText(
                        mainTitle: 'Genere :', subTitle: 'Action,acbdbd'),
                    const CustomRichText(
                        mainTitle: 'Genere :', subTitle: 'Action,acbdbd'),
                    Text(
                      "min | Enflis |2 Apr",
                      style: gFontsSans(cl: Colors.blue, sz: 13),
                    ),
                    const Text("min | Enflis |2 Aprssdsd"),
                  ],
                ),
              ],
            ),
            SizedBox(
                width: size.width / 1.1,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Watch Trailer")))
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
