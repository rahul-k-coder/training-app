import 'package:flutter/material.dart';
import 'package:training_discovery_app/models/training.dart';



class TrainingProvider extends ChangeNotifier {
  final List<Training> _highlights = [
    Training(
      name: "Flutter Development",
      trainer: "Rahul Kumar",
      location: "Jaipur",
      description: "Learn how to build mobile apps using Flutter.",
      imageUrl: "https://media.istockphoto.com/id/1366428092/photo/webinar-e-learning-skills-business-internet-technology-concepts-training-webinar-e-learning.jpg?s=1024x1024&w=is&k=20&c=jQfNIYSeD7rN0ImI1Z7BW7lmUL487RZ3QYMvYUQocnM=",
    ),
    Training(
      name: "Android Development",
      trainer: "John Doe",
      location: "Delhi",
      description: "Master Android development with Java & Kotlin.",
      imageUrl: "https://media.istockphoto.com/id/1366428092/photo/webinar-e-learning-skills-business-internet-technology-concepts-training-webinar-e-learning.jpg?s=1024x1024&w=is&k=20&c=jQfNIYSeD7rN0ImI1Z7BW7lmUL487RZ3QYMvYUQocnM=",
    ),
  ];

  List<Training> get highlights => _highlights;

  final List<Training> _trainings = [
    Training(
      name: "Flutter Development",
      trainer: "Rahul Kumar",
      location: "Jaipur",
      description: "Learn how to build mobile apps using Flutter.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Android Development",
      trainer: "John Doe",
      location: "Delhi",
      description: "Master Android development with Java & Kotlin.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Data Science",
      trainer: "Dr. Smith",
      location: "Bangalore",
      description: "Introduction to Data Science and Machine Learning.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Web Development",
      trainer: "Emily Clark",
      location: "Mumbai",
      description: "Learn full-stack web development using MERN stack.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "UI/UX Design",
      trainer: "Sophia Lee",
      location: "Pune",
      description: "Master UI/UX design principles and tools.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Cloud Computing",
      trainer: "David Johnson",
      location: "Hyderabad",
      description: "Get hands-on experience with AWS and Azure.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Cybersecurity",
      trainer: "Alex White",
      location: "Chennai",
      description: "Understand the essentials of cybersecurity.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "DevOps Training",
      trainer: "Liam Taylor",
      location: "Noida",
      description: "Learn DevOps practices and tools.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Python Programming",
      trainer: "Olivia Brown",
      location: "Ahmedabad",
      description: "Learn Python programming from basics to advanced.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Machine Learning",
      trainer: "Ethan Wilson",
      location: "Kolkata",
      description: "Dive into machine learning and AI concepts.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Big Data Analytics",
      trainer: "Emma Martinez",
      location: "Indore",
      description: "Learn how to analyze and process big data.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Digital Marketing",
      trainer: "Daniel Davis",
      location: "Lucknow",
      description: "Master digital marketing strategies.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Blockchain Technology",
      trainer: "Chloe Garcia",
      location: "Nagpur",
      description: "Understand the fundamentals of blockchain.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Game Development",
      trainer: "Mia Anderson",
      location: "Coimbatore",
      description: "Learn to create games using Unity and Unreal Engine.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "iOS Development",
      trainer: "Benjamin Hall",
      location: "Surat",
      description: "Master iOS app development with Swift.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "AI and Robotics",
      trainer: "Ava Moore",
      location: "Patna",
      description: "Explore AI and robotics engineering.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Project Management",
      trainer: "Jack Wright",
      location: "Jaipur",
      description: "Learn effective project management techniques.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Agile Scrum Training",
      trainer: "Isabella Turner",
      location: "Delhi",
      description: "Master Agile Scrum framework for software development.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "Networking and Security",
      trainer: "Charlotte Hill",
      location: "Bangalore",
      description: "Understand computer networking and security basics.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
    Training(
      name: "React Native Development",
      trainer: "Lucas Harris",
      location: "Mumbai",
      description: "Build cross-platform mobile apps using React Native.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s",
    ),
  ];
  List<Training> get trainingsInitial => _trainings;

  List<Training> trainings = [];

  init(){
    trainings.addAll(trainingsInitial);
    refresh();
  }

  void filter() {
    // Clear the previous filtered list
    trainings.clear();

    // Separate filtered and unfiltered items
    List<Training> filtered = [];
    List<Training> unfiltered = [];

    for (var e in trainingsInitial) {
      if (e.isLocation == true || e.isName == true || e.isTrainer == true) {
        filtered.add(e); // Add to filtered list
      } else {
        unfiltered.add(e); // Add to unfiltered list
      }
    }

    // Add filtered items first, then unfiltered
    trainings.addAll(filtered);
    trainings.addAll(unfiltered);

    // Refresh the UI
    refresh();
  }


  refresh(){
    notifyListeners();
  }
}