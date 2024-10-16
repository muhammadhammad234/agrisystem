import 'package:agrisystem/controller/theme_controller.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/home_screen/agri_asset/add_agri_asset_screen.dart';
import 'package:agrisystem/view/home_screen/agriculteur/view_all_agriculteur.dart';
import 'package:agrisystem/view/home_screen/custom_drawer.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/agricultural_cooperatives_screen.dart';
import 'package:agrisystem/view/home_screen/farm_land/add_farm_land_details_screen.dart';
import 'package:agrisystem/view/home_screen/organization_paysane/organization_paysane_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> buttonText = [
    "Agriculteur",
    "Entreprise\nAgricole",
    "Organisation\nPaysanne",
    "Farm Land",
    "Agri Asset",
    "Replication"
  ];

  List<String> buttonIcon = [
    AppImages.agriculteur,
    AppImages.enterpriseAgrcole,
    AppImages.organizationPaysanne,
    AppImages.farmLand,
    AppImages.agriAsset,
    AppImages.replica,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: const CustomDrawer(),
        // appBar: AppBar(title: Text("Home Screen"),),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: getHeight(context) * .03,
                    left: getWidth(context) * .1,
                    right: getWidth(context) * .1),
                child: Image.asset(
                  AppImages.logo,
                  // controller.isDarkMode.value
                  //     ? AppImages.logoDarkTheme
                  //     : AppImages.logoLightTheme,
                  height: getHeight(context) * .05,
                  width: getWidth(context) * .8,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 3 buttons per row
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 6, // Total number of buttons
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewAllAgriculteurScreen()));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AgriculturalCooperativesScreen()));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrganizationPaysaneListScreen()));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddFarmDetailsScreen()));
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddAgriAssetScreen()));
                        }
                        // Define your button action here
                        debugPrint('Button ${index + 1} pressed');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              // Expanded(
                              // child:
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    buttonIcon[index],
                                    width: getWidth(context) * .35,
                                    height: getWidth(context) * .3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                buttonText[index],
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: Colors.white, fontSize: 16),

                                // .copyWith(
                                //   color: Theme.of(context).colorScheme.secondary,
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
