import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';
import '../../utils/constants.dart';
import '../../utils/loading.dart';
import 'search_page_controller.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  SearchPageViewState createState() => SearchPageViewState();
}

class SearchPageViewState extends State<SearchPageView> {
  final SearchPageController controller = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cCreamColor,
        appBar: AppBar(
          backgroundColor: cDarkGreenColor,
          title: const Text('Cari Data'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Data Stunting",
                style: GoogleFonts.poppins(
                  color: cDarkGreenColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: clightgrey,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 60.0,
                child: TextField(
                  controller: controller.searchController,
                  onSubmitted: (value) {
                    setState(() {
                      controller.updateSearchQuery(value);
                    });
                  },
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 14.0),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    prefixIconColor: Colors.grey[700],
                    hintText: 'Cari data',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.streamData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var listData = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        String namaAnak = (listData[index].data()
                            as Map<String, dynamic>)["namaAnak"];
                        RxList<String> words = namaAnak.split(' ').obs;
                        String firstWord = words.isNotEmpty ? words[0] : "";
                        if (controller.searchQuery.isEmpty) {
                          return Container();
                        } else if (namaAnak
                            .toString()
                            .toLowerCase()
                            .contains(controller.searchQuery.toLowerCase())) {
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              onTap: () {
                                Get.toNamed(
                                  Routes.EDIT_DATA,
                                  arguments: listData[index].id,
                                );
                              },
                              title: Text(
                                "${(listData[index].data() as Map<String, dynamic>)["namaAnak"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                "${(listData[index].data() as Map<String, dynamic>)["nik"]}",
                              ),
                              leading: CircleAvatar(
                                backgroundColor: cDarkGreenColor,
                                child: Text(
                                  firstWord.isNotEmpty
                                      ? firstWord[0].toUpperCase()
                                      : "",
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  }
                  return const Loading();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
