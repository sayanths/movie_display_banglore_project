import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/fonts.dart';
import 'package:movie_project_banglore/app/core/widget.dart';
import 'package:movie_project_banglore/app/home_page/view/widgets/custom_home_container.dart';
import 'package:movie_project_banglore/app/home_page/view_model/home_page.dart';
import 'package:movie_project_banglore/app/login_page/view/login_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<HomeProvider>().fetchDatas();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.brown,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeProvider>().companyinformation(context);
                  },
                  child: Text(
                    "company info",
                    style: gFontsSans(cl: Colors.black),
                  )),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 87, 0),
        title: const Text("Movie App"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyLogin(),
                    ),
                    (route) => false);
              },
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.yellow),
              ))
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.movieData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      height: 10,
                      thickness: 2,
                    ),
                  );
                },
                itemCount: value.movieData!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    const Icon(Icons.arrow_drop_up_outlined,
                                        size: 50),
                                    Text(value.movieData?[index].totalVoted
                                            .toString() ??
                                        "0"),
                                    const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 60,
                                    ),
                                    const Text("Votes"),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: size.height / 6,
                              width: size.width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          value.movieData![index].poster))),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.movieData![index].title.toString(),
                                    style: gFontsSans(sz: 20),
                                  ),
                                  height10,
                                  CustomRichText(
                                      mainTitle: 'Genere :',
                                      subTitle:
                                          ' ${value.movieData?[index].genre ?? ""}'),
                                  CustomRichText(
                                      mainTitle: 'Language :',
                                      subTitle:
                                          '${value.movieData?[index].language ?? ""}'),
                                  CustomRichText(
                                      mainTitle: 'stars :',
                                      subTitle: value.movieData?[index].stars
                                              .join()
                                              .toString() ??
                                          ""),
                                  Text(
                                    "Min| ${value.movieData![index].language}|Apr",
                                  ),
                                  Text(
                                    " ${value.movieData![index].pageViews.toString()} views| Voted 1 people",
                                    style: gFontsSans(cl: Colors.blue, sz: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: size.width / 1.1,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Watch Trailer")))
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
