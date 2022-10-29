import 'package:flutter/material.dart';
import 'package:movie_project_banglore/app/home_page/view/widgets/custom_home_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            LimitedBox(
              maxHeight: size.height,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomContainerUi(size: size);
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 10,
                      ),
                    );
                  },
                  itemCount: 10),
            )
          ]),
        ),
      ),
    );
  }
}
