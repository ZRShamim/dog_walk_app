import 'package:dog_walk_app/view/HomePage/home_widgets/filtered_option.dart';
import 'package:dog_walk_app/view/HomePage/home_widgets/job_list.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeTab = 0.obs;
    return Scaffold(
      body: NestedScrollView(

        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: white,
            leadingWidth: 40,
            leading: const Icon(
              Icons.location_on_outlined,
              color: black,
              size: 28,
            ),
            titleSpacing: 0,
            title: const Text(
              'Kastanienallee, Berlin',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_icons/filter.svg',
                      width: 25,
                    ),
                    Positioned(
                      top: 13,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(2),
                          color: black,
                          constraints:
                              const BoxConstraints(maxHeight: 15, minWidth: 15),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
        body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FilteredOption(),
                  JobList(),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pets_outlined,
              ),
              label: 'Activities',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: black,
          unselectedItemColor: offWhite,
          currentIndex: activeTab.value,
          onTap: (index) {
            activeTab.value = index;
          },
        ),
      ),
    );
  }
}




