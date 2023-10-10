import 'package:cached_network_image/cached_network_image.dart';
import 'package:duckgo/Model/varient1.dart';
import 'package:duckgo/controller/homecontroller.dart';
import 'package:duckgo/views/detailPageMobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:shimmer/shimmer.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Duck Duck Go Test'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Render different content for mobile screens
            return MobileContent();
          } else {
            // Render different content for tablet screens
            return TabletContent();
          }
        },
      ),
    );
  }
}

class MobileContent extends StatelessWidget {
    HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (controller.varient1list.length > 0) {
        return SearchableList(
  initialList: controller.varient1list,
  builder: (displayedList, itemIndex, item) {
    return GestureDetector(
      onTap: (){
        Get.to(DetailPage(itemTitle: controller.varient1list[itemIndex].Text, itemDescription: controller.varient1list[itemIndex].Result, imageNetwork: "https://duckduckgo.com${controller.varient1list[itemIndex].Icon['URL']}"));
      },
      child: ListTile(
                  title: Text(
                    item.Text,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  leading: Icon(Icons.list),
                ),
    );
  },
  filter: (value) => controller.varient1list.where((element) => element.Text.toLowerCase().contains(value.toLowerCase()),).toList(),
  emptyWidget:  Container(),
  inputDecoration: InputDecoration(
  labelText: "Search Actor",
	fillColor: Colors.white,
	focusedBorder: OutlineInputBorder(
	  borderSide: const BorderSide(
	    color: Colors.blue,
		width: 1.0,
	  ),
	  borderRadius: BorderRadius.circular(10.0),
	),
));     
      } else {
        return Container();
      }
   
      }
    );
  }
}

// Column(
//               children: [
//                 CachedNetworkImage(
//           imageUrl: controller.currentnetworkimg.value,
//           imageBuilder: (context, imageProvider) => Container(
//             height: 300,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//               image: imageProvider,
//               fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           placeholder: (context, url) => CircularProgressIndicator(),
//           errorWidget: (context, url, error) => Container(
//             height: 300,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//               image:NetworkImage('https://static.vecteezy.com/system/resources/previews/008/695/917/original/no-image-available-icon-simple-two-colors-template-for-no-image-or-picture-coming-soon-and-placeholder-illustration-isolated-on-white-background-vector.jpg'),
//               fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ),
                
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         controller.currentitemTitle.value,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         controller.itemDescriptioncurrent.value,
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )


class TabletContent extends StatelessWidget {
  HomeController controller = Get.find();

   // To control the visibility of the description

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Obx(() {
        if (controller.varient1list.length > 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      
                        Expanded(
                          child: SearchableList(
                            initialList: controller.varient1list,
                            builder: (displayedList, itemIndex, item) {
                              return GestureDetector(
                                onTap: () {
                                  controller.currentnetworkimg.value = "https://duckduckgo.com${controller.varient1list[itemIndex].Icon['URL']}";
                                  controller.currentitemTitle.value = controller.varient1list[itemIndex].Text;
                                  controller.itemDescriptioncurrent.value = controller.varient1list[itemIndex].Result;
                                  controller. showDescription.value = true;
                                },
                                child: ListTile(
                                  title: Text(
                                    item.Text,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  leading: Icon(Icons.list),
                                ),
                              );
                            },
                            filter: (value) => controller.varient1list
                                .where((element) => element.Text.toLowerCase().contains(value.toLowerCase()))
                                .toList(),
                            emptyWidget: Container(),
                            inputDecoration: InputDecoration(
                              labelText: "Search Actor",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                controller.showDescription.value ?
                Flexible(
                  flex: 2,
                  child: Column(
                children: [
                  CachedNetworkImage(
            imageUrl: controller.currentnetworkimg.value,
            imageBuilder: (context, imageProvider) => Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                image:NetworkImage('https://static.vecteezy.com/system/resources/previews/008/695/917/original/no-image-available-icon-simple-two-colors-template-for-no-image-or-picture-coming-soon-and-placeholder-illustration-isolated-on-white-background-vector.jpg'),
                fit: BoxFit.fill,
                ),
              ),
            ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentitemTitle.value,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller.itemDescriptioncurrent.value,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
              
              : const SizedBox()
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
