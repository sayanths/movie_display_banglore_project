

import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/view_model/home_page.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeProvider>().fetchDatas();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).backgroundColor,
        title: InkWell(
          onTap: (){
           // context.read<UserProvider>().accountInfo(context);
          },
          child: Text("null")),
        actions: [
          ElevatedButton(onPressed: (){
            context.read<HomeProvider>().companyinfo(context);
          }, child: const Text("company info"))
        ]
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.movieData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: value.movieData?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 30,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(),
                                    child: Image.network(
                                        value.movieData![index].poster,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          value.movieData![index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "genere :  ${value.movieData?[index].genre ?? ""}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "language :  ${value.movieData?[index].language ?? ""}"
                                              ..split('.')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Stars :  ${value.movieData?[index].stars.join().toString() ?? ""}",
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          const Icon(
                                              Icons.arrow_drop_up_outlined,
                                              size: 60),
                                          Text(value
                                                  .movieData?[index].totalVoted
                                                  .toString() ??
                                              "0"),
                                          const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: 60,
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        "views : ${value.movieData?[index].pageViews.toString() ?? ""}"),
                                    SizedBox(
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
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
