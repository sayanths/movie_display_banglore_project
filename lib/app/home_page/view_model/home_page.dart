import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/model/home_model.dart';
import 'package:movie_project_banglore/app/home_page/model/home_model_post.dart';
import 'package:movie_project_banglore/app/home_page/servie/api_service.dart';

class HomeProvider with ChangeNotifier {
  List<Result>? movieData =[];
//==========fetch==datas=from====api===========//
  void fetchDatas() {
    final data = PostModel(
        category: "movies", language: "kannada", genre: "all", sort: "voting");
    GetApi().getmoviesDetailes(data).then((value) => {
          if (value != null) {movieData = value, notifyListeners()} else {}
        });
  }

//================alert==for==show==companyinfo============//
  companyinfo(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
            title: const Text(
              "Geeksynergy Technologies Pvt Ltd",
              style: TextStyle(color: Colors.white),
            ),
            content: SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Address : Sanjayanagar, Bengaluru-56",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Phone: XXXXXXXXX09",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Email xxxxxxx@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
          );
        });
  }
}
