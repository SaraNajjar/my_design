
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:my_design/module/Design/design_screen.dart';
import 'package:my_design/module/Design/designx_controller.dart';
import 'package:my_design/module/sub_category/sub_category_controller.dart';

class SubCategoryScreen extends StatelessWidget {
  final int id;
  final String name;
  final controller = Get.put(SubCategoriesxController());
  final designcontroller = Get.put(DesignxController());

   SubCategoryScreen({Key? key, required this.id,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(name,style: const TextStyle(color: Colors.white,fontFamily: 'NotoSansArabic-Regular'),),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,))
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:GetBuilder<SubCategoriesxController>(
              builder: (controller)=>SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('انشئ تصميمك الان :',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansArabic-Regular'

                  ),),
                  SizedBox(
                      child:controller.isLoadingRequest ?
                        _buildLoading():
                      _buildMainBody(id)
                    // children.isEmpty
                    // ? _buildLoading()
                    // : _buildMainBody()
                  )
                ],
              ),
            ),
          ),)
        ),
      ),
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

   Widget _buildMainBody(int id) {

     return  RefreshIndicator(
       onRefresh: () {
         return controller.getSubCategories(id);
       },
       child: controller.listSubCategories.isEmpty ?Center(
         child: Text(
           "لم يتم الاضافة بعد",
           style: TextStyle(
               fontFamily: 'NotoSansArabic-Regular',
               fontSize: 18,color: Colors.grey[400]),
         ),
       ):GridView.count(
              physics: const BouncingScrollPhysics(),
             crossAxisCount: 3,
             mainAxisSpacing: 10,
             childAspectRatio: 100.w / 150.h,
             shrinkWrap: true,
             crossAxisSpacing: 10,
             padding: const EdgeInsetsDirectional.all(10),
             children: List.generate(controller.listSubCategories.length, (index) {
               return InkWell(
                 onTap: () {
                   designcontroller.getDesign(id: controller.listSubCategories[index].id!);
                   Get.to(()=>DesignScreen(id: controller.listSubCategories[index].id!,name: controller.listSubCategories[index].name!,));
                   // Get.defaultDialog(
                   //     title: "اختر حجم الصورة",
                   //     content: Center(
                   //       child: Row(
                   //         mainAxisAlignment: MainAxisAlignment.center,
                   //         children: [
                   //           GestureDetector(
                   //             onTap: (){
                   //               Get.off(DesignScreen(
                   //                 id: children[index].id,
                   //                 num: 1,));
                   //             },
                   //             child: Container(
                   //               width: 100,
                   //               height: 100,
                   //               clipBehavior: Clip.antiAliasWithSaveLayer,
                   //               decoration: BoxDecoration(
                   //                   color: Colors.deepPurple,
                   //                   borderRadius: BorderRadius.circular(12)
                   //               ),
                   //               child: Center(child: Text('1080\n    * \n1080',style: TextStyle(color: Colors.white))),
                   //             ),
                   //           ),
                   //           SizedBox(width: 15,),
                   //           GestureDetector(
                   //             onTap: (){
                   //
                   //               Get.off(DesignScreen(
                   //                 id: children[index].id,
                   //                 num: 2,));
                   //             },
                   //             child: Container(
                   //               width: 100,
                   //               height: 100,
                   //               clipBehavior: Clip.antiAliasWithSaveLayer,
                   //               decoration: BoxDecoration(
                   //                   color: Colors.deepPurple,
                   //                   borderRadius: BorderRadius.circular(12)
                   //               ),
                   //               child: Center(child: Text('1920\n    * \n1080',style: TextStyle(color: Colors.white))),
                   //             ),
                   //           ),
                   //         ],
                   //       ),
                   //     ),
                   //     backgroundColor: Colors.white,
                   //     titleStyle: TextStyle(color: Colors.black),
                   //     middleTextStyle: TextStyle(color: Colors.white),
                   //     radius: 30,
                   //
                   // );
                   //Get.to(DesignScreen( id: categoriesController.listCategories[index].id));
                   //Get.to(DesignScreen(id:designController.listDesign[index].categoryId));
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
                           child: Image.network(controller.listSubCategories[index].image!),
                         ),
                         const SizedBox(height: 10,),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             horizontal: 2
                           ),
                           child: Text(controller.listSubCategories[index].name!,style: const TextStyle(
                               color: Colors.white,
                               fontSize: 12,
                               fontFamily: 'NotoSansArabic-Regular'
                           ),),
                         )
                       ],
                     ),
                   ),
                 ),
               );
             },
             )),
     );
   }
}
