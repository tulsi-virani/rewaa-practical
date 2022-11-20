import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Constants/custom_colors.dart';
import '../screens/edit_screen.dart';
import '../utils/database.dart';

class ItemList extends StatefulWidget {
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CustomColors.blackColor,
          leadingWidth: 0,
          leading: const SizedBox(),
          title: TextField(
            style: TextStyle(color: CustomColors.whiteColor),
            cursorColor: CustomColors.whiteColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: CustomColors.whiteColor),
                hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: Database.readItems(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return snapshot.data!.docs.isEmpty
                  ? const Center(
                      child: Text('Tap Plus Button and create a note!'))
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        dynamic noteInfo = snapshot.data!.docs[index].data()!;
                        String docID = snapshot.data!.docs[index].id;
                        String title = noteInfo['title'];
                        String description = noteInfo['description'];
                        var data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        return name.isEmpty
                            ? Column(
                                children: [
                                  Ink(
                                    decoration: BoxDecoration(
                                      color: CustomColors.greyColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          title: Text(
                                            data['title'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Text(
                                            data['description'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditScreen(
                                                        currentTitle: title,
                                                        currentDescription:
                                                            description,
                                                        documentId: docID,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                icon: const Icon(Icons.edit)),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      content: const Text(
                                                          "Are you sure want to delete??"),
                                                      actions: <Widget>[
                                                        MaterialButton(
                                                          child:
                                                              const Text("No"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        MaterialButton(
                                                          child:
                                                              const Text("Yes"),
                                                          onPressed: () async {
                                                            Database.deleteItem(
                                                              docId: docID,
                                                            );
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20)
                                ],
                              )
                            : data['title']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(name.toLowerCase())
                                ? Column(
                                    children: [
                                      Ink(
                                        decoration: BoxDecoration(
                                          color: CustomColors.greyColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              title: Text(
                                                data['title'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              subtitle: Text(
                                                data['description'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditScreen(
                                                            currentTitle: title,
                                                            currentDescription:
                                                                description,
                                                            documentId: docID,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    icon:
                                                        const Icon(Icons.edit)),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: const Text(
                                                              "Are you sure want to delete??"),
                                                          actions: <Widget>[
                                                            MaterialButton(
                                                              child: const Text(
                                                                  "No"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            MaterialButton(
                                                              child: const Text(
                                                                  "Yes"),
                                                              onPressed:
                                                                  () async {
                                                                Database
                                                                    .deleteItem(
                                                                  docId: docID,
                                                                );
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20)
                                    ],
                                  )
                                : const SizedBox();
                      },
                    );
            }
            return Center(
              child: CircularProgressIndicator(
                color: CustomColors.blackColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
