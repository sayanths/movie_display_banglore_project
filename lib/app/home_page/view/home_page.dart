import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/core/fonts.dart';
import 'package:movie_project_banglore/app/home_page/view/widgets/custom_home_container.dart';
import 'package:movie_project_banglore/app/home_page/view_model/home_page.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<HomeProvider>().fetchDatas();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).backgroundColor,
          title: InkWell(
              onTap: () {
                // context.read<UserProvider>().accountInfo(context);
              },
              child: const Text("")),
          actions: [
            ElevatedButton(
                onPressed: () {
                  context.read<HomeProvider>().companyinfo(context);
                },
                child: const Text("company info"))
          ]),
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
                                    )
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
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.movieData![index].title.toString(),
                                    style: gFontsSans(sz: 20),
                                  ),
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
                                    "min | Enflis |2 Apr",
                                    style:
                                        gFontsSans(cl: Colors.blue, sz: 13),
                                  ),
                                  const Text("min | Enflis |2 Aprssdsd"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  "views : ${value.movieData?[index].pageViews.toString() ?? ""}"),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                  value.movieData?[index].director
                                              .join()
                                              .isNotEmpty ==
                                          true
                                      ? "Director : ${value.movieData?[index].director.join().toString()}"
                                      : "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ]),
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
