
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:my_design/Helper/color_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'edit_image_screen.dart';
import 'model/text_model.dart';
import '../../utils/utils.dart';
import '../../widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  List<TextInfo> texts = [];
  int currentIndex = 0;

  @override
  initailState(){
    selectedValue = 'black';
    selectedFontValue='Open_Sans';
  }

// create some values
  Color pickerColor = ColorManager.primaryColor;
  Color currentColor = ColorManager.primaryColor;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
   showColorPicker(){
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
             // setState(() => currentColor = pickerColor);
              setState(() {
                texts[currentIndex].color = pickerColor;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  saveToGallery(BuildContext context) {
      screenshotController.capture().then((Uint8List? image) {
        saveImage(image!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حفظ الصورة',textDirection: TextDirection.rtl,),
          ),
        );
      }).catchError((err) => print(err));
    }


  Future shareImage(BuildContext context) async{
      final imageFile = await screenshotController.capture();
      shareImagetoApp(imageFile!);
  }

  Future shareImagetoApp(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]);
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = "screenshot_$time";
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم الحذف',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم التحديد',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }


  List<DropdownMenuItem> get dropdownFontItems{
    List<DropdownMenuItem> menuItems = [
      const DropdownMenuItem( value: "high-summit", child:Text('Summit',style: TextStyle(fontSize: 15,fontFamily :'high-summit'),)),
      const DropdownMenuItem( value: "Playfair_Display", child:Text('Playfair',style: TextStyle(fontSize: 15,fontFamily : 'Playfair_Display'),)),
      const DropdownMenuItem( value: "Open_Sans", child:Text('Sans',style: TextStyle(fontSize: 15,fontFamily : 'Open_Sans'),)),
      const DropdownMenuItem( value: "NotoSansArabic-Regular", child:Text('نوتوسان',style: TextStyle(fontSize: 15,fontFamily : 'NotoSansArabic-Regular'),)),
      const DropdownMenuItem( value: "alfont_Regular", child:Text('خط الفونت',style: TextStyle(fontSize: 15,fontFamily : 'alfont_Regular'),)),
      const DropdownMenuItem( value: "Cairo-Regular", child:Text('كايرو',style: TextStyle(fontSize: 15,fontFamily : 'Cairo-Regular'),)),
    ];
    return menuItems;
  }
  String selectedFontValue = "Open_Sans";

  Widget dropdownFontButton(){
    return DropdownButton(
        underline: Container(),
        value: selectedFontValue,items: dropdownFontItems, onChanged: (value){
      setState((){
        switch(value){
          case 'high-summit':
            texts[currentIndex].fontFamily = 'high-summit';
            break;
          case 'Playfair_Display':
            texts[currentIndex].fontFamily = 'Playfair_Display';
            break;
          case 'Open_Sans':
            texts[currentIndex].fontFamily = 'Open_Sans';
            break;
          case 'NotoSansArabic-Regular':
            texts[currentIndex].fontFamily = 'NotoSansArabic-Regular';
            break;
          case 'alfont_Regular':
            texts[currentIndex].fontFamily = 'alfont_Regular';
            break;
          case 'Cairo-Regular':
            texts[currentIndex].fontFamily = 'Cairo-Regular';
            break;


        }
        selectedFontValue = value;

      });
    });
  }


  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  addNewText(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hieght = size.height;
    var width = size.width;

    setState(() {
      if (kDebugMode) {
        print('texts add');
      }
      texts.add(
        TextInfo(
          text: textEditingController.text,
          left: width/2,
          top: widget.Scale == 1 ?hieght/4:hieght/2,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          textAlign: TextAlign.left,
          fontFamily: 'Open_Sans',

        ),
      );
      Navigator.of(context).pop();
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'أضف اسمك',
            style: TextStyle(
              fontSize: 18
            ),
          ),
          content: TextField(
            controller: textEditingController,
            maxLines: 2,
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.edit,
              ),
              filled: true,
              hintText: 'Your Text Here..',
            ),
          ),
          actions: <Widget>[
            DefaultButton(
              onPressed: () => addNewText(context),
              color: ColorManager.primaryColor,
              textColor: Colors.white,
              child: const Text('تم'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black38,
                textColor: Colors.black,
                child: const Text('إغلاق'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String selectedValue = "black";

}

