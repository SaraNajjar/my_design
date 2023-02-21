import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_image_viewmodel.dart';
import 'model/image_text.dart';

class EditImageScreen extends StatefulWidget {
  EditImageScreen({Key? key, required this.selectedImage,required this.Scale,required this.has_image})
      : super(key: key);

  final String selectedImage;
  final int Scale;
  final int has_image;
  String? pickedImage;
  int? width;
  int? height;
  bool removeContainer = false;
  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hieght1 = size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: _appBar,
        body: Screenshot(
          controller: screenshotController,
          child: Center(
            child: Stack(
              children: [
                if(widget.pickedImage!=null)
                  SizedBox(
                    height: widget.Scale == 1 ? hieght1 / 2 : hieght1,
                    width: double.infinity,
                    child: InteractiveViewer(
                        minScale: 0.8,
                        maxScale: 2,
                        child: SizedBox(
                          height: widget.Scale == 1 ? hieght1 / 2 : hieght1,
                          width: double.infinity,
                          child: Image.file(File(widget.pickedImage!)),
                        )),
                  ),
                IgnorePointer(
                    child: Image(
                        width: double.infinity,
                        height: widget.Scale==1 ?hieght1 /2 : hieght1,
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.selectedImage,)
                    )
                  // .image.resolve(ImageConfiguration()).addListener(
                  //     (ImageInfo info,bool _)
                  // {
                  //    widget.width = info.image.width;
                  //    widget.height = info.image.height;
                  // } as ImageStreamListener),
                ),
                for (int i = 0; i < texts.length; i++)
                  Positioned(
                    left: texts[i].left,
                    top: texts[i].top,
                    child: GestureDetector(
                      onLongPress: () {
                        setState(() {
                          currentIndex = i;
                          removeText(context);
                        });
                      },
                      onTap: () => setCurrentIndex(context, i),
                      child: Draggable(
                        feedback: ImageText(textInfo: texts[i]),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageText(textInfo: texts[i]),
                        )),
                        onDragEnd: (drag) {
                          final renderBox =
                          context.findRenderObject() as RenderBox;
                          Offset off = renderBox.globalToLocal(drag.offset);
                          setState(() {
                            texts[i].top = widget.Scale==1 ? off.dy - (hieght1/2-192): off.dy - 96;
                            texts[i].left = off.dx;
                          });
                        },
                      ),
                    ),
                  ),
                /******************************************************/
                creatorText.text.isNotEmpty
                    ? Positioned(
                  left: 0,
                  bottom: 0,
                  child: Text(
                    creatorText.text,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(
                          0.3,
                        )),
                  ),
                )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 30.w,),
            _addnewTextFab,
            widget.has_image ==0?Container():
            Row(
              children: [
                SizedBox(width: 10.w,),
                _addnewImageFab,
                SizedBox(width: 10.w,),
                _addnewImageFromCameraFab,
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget get _addnewTextFab => FloatingActionButton(
    heroTag: 'Text',
    onPressed: () => addNewDialog(context),
    backgroundColor : Colors.white,
    tooltip: 'Add New Text',
    child: const Icon(
      Icons.edit,
      color: Colors.black,
    ),
  );

  Widget get _addnewImageFab => FloatingActionButton(
    heroTag: 'Image',
    onPressed: ()=>pickImage(ImageSource.gallery),
    backgroundColor: Colors.white,
    tooltip: 'Add New Text',
    child: const Icon(
      Icons.photo,
      color: Colors.black,
    ),
  );
  Widget get _addnewImageFromCameraFab => FloatingActionButton(
    heroTag: 'Camera',
    onPressed: ()=>pickImage(ImageSource.camera),
    backgroundColor: Colors.white,
    tooltip: 'Add New Text',
    child: const Icon(
      Icons.camera_alt,
      color: Colors.black,
    ),
  );

  AppBar get _appBar => AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ),
              onPressed: () => shareImage(context),
              tooltip: 'Share Image',
            ),
            IconButton(
              icon: const Icon(
                Icons.save,
                color: Colors.black,
              ),
              onPressed: () => saveToGallery(context),
              tooltip: 'Save Image',
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: increaseFontSize,
              tooltip: 'Increase font size',
            ),
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
              onPressed: decreaseFontSize,
              tooltip: 'Decrease font size',
            ),
            dropdownFontButton(),
            IconButton(
              icon: const Icon(
                Icons.format_bold,
                color: Colors.black,
              ),
              onPressed: boldText,
              tooltip: 'Bold',
            ),
            IconButton(
              icon: const Icon(
                Icons.format_italic,
                color: Colors.black,
              ),
              onPressed: italicText,
              tooltip: 'Italic',
            ),
            InkWell(
                onTap: (){
                  showColorPicker();
                },
                child: const Icon(Icons.color_lens,color: Colors.black,)),
          ],
        ),
      ));

  Future pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source:source,);
    if (image!=null) {
      setState(() {
        widget.pickedImage=image.path;
      });
    }

  }

}







// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:image_picker/image_picker.dart';
// import 'edit_image_viewmodel.dart';
// import '../../widgets/image_text.dart';
//
// class EditImageScreen extends StatefulWidget {
//    EditImageScreen({Key? key, required this.selectedImage,required this.Scale,required this.has_image})
//       : super(key: key);
//
//   final String selectedImage;
//   final int Scale;
//   final int has_image;
//   String? pickedImage;
//   int? width;
//   int? height;
//    bool removeContainer = false;
//   @override
//   _EditImageScreenState createState() => _EditImageScreenState();
// }
//
// class _EditImageScreenState extends EditImageViewModel {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var hieght1 = size.height;
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: _appBar,
//         body: Screenshot(
//           controller: screenshotController,
//           child: Center(
//             child: Stack(
//               children: [
//                 if(widget.pickedImage!=null)
//                 SizedBox(
//                   height: widget.Scale == 1 ? hieght1 / 2 : hieght1,
//                   width: double.infinity,
//                   child: InteractiveViewer(
//                     minScale: 0.8,
//                       maxScale: 2,
//                       child: SizedBox(
//                       height: widget.Scale == 1 ? hieght1 / 2 : hieght1,
//                       width: double.infinity,
//                       child: Image.file(File(widget.pickedImage!)),
//                     )),
//                 ),
//                 IgnorePointer(
//                   child: Image(
//                       width: double.infinity,
//                       height: widget.Scale==1 ?hieght1 /2 : hieght1,
//                       fit: BoxFit.cover,
//                       image: NetworkImage(widget.selectedImage,)
//                   )
//                       // .image.resolve(ImageConfiguration()).addListener(
//                       //     (ImageInfo info,bool _)
//                       // {
//                       //    widget.width = info.image.width;
//                       //    widget.height = info.image.height;
//                       // } as ImageStreamListener),
//                 ),
//                 for (int i = 0; i < texts.length; i++)
//                   Positioned(
//                     left: texts[i].left,
//                     top: texts[i].top,
//                     child: GestureDetector(
//                       onLongPress: () {
//                         setState(() {
//                           currentIndex = i;
//                           removeText(context);
//                         });
//                       },
//                       onTap: () => setCurrentIndex(context, i),
//                       child: Draggable(
//                         feedback: ImageText(textInfo: texts[i]),
//                         child: Center(child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ImageText(textInfo: texts[i]),
//                         )),
//                         onDragEnd: (drag) {
//                           final renderBox =
//                           context.findRenderObject() as RenderBox;
//                           Offset off = renderBox.globalToLocal(drag.offset);
//                           setState(() {
//                             texts[i].top = widget.Scale==1 ? off.dy - (hieght1/2-192): off.dy - 96;
//                             texts[i].left = off.dx;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 /******************************************************/
//                 creatorText.text.isNotEmpty
//                     ? Positioned(
//                   left: 0,
//                   bottom: 0,
//                   child: Text(
//                     creatorText.text,
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black.withOpacity(
//                           0.3,
//                         )),
//                   ),
//                 )
//                     : const SizedBox.shrink(),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             SizedBox(width: 30.w,),
//             _addnewTextFab,
//             widget.has_image ==0?Container():
//             Row(
//               children: [
//                 SizedBox(width: 10.w,),
//                 _addnewImageFab,
//                 SizedBox(width: 10.w,),
//                 _addnewImageFromCameraFab,
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget get _addnewTextFab => FloatingActionButton(
//     heroTag: 'Text',
//     onPressed: () => addNewDialog(context),
//        backgroundColor : Colors.white,
//     tooltip: 'Add New Text',
//     child: const Icon(
//       Icons.edit,
//       color: Colors.black,
//     ),
//   );
//
// Widget get _addnewImageFab => FloatingActionButton(
//     heroTag: 'Image',
//     onPressed: ()=>pickImage(ImageSource.gallery),
//     backgroundColor: Colors.white,
//     tooltip: 'Add New Text',
//     child: const Icon(
//       Icons.photo,
//       color: Colors.black,
//     ),
//   );
// Widget get _addnewImageFromCameraFab => FloatingActionButton(
//     heroTag: 'Camera',
//     onPressed: ()=>pickImage(ImageSource.camera),
//     backgroundColor: Colors.white,
//     tooltip: 'Add New Text',
//     child: const Icon(
//       Icons.camera_alt,
//       color: Colors.black,
//     ),
//   );
//
//   AppBar get _appBar => AppBar(
//       backgroundColor: Colors.white,
//       automaticallyImplyLeading: false,
//       title: SizedBox(
//         height: 50,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: [
//             IconButton(
//               icon: const Icon(
//                 Icons.share,
//                 color: Colors.black,
//               ),
//               onPressed: () => shareImage(context),
//               tooltip: 'Share Image',
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.save,
//                 color: Colors.black,
//               ),
//               onPressed: () => saveToGallery(context),
//               tooltip: 'Save Image',
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.add,
//                 color: Colors.black,
//               ),
//               onPressed: increaseFontSize,
//               tooltip: 'Increase font size',
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.remove,
//                 color: Colors.black,
//               ),
//               onPressed: decreaseFontSize,
//               tooltip: 'Decrease font size',
//             ),
//             dropdownFontButton(),
//             IconButton(
//               icon: const Icon(
//                 Icons.format_bold,
//                 color: Colors.black,
//               ),
//               onPressed: boldText,
//               tooltip: 'Bold',
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.format_italic,
//                 color: Colors.black,
//               ),
//               onPressed: italicText,
//               tooltip: 'Italic',
//             ),
//             InkWell(
//                 onTap: (){
//                   showColorPicker();
//                 },
//                 child: const Icon(Icons.color_lens,color: Colors.black,)),
//             ],
//         ),
//       ));
//
//   Future pickImage(ImageSource source) async {
//     XFile? image = await ImagePicker().pickImage(source:source,);
//     if (image!=null) {
//       setState(() {
//         widget.pickedImage=image.path;
//       });
//     }
//
//   }
//
// }
//
//
//
//
