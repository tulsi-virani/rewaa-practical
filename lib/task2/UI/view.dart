import 'package:flutter/material.dart';
import 'package:practicaldemo/task1/Constants/custom_colors.dart';
import 'package:practicaldemo/task1/screens/login_screen.dart';

import '../Bloc/bloc.dart';
import '../Model/news_model.dart';
import 'news_details.dart';

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    newsBloc.fetchLondonNews();
    return StreamBuilder(
        stream: newsBloc.news,
        builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
          if (snapshot.hasData) {
            return _buildNewsScreen(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
              child: CircularProgressIndicator(
            color: CustomColors.whiteColor,
          ));
        });
  }

  Scaffold _buildNewsScreen(NewsResponse data) {
    return Scaffold(
        backgroundColor: CustomColors.whiteColor,
        appBar: AppBar(
          leadingWidth: 80,
          elevation: 0,
          foregroundColor: CustomColors.blackColor,
          backgroundColor: CustomColors.whiteColor,
        ),
        drawer: Drawer(
          elevation: 0,
          backgroundColor: CustomColors.whiteColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: CustomColors.whiteColor,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 100,
                    ),
                    Text(
                      'Daily News',
                      style: TextStyle(
                          color: CustomColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.document_scanner,
                ),
                title: const Text('task 1'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsScreen(),
                  ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.document_scanner_sharp,
                ),
                title: const Text('task 2'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daily News",
                  style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    data.articles!.isNotEmpty ? data.articles!.length : 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: Container(
                                height: 525,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: CustomColors.lightgreyColor,
                                        blurRadius: 40.0,
                                      ),
                                    ],
                                    color: CustomColors.lightgreyColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 515,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: CustomColors.greyColor,
                                        blurRadius: 40.0,
                                      ),
                                    ],
                                    color: CustomColors.greyColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                              ),
                            ),
                            Container(
                              height: 500,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.greyColor,
                                      blurRadius: 40.0,
                                    ),
                                  ],
                                  color: CustomColors.whiteColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 400,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              topLeft: Radius.circular(30)),
                                          child: data.articles![index]
                                                      .urlToImage ==
                                                  null
                                              ? Image.asset(
                                                  'assets/noImage.png')
                                              : Image.network(
                                                  data.articles![index]
                                                      .urlToImage!,
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              right: 10, left: 5),
                                          decoration: BoxDecoration(
                                              color: CustomColors.blackColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(30),
                                                      bottomRight:
                                                          Radius.circular(30))),
                                          child: Text(
                                            data.articles![index].author ??
                                                'Author',
                                            style: TextStyle(
                                                color: CustomColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5, right: 5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: CustomColors.greyColor,
                                              blurRadius: 40.0,
                                            ),
                                          ],
                                          color: CustomColors.whiteColor,
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(30),
                                              bottomLeft: Radius.circular(30))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.articles![index].title!,
                                            style: TextStyle(
                                                color: CustomColors.blackColor),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsDetails(
                                                  index: index,
                                                  data: data,
                                                ),
                                              ));
                                            },
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color:
                                                        CustomColors.blackColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                                child: Text(
                                                  'Tap For More',
                                                  style: TextStyle(
                                                      color: CustomColors
                                                          .whiteColor),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
