import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/module/Design/designx_controller.dart';
import 'package:my_design/module/edit_image/edit_image_screen.dart';

class DesignScreen extends StatelessWidget {
  final controller = Get.put(DesignxController());
  final int id;
  final String name;
   DesignScreen({Key? key,required this.id,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignxController>(builder: (controller)=>DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(name,style: TextStyle(
              color: ColorManager.white,
              fontFamily: 'NotoSansArabic-Regular'
            ),),
            backgroundColor: ColorManager.primaryColor,
            automaticallyImplyLeading: false,
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios),onPressed: (){Get.back();},),
          ),
          body: SafeArea(
            child: Column(
              children: [
                TabBar(

                  indicatorColor: ColorManager.primaryColor,
                  automaticIndicatorColorAdjustment:false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  labelStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  tabs: const [
                    Tab(
                      child: Text('Post'),
                    ),
                    Tab(
                      child: Text('Story'),
                    ),
                  ],
                ),
                Expanded(child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    controller.isLoadingRequest
                        ?
                        _buildLoading()
                        :
                        _buildMain1Body(),
                    controller.isLoadingRequest
                        ?
                    _buildLoading()
                        :
                    _buildMain2Body(),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    ),);
  }
  Center _buildLoading() {
    return Center(
      child: SizedBox(
        width: 50.w,
        height: 50.h,
        child: const CircularProgressIndicator(),
      ),
    );
  }
RefreshIndicator _buildMain1Body() {
  return RefreshIndicator(
      onRefresh: () {
        return controller.getDesign(id: id);
      },
      child: controller.listDesign.isEmpty
          ? Center(
            child: Text(
        "لم يتم الاضافة بعد",
        style: TextStyle(
              fontFamily: 'NotoSansArabic-Regular',
              fontSize: 18,color: Colors.grey[400]),
      ),
          )
          : GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 100 / 120,
        shrinkWrap: true,
        crossAxisSpacing: 10,
        padding: const EdgeInsetsDirectional.all(10),
        children: List.generate(controller.listDesign.length, (index) {
          return InkWell(
              onTap: (){
                Get.to(
                    EditImageScreen(
                      selectedImage: '${controller.listDesign[index].imageOne}',
                      Scale: 1,
                    has_image:controller.listDesign[index].hasImage! ,
                    ));
              },
              child: Image.network(controller.listDesign[index].imageOne!));
        },
        ),
      ));
}
  RefreshIndicator _buildMain2Body() {
    return RefreshIndicator(
        onRefresh: () {
          return controller.getDesign(id: id);
        },
        child: controller.listDesign.isEmpty
            ? Center(
              child: Text(
          "لم يتم الاضافة بعد",
          style: TextStyle(
              fontFamily: 'NotoSansArabic-Regular',
              fontSize: 18,color: Colors.grey[400]),
        ),
            )
            : GridView.count(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 100 / 120,
          shrinkWrap: true,
          crossAxisSpacing: 10,
          padding: const EdgeInsetsDirectional.all(10),
          children: List.generate(controller.listDesign.length, (index) {
            return InkWell(
                onTap: (){
                  Get.to(EditImageScreen(
                    selectedImage:'${controller.listDesign[index].imageTwo}',
                    Scale: 2,
                      has_image:controller.listDesign[index].hasImage!
                  ));
                },
                child: Image.network(controller.listDesign[index].imageTwo!));
          },
          ),
        ));
  }

}
