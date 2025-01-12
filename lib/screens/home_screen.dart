import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';
import 'training_details_screen.dart';
import '../providers/training_provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLocation = 'All';
  String selectedTrainer = 'All';
 var filterListKey = ["Sort by", "Location", "Training Name", "Trainer"];

 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final trainingProvider = Provider.of<TrainingProvider>(context, listen: false);
      trainingProvider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Trainings", style: TextStyle(color: Colors.white, fontSize: 26)),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawerEnableOpenDragGesture: false,
      endDrawer: Drawer(),
      body: Consumer<TrainingProvider>(builder: (context, value, child) {
        final trainings = value.trainings;
        final highlights = value.highlights;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(height: 140, color: Colors.red,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Highlights", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(height: 140, autoPlay: true),
                          items: highlights.map((training) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TrainingDetailsScreen(training: training),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: double.maxFinite,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(training.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        training.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          backgroundColor: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Carousel Slider


              SizedBox(height: 10),

              /*  // Filters
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    value: selectedLocation,
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value!;
                      });
                    },
                    items: ["All", "Jaipur", "Delhi"]
                        .map((loc) => DropdownMenuItem(value: loc, child: Text(loc)))
                        .toList(),
                  ),
                  DropdownButton<String>(
                    value: selectedTrainer,
                    onChanged: (value) {
                      setState(() {
                        selectedTrainer = value!;
                      });
                    },
                    items: ["All", "Rahul Kumar", "John Doe"]
                        .map((trainer) => DropdownMenuItem(value: trainer, child: Text(trainer)))
                        .toList(),
                  ),
                ],
              ),*/

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: TextButton.icon(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        side: BorderSide(color: Colors.grey, width: 1.0), // Border color and width
                      ),
                    ),
                  ),
                  onPressed: () {
                    _modalBottomSheetMenu();
                  },
                  label: Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.grey,
                  ),
                ),
              ),

              Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.only(top: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: trainings.length,
                  itemBuilder: (context, index) {
                    var e = trainings[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrainingDetailsScreen(training: trainings[index]),
                          ),
                        );
                      },
                      child: Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: Border.all(color: Colors.white, style: BorderStyle.solid),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'OCT !! - 13,\n2019',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '08:30 am - 12:30 pm',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    e.location,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                                child: Dash(
                                    direction: Axis.vertical,
                                    length: 150,
                                    dashLength: 8,
                                    dashColor: Colors.grey),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      index % 2 == 0 ? 'Filling Fast!' :'Early Bird!',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Text(
                                      '${e.name} (4.6)',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(trainings[index].imageUrl, width: 40, height: 40),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(e.trainer,style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Text(e.description, style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                // fontWeight: FontWeight.bold
                                              ),),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),

                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                                          backgroundColor: WidgetStatePropertyAll(Colors.red),
                                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0.0), // Rounded corners
                                              // side: BorderSide(color: Colors.red, width: 1.0), // Border color and width
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Enrol Now',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
        );
        },
      ),
    );
  }

  num lastPosition = 1;
  void _modalBottomSheetMenu() {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
    //  isScrollControlled: true, // Allow full-screen scrolling if needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: size.width,
              color: Colors.transparent, // Transparent for rounded corners
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjust size to content
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Sort and Filters',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1),

                    // Main Content
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Filter List
                          Expanded(
                            flex: 4, // Adjust flex as needed
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: filterListKey.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var e = filterListKey[index];
                                return InkWell(
                                  onTap: () {
                                    setState((){
                                      lastPosition = index;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(left: BorderSide(color: lastPosition == index ? Colors.red : Colors.transparent, width: 4)),
                                      color: lastPosition == index ?  Colors.white : Colors.grey.shade100
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: lastPosition == index ? FontWeight.w500 : FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      
                          // Placeholder for Additional Content
                          Expanded(
                            flex: 6, // Adjust flex as needed
                            child: Consumer<TrainingProvider>(
                              builder: (context, value, child) {
                               // final trainingProvider = Provider.of<TrainingProvider>(context, listen: false);
                                final trainings = value.trainingsInitial;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Add widgets or content here
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                            borderSide: BorderSide(width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blueGrey),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.redAccent),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.orangeAccent),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          contentPadding: EdgeInsets.all(10.0),
                                          hintText: 'Search',
                                          // labelText: 'Search',
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      // height: size.height,
                                      child:
                                      lastPosition == 1
                                          ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: trainings.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          var e = trainings[index];
                                          return InkWell(
                                            onTap: () {
                                             e.isLocation = !e.isLocation!;
                                             value.filter();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 16),
                                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  e.isLocation == true ? Icon(Icons.check_box, color: Colors.red)
                                                      : Icon(Icons.check_box_outline_blank, color: Colors.grey),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      e.location,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: e.isLocation == true ? FontWeight.w500 : FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                      : lastPosition == 2
                                          ?  ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: trainings.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          var e = trainings[index];
                                          return InkWell(
                                            onTap: () {
                                              e.isName = !e.isName!;
                                              value.filter();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 16),
                                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  e.isName == true ? Icon(Icons.check_box, color: Colors.red)
                                                      : Icon(Icons.check_box_outline_blank, color: Colors.grey),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      e.name,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: e.isName == true ? FontWeight.w500 : FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                      : lastPosition == 3
                                      ?  ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: trainings.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          var e = trainings[index];
                                          return InkWell(
                                            onTap: () {
                                              e.isTrainer = !e.isTrainer!;
                                              value.filter();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 16),
                                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  e.isTrainer == true ? Icon(Icons.check_box, color: Colors.red)
                                                      : Icon(Icons.check_box_outline_blank, color: Colors.grey),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      e.trainer,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: e.isTrainer == true ? FontWeight.w500 : FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ) :
                                      SizedBox(),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}