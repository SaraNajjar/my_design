import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_design/Application/app_router/app_router.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/module/sub_category/sub_category_controller.dart';
import 'package:my_design/module/sub_category/sub_category_screen.dart';
import '../../widgets/widgets.dart';
import '../Design/designx_controller.dart';
import 'bannerx_controller.dart';
import 'categoriesx_controller.dart';

class HomeScreen extends StatelessWidget {
  final subcontroller = Get.put(SubCategoriesxController());

  HomeScreen({Key? key}) : super(key: key);

  CategoriesxController categoriesController = Get.put(CategoriesxController());
  DesignxController designController = Get.put(DesignxController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Drawer(
          child: buildListViewDrawer(),
        ),
        appBar: AppBar(
          title: const Text(
            'الصفحة الرئيسية',
            style:
                TextStyle(fontFamily: 'NotoSansArabic-Regular', fontSize: 18),
          ),
          backgroundColor: ColorManager.primaryColor,
        ),
        body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<BannerxController>(
                    builder: (controller1) => SizedBox(
                        child: controller1.isLoadingRequest
                            ? _buildLoading()
                            : Image.network(controller1.listBanner[0].image!))),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'انشئ تصميمك الان :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansArabic-Regular',
                  ),
                ),
                GetBuilder<CategoriesxController>(
                    builder: (controller) => SizedBox(
                        child: controller.isLoadingRequest
                            ? _buildLoading()
                            : _buildMainBody()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildListViewDrawer() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
          ),
          child: null,
        ),
        ListTile(
          title: Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey[100],
              child: Row(
                children: [
                  Icon(
                    Icons.people_alt_outlined,
                    color: ColorManager.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('تواصل معنا',
                      style: TextStyle(
                        fontFamily: 'NotoSansArabic-Regular',
                      )),
                ],
              )),
          onTap: () {
            Get.toNamed(Routes.contactUsRoute);
          },
        ),
        ListTile(
          title: Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey[100],
              child: Row(
                children: [
                  Icon(Icons.logout, color: ColorManager.primaryColor),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('تسجيل خروج',
                      style: TextStyle(
                        fontFamily: 'NotoSansArabic-Regular',
                      )),
                ],
              )),
          onTap: () {
            signOut();
          },
        ),
      ],
    );
  }

  Center _buildLoading() {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  RefreshIndicator _buildMainBody() {
    return RefreshIndicator(
        onRefresh: () {
          return categoriesController.getCategories();
        },
        child: categoriesController.listCategories.isEmpty
            ? const Text(
                "empty",
                style: TextStyle(fontSize: 50),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  //physics: BouncingScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 100.w / 150.h,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsetsDirectional.all(10),
                  children: List.generate(
                    categoriesController.listCategories.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          subcontroller.getSubCategories(
                              categoriesController.listCategories[index].id!);
                          Get.to(() => SubCategoryScreen(
                                id: categoriesController
                                    .listCategories[index].id!,
                                name: categoriesController
                                    .listCategories[index].name!,
                              ));
                        },
                        child: Material(
                          elevation: 1,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: ColorManager.primaryColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  child: Image.network(categoriesController
                                      .listCategories[index].image!),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    categoriesController
                                        .listCategories[index].name!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'NotoSansArabic-Regular'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ));
  }
}
