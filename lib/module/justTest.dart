// Widget examsPagesNEW(String category, PageController pageController,
//     BuildContext context, AnimationController _controller, int x) {
//   var textProvider = Provider.of<TextProvider>(context, listen: false);
//   print("mmmmmm >>> 1");
//   return
//     StreamBuilder(
//         stream: collectionReference,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//           if (snapshot.hasData){
//             snapshot.data!.docs.map((e){
//               if(e["category_name"] == widget.category){
//                 print("mmmmmm >>> 2");
//
//                 return Padding(
//                   padding: EdgeInsets.only(top: 10.h, right: 2.w, left: 2.w),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//
//                         Consumer<TextProvider>(builder: (context, myData, child) {
//
//
//                           return Container(
//                             alignment: Alignment.center,
//                             height: 5.5.h,
//                             width: 30.w,
//                             decoration: BoxDecoration(
//                                 color: HexColor("#B3FBB6"),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Text(
//                               "Questionlewkw ${myData.currentPageForExamPage + 1}",
//                               style: GoogleFonts.poppins(
//                                   textStyle: TextStyle(
//                                     fontSize: 15.0.sp,
//                                   )),
//                             ),
//                           );
//                         }),
//
//                         SizedBox(
//                           height: 1.w,
//                         ),
//                         const Divider(
//                           color: Colors.black,
//                           thickness: 2,
//                         ),
//                         Expanded(
//                           child: PageView(
//                             physics: NeverScrollableScrollPhysics(),
//                             onPageChanged: (num) {
//                               textProvider.onPageExamChanged(num);
//                             },
//                             controller: pageController,
//                             children: [
//                               QuizView(
//                                 category: category,
//                                 summary: e["summary_question"],
//                                 index: 1,
//                                 name: e["element_name"],
//                                 options: [
//                                   e["element_name"],
//                                   e["element_name"],
//                                   e["element_name"],
//                                   e["element_name"],
//                                 ],
//                                 pageController: pageController,
//                                 currentPage: 0,
//                               ),
//                               // third quiz page
//                             ],
//                           ),
//                         ),
//                       ]),
//                 );
//               }}).toList();
//           }
//           print("mmmmmm >>> 3");
//           return Container();}
//     );
// }
