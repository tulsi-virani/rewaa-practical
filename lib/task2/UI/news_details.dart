import 'package:flutter/material.dart';
import 'package:practicaldemo/task1/Constants/custom_colors.dart';

import '../Model/news_model.dart';

class NewsDetails extends StatelessWidget {
  int index;
  NewsResponse data;
  NewsDetails({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  floating: true,
                  snap: false,
                  expandedHeight: 500,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  foregroundColor: CustomColors.blackColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: SizedBox(
                            height: 400,
                            child: data.articles![index].urlToImage == null
                                ? Image.asset('assets/noImage.png')
                                : Image.network(
                                    data.articles![index].urlToImage!,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.articles![index].author ?? '',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      size(),
                      Text(
                        data.articles![index].title ?? '',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      size(),
                      Text(
                        'Description:- ${data.articles![index].description ?? ' '}',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      size(),
                      Text(
                        data.articles![index].content ?? '',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ]),
              ),
            )));
  }

  Widget size() {
    return const SizedBox(
      height: 20,
    );
  }
}
