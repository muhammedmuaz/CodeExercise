import 'dart:convert';

import 'package:duckgo/Model/varient1.dart';
import 'package:get/get.dart';

import '../network/Api.dart';

class HomeController extends GetxController {

  
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchlist();
  }
  RxList varient1list = [].obs;
  Future<void> fetchlist() async {
     var response = await Api().get("format=json");
     if (response.data != null) {
      final json = jsonDecode(response.data);
       final relatedtopics = json["RelatedTopics"];
       
       for (var i = 0; i < relatedtopics.length; i++) {
         varient1list.add(Varient1(FirstURL: relatedtopics[i]['FirstURL'], 
         Icon: relatedtopics[i]['Icon'], 
         Result: relatedtopics[i]['Result'], Text: relatedtopics[i]['Text']));
       }
       print("All doing well");
       print("////////////////////////////////////////////////////////");

     }
  }
  RxBool showDescription = false.obs;
  RxString currentnetworkimg = ''.obs;
  RxString currentitemTitle = ''.obs;
  RxString itemDescriptioncurrent = ''.obs;

}