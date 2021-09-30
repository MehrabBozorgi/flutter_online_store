import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/appData.dart';
import 'package:flutter_shop_practice/screen/main_screen.dart';
import 'package:flutter_shop_practice/widget/kConst.dart';
import 'package:flutter_shop_practice/widget/spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class AddAdsScreen extends StatefulWidget {
  @override
  _AddAdsScreenState createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {
  final _key = GlobalKey<FormState>();

  String _title = '';

  int _size = 0;

  String _kid_age = '';

  String _description = '';

  int _befor_price = 0;

  int _after_price = 0;

  String _year = '';

  List<Asset> imageList = [];

  Future<void> loadAssets() async {
    List<Asset> resultList = [];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 2,
        enableCamera: true,
        selectedAssets: imageList,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print('ssss');
    }

    if (!mounted) return;

    setState(() {
      imageList = resultList;
    });
  }

  XFile? _getCoverImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final XFile? imageGallery =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _getCoverImage = imageGallery;
    });
  }

  Future<void> getImageFromCamera() async {
    final XFile? imageCamera =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _getCoverImage = imageCamera;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ثبت بازی',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontFamily: 'light',
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: 10),
                TitleContainer(text: 'اضافه کردن عکس'),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFBDBDBD), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              color: Colors.transparent,
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.camera,
                                        size: 50,
                                      ),
                                      onPressed: () {
                                        getImageFromCamera();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(width: 15),
                                    IconButton(
                                      icon: Icon(
                                        Icons.image_outlined,
                                        size: 50,
                                      ),
                                      onPressed: () {
                                        getImageFromGallery();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: _getCoverImage == null
                            ? Column(
                                children: [
                                  Image.asset(
                                    'camera.png',
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.contain,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text('عکس اصلی')
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_getCoverImage!.path),
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: loadAssets,
                        child: imageList.isEmpty
                            ? Column(
                                children: [
                                  Image.asset(
                                    'camera.png',
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.contain,
                                  ),
                                  Text(''),
                                ],
                              )
                            : Container(
                                width: 145,
                                height: 75,
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  children: List.generate(
                                    imageList.length,
                                    (index) {
                                      Asset asset = imageList[index];
                                      return Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: AssetThumb(
                                            spinner: SpinKitWidget(),
                                            asset: asset,
                                            width: 75,
                                            height: 75,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                TitleContainer(text: 'عنوان بازی'),
                titleTextFormWidget(context),
                //
                TitleContainer(text: 'حجم بازی'),
                sizeTextFormWidget(context),
                //
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: yearDropButtonWidget(context),
                      ),
                    ),
                    //
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: ageDropButtonWidget(context),
                      ),
                    ),
                  ],
                ),
                //
                TitleContainer(text: 'توضیحات'),
                descriptionTextFormWidget(context),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: beforTextFormWidget(),
                      ),
                    ),
                    //
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: afterTextFormWidget(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //
                // دکمه ثبت محصول
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: Theme.of(context).primaryColor,
                    elevation: 10,
                  ),
                  child: Text(
                    'ثبت محصول',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'light',
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      //میفرسته سمت سرور
                      http.post(
                        Uri.parse(AppData.url + 'add_game.php'),
                        body: {
                          'id': '14',
                          'title': _title,
                          'image': _getCoverImage!.path.split('/').last,
                          'after_price': _after_price.toString(),
                          'befor_price': _befor_price.toString(),
                          'description': _description,
                          'year': _year,
                          'kid_age': _kid_age,
                          'size': _size.toString(),
                          'tedad': '1',
                        },
                      );

                      _key.currentState!.reset();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField afterTextFormWidget() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'قیمت با تخفیف',
        hintStyle: hintStyleAddAds,
        errorStyle: errorStyleAddAds,
        errorBorder: errorBorderAddAds,
        border: styleBorderAddAds,
        filled: true,
      ),
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return 'عنوان خالی است';
        }

        if (value.length <= 4) {
          return 'کارکتر استفاده شده مجاز نیست';
        }
      },
      onSaved: (String? value) {
        _after_price = int.parse(value!);
      },
    );
  }

  TextFormField beforTextFormWidget() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'قیمت اولیه',
        hintStyle: hintStyleAddAds,
        errorStyle: errorStyleAddAds,
        errorBorder: errorBorderAddAds,
        border: styleBorderAddAds,
        filled: true,
      ),
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return 'عنوان خالی است';
        }

        if (value.length <= 4) {
          return 'کارکتر استفاده شده مجاز نیست';
        }
      },
      onSaved: (String? value) {
        _befor_price = int.parse(value!);
      },
    );
  }

  Padding descriptionTextFormWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        minLines: 3,
        maxLines: 8,
        keyboardType: TextInputType.text,
        maxLength: 600,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          filled: true,
          errorBorder: errorBorderAddAds,
          border: styleBorderAddAds,
          counterText: '',
          hintText: 'بازی در مورد وقایع ....',
          hintStyle: hintStyleAddAds,
          errorStyle: errorStyleAddAds,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'عنوان خالی است';
          }

          if (value.length <= 10) {
            return 'کارکتر استفاده شده مجاز نیست';
          }
        },
        onSaved: (value) {
          _description = value!;
        },
      ),
    );
  }

  DropdownButtonFormField<String> ageDropButtonWidget(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        errorBorder: errorBorderAddAds,
        border: styleBorderAddAds,
        filled: true,
        errorStyle: errorStyleAddAds,
      ),
      icon: Icon(Icons.arrow_drop_down),
      hint: Text(
        'رده بندی سنی',
        style: hintStyleAddAds,
      ),
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      items: <String>['9 +', '12 +', '15 +', '18 +'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      style: TextStyle(color: Colors.black),
      elevation: 10,
      validator: (value) => value == null ? 'فیلد خالی است' : null,
      onChanged: (String? value) {
        _kid_age = value!;
      },
    );
  }

  DropdownButtonFormField<String> yearDropButtonWidget(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        errorBorder: errorBorderAddAds,
        border: styleBorderAddAds,
        filled: true,
        errorStyle: errorStyleAddAds,
      ),
      icon: Icon(Icons.arrow_drop_down),
      hint: Text(
        'سال ساخت',
        style: hintStyleAddAds,
      ),
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      items: <String>[
        '2020',
        '2021',
        '2019',
        '2018',
        '2017',
        '2016',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      style: TextStyle(color: Colors.black),
      elevation: 10,
      validator: (value) => value == null ? 'فیلد خالی است' : null,
      onChanged: (String? value) {
        _year = value!;
      },
    );
  }

  Padding sizeTextFormWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 11,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          filled: true,
          errorBorder: errorBorderAddAds,
          border: styleBorderAddAds,
          counterText: '',
          hintText: '55 گیگابایت',
          hintStyle: hintStyleAddAds,
          errorStyle: errorStyleAddAds,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'عنوان خالی است';
          }

          if (value.length <= 1) {
            return 'کارکتر استفاده شده مجاز نیست';
          }
        },
        onSaved: (value) {
          _size = int.parse(value!);
        },
      ),
    );
  }

  Padding titleTextFormWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        maxLength: 35,
        keyboardType: TextInputType.name,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          errorBorder: errorBorderAddAds,
          border: styleBorderAddAds,
          filled: true,
          counterText: '',
          hintText: 'فیفا 2021',
          hintStyle: hintStyleAddAds,
          errorStyle: errorStyleAddAds,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'عنوان خالی است';
          }

          if (value.length <= 3) {
            return 'کارکتر استفاده شده مجاز نیست';
          }
        },
        onSaved: (value) {
          _title = value!;
        },
      ),
    );
  }
}

class TitleContainer extends StatelessWidget {
  final String text;

  const TitleContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 5, top: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
