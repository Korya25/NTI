import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';

class DoctorData {
  static List<DoctorModel> liveDoctors = [
    DoctorModel(
      id: 'live1',
      name: 'Dr. Amina Yusuf',
      category: 'Heart Specialist',
      image:
          'https://images.unsplash.com/photo-1527613426441-4da17471b66d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZG9jdG9yc3xlbnwwfHwwfHx8MA%3D%3D',
      price: 150.0,
      rating: 4.8,
      ratingCount: 120,
      yearsExperience: 12,
      patientStories: 85,
      nextAvailable: 'Today, 4:30 PM',
    ),
    DoctorModel(
      id: 'live2',
      name: 'Dr. Faris Hakeem',
      category: 'Body Dermatologist',
      image:
          'https://images.unsplash.com/photo-1622253692010-333f2da6031d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRvY3RvcnN8ZW58MHx8MHx8fDA%3D',
      price: 100.0,
      rating: 4.6,
      ratingCount: 85,
      yearsExperience: 8,
      patientStories: 62,
      nextAvailable: 'Tomorrow, 10:00 AM',
    ),
    DoctorModel(
      id: 'live3',
      name: 'Dr. Leila Omar',
      category: 'Mind Psychiatrist',
      image:
          'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGRvY3RvcnN8ZW58MHx8MHx8fDA%3D',
      price: 120.0,
      rating: 4.7,
      ratingCount: 90,
      yearsExperience: 15,
      patientStories: 110,
      nextAvailable: 'Today, 6:00 PM',
    ),
    DoctorModel(
      id: 'live4',
      name: 'Dr. Karim Nassar',
      category: 'ENT Specialist',
      image:
          'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGRvY3RvcnN8ZW58MHx8MHx8fDA%3D',
      price: 110.0,
      rating: 4.4,
      ratingCount: 60,
      yearsExperience: 9,
      patientStories: 45,
      nextAvailable: 'Tomorrow, 2:00 PM',
    ),
    DoctorModel(
      id: 'live5',
      name: 'Dr. Huda Salman',
      category: 'Eye Specialist',
      image:
          'https://cdn.pixabay.com/photo/2024/09/03/15/21/ai-generated-9019518_1280.png',
      price: 140.0,
      rating: 4.9,
      ratingCount: 130,
      yearsExperience: 18,
      patientStories: 95,
      nextAvailable: 'Today, 5:15 PM',
    ),
    DoctorModel(
      id: 'live6',
      name: 'Dr. Tarek Ayman',
      category: 'Body Orthopedic',
      image:
          'https://cdn.pixabay.com/photo/2024/09/03/15/21/ai-generated-9019520_1280.png',
      price: 160.0,
      rating: 4.3,
      ratingCount: 70,
      yearsExperience: 11,
      patientStories: 50,
      nextAvailable: 'Tomorrow, 9:30 AM',
    ),
    DoctorModel(
      id: 'live7',
      name: 'Dr. Nourhan Adel',
      category: 'Tooth Dentist',
      image:
          'https://cdn.pixabay.com/photo/2017/01/29/21/16/nurse-2019420_1280.jpg',
      price: 90.0,
      rating: 4.5,
      ratingCount: 100,
      yearsExperience: 7,
      patientStories: 75,
      nextAvailable: 'Today, 3:45 PM',
    ),
    DoctorModel(
      id: 'live8',
      name: 'Dr. Ziad Hariri',
      category: 'Mind Neurologist',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 180.0,
      rating: 4.8,
      ratingCount: 160,
      yearsExperience: 20,
      patientStories: 120,
      nextAvailable: 'Tomorrow, 11:00 AM',
    ),
    DoctorModel(
      id: 'live9',
      name: 'Dr. Dalia Hamdi',
      category: 'Child Specialist',
      image:
          'https://cdn.pixabay.com/photo/2016/02/10/13/03/dentist-1191671_1280.jpg',
      price: 130.0,
      rating: 4.7,
      ratingCount: 140,
      yearsExperience: 14,
      patientStories: 105,
      nextAvailable: 'Today, 7:00 PM',
    ),
    DoctorModel(
      id: 'live10',
      name: 'Dr. Samer Qassem',
      category: 'Body Physician',
      image:
          'https://cdn.pixabay.com/photo/2017/05/23/17/12/doctor-2337835_1280.jpg',
      price: 95.0,
      rating: 4.6,
      ratingCount: 115,
      yearsExperience: 10,
      patientStories: 80,
      nextAvailable: 'Tomorrow, 8:00 AM',
    ),
  ];

  static List<DoctorModel> featuredDoctors = [
    DoctorModel(
      id: 'feat1',
      name: 'Dr. Rana Hani',
      category: 'Body Oncologist',
      image:
          'https://cdn.pixabay.com/photo/2017/05/23/17/12/doctor-2337835_1280.jpg',
      price: 200.0,
      rating: 4.9,
      ratingCount: 180,
      yearsExperience: 22,
      patientStories: 150,
      nextAvailable: 'Today, 5:00 PM',
    ),
    DoctorModel(
      id: 'feat2',
      name: 'Dr. Mazen Saleh',
      category: 'Body Endocrinologist',
      image:
          'https://cdn.pixabay.com/photo/2016/02/10/13/03/dentist-1191671_1280.jpg',
      price: 170.0,
      rating: 4.7,
      ratingCount: 150,
      yearsExperience: 16,
      patientStories: 110,
      nextAvailable: 'Tomorrow, 1:30 PM',
    ),
    DoctorModel(
      id: 'feat3',
      name: 'Dr. Yara Abbas',
      category: 'Women Specialist',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 160.0,
      rating: 4.6,
      ratingCount: 140,
      yearsExperience: 13,
      patientStories: 95,
      nextAvailable: 'Today, 4:00 PM',
    ),
    DoctorModel(
      id: 'feat4',
      name: 'Dr. Zain Maher',
      category: 'Body Nephrologist',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 190.0,
      rating: 4.8,
      ratingCount: 160,
      yearsExperience: 19,
      patientStories: 130,
      nextAvailable: 'Tomorrow, 3:00 PM',
    ),
    DoctorModel(
      id: 'feat5',
      name: 'Dr. Hana Zaki',
      category: 'Body Allergist',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 130.0,
      rating: 4.5,
      ratingCount: 110,
      yearsExperience: 11,
      patientStories: 85,
      nextAvailable: 'Today, 6:30 PM',
    ),
  ];

  static List<DoctorModel> popularDoctors = [
    DoctorModel(
      id: 'pop1',
      name: 'Dr. Nour Saad',
      category: 'Lung Specialist',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 145.0,
      rating: 4.7,
      ratingCount: 125,
      yearsExperience: 14,
      patientStories: 90,
      nextAvailable: 'Tomorrow, 10:30 AM',
    ),
    DoctorModel(
      id: 'pop2',
      name: 'Dr. Yamen Rashed',
      category: 'Body Surgeon',
      image:
          'https://cdn.pixabay.com/photo/2017/05/23/17/12/doctor-2337835_1280.jpg',
      price: 210.0,
      rating: 4.9,
      ratingCount: 200,
      yearsExperience: 25,
      patientStories: 180,
      nextAvailable: 'Today, 3:00 PM',
    ),
    DoctorModel(
      id: 'pop3',
      name: 'Dr. Marwa Alaa',
      category: 'Family Physician',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 110.0,
      rating: 4.6,
      ratingCount: 105,
      yearsExperience: 12,
      patientStories: 80,
      nextAvailable: 'Tomorrow, 9:00 AM',
    ),
    DoctorModel(
      id: 'pop4',
      name: 'Dr. Osama Sami',
      category: 'Heart Surgeon',
      image:
          'https://cdn.pixabay.com/photo/2017/05/23/17/12/doctor-2337835_1280.jpg',
      price: 230.0,
      rating: 4.8,
      ratingCount: 190,
      yearsExperience: 21,
      patientStories: 160,
      nextAvailable: 'Today, 5:45 PM',
    ),
    DoctorModel(
      id: 'pop5',
      name: 'Dr. Layal Fikri',
      category: 'Body Nutritionist',
      image:
          'https://cdn.pixabay.com/photo/2020/06/20/15/30/woman-doctor-5321351_1280.jpg',
      price: 100.0,
      rating: 4.5,
      ratingCount: 110,
      yearsExperience: 9,
      patientStories: 70,
      nextAvailable: 'Tomorrow, 2:15 PM',
    ),
  ];
  // Tooth Specialists (Dentists and Oral Health)
  static List<DoctorModel> toothList = [
    DoctorModel(
      id: 'tooth1',
      name: 'Dr. Nourhan Adel',
      category: 'Tooth Dentist',
      image:
          'https://cdn.pixabay.com/photo/2017/01/29/21/16/nurse-2019420_1280.jpg',
      price: 90.0,
      rating: 4.5,
      ratingCount: 100,
      yearsExperience: 7,
      patientStories: 75,
      nextAvailable: 'Today, 3:45 PM',
    ),
    DoctorModel(
      id: 'tooth2',
      name: 'Dr. Samir Khoury',
      category: 'Tooth Orthodontist',
      image: 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5',
      price: 120.0,
      rating: 4.7,
      ratingCount: 85,
      yearsExperience: 12,
      patientStories: 60,
      nextAvailable: 'Tomorrow, 10:30 AM',
    ),
    DoctorModel(
      id: 'tooth3',
      name: 'Dr. Lina Jawhari',
      category: 'Tooth Pediatric Dentist',
      image: 'https://images.unsplash.com/photo-1594824476967-48c8b964273f',
      price: 110.0,
      rating: 4.8,
      ratingCount: 95,
      yearsExperience: 9,
      patientStories: 70,
      nextAvailable: 'Today, 5:15 PM',
    ),
  ];

  // Body Specialists (General and Physical Health)
  static List<DoctorModel> bodyList = [
    DoctorModel(
      id: 'body1',
      name: 'Dr. Faris Hakeem',
      category: 'Body Dermatologist',
      image: 'https://images.unsplash.com/photo-1622253692010-333f2da6031d',
      price: 100.0,
      rating: 4.6,
      ratingCount: 85,
      yearsExperience: 8,
      patientStories: 62,
      nextAvailable: 'Tomorrow, 10:00 AM',
    ),
    DoctorModel(
      id: 'body2',
      name: 'Dr. Tarek Ayman',
      category: 'Body Orthopedic',
      image:
          'https://cdn.pixabay.com/photo/2024/09/03/15/21/ai-generated-9019520_1280.png',
      price: 160.0,
      rating: 4.3,
      ratingCount: 70,
      yearsExperience: 11,
      patientStories: 50,
      nextAvailable: 'Tomorrow, 9:30 AM',
    ),
    DoctorModel(
      id: 'body3',
      name: 'Dr. Samer Qassem',
      category: 'Body Physician',
      image:
          'https://cdn.pixabay.com/photo/2017/05/23/17/12/doctor-2337835_1280.jpg',
      price: 95.0,
      rating: 4.6,
      ratingCount: 115,
      yearsExperience: 10,
      patientStories: 80,
      nextAvailable: 'Tomorrow, 8:00 AM',
    ),
  ];

  // Eye Specialists (Vision and Ophthalmology)
  static List<DoctorModel> eyeList = [
    DoctorModel(
      id: 'eye1',
      name: 'Dr. Huda Salman',
      category: 'Eye Specialist',
      image:
          'https://cdn.pixabay.com/photo/2024/09/03/15/21/ai-generated-9019518_1280.png',
      price: 140.0,
      rating: 4.9,
      ratingCount: 130,
      yearsExperience: 18,
      patientStories: 95,
      nextAvailable: 'Today, 5:15 PM',
    ),
    DoctorModel(
      id: 'eye2',
      name: 'Dr. Karim Mansour',
      category: 'Eye Surgeon',
      image: 'https://images.unsplash.com/photo-1579684385127-1ef15d508118',
      price: 180.0,
      rating: 4.8,
      ratingCount: 110,
      yearsExperience: 15,
      patientStories: 90,
      nextAvailable: 'Tomorrow, 2:00 PM',
    ),
    DoctorModel(
      id: 'eye3',
      name: 'Dr. Yasmin Fawzy',
      category: 'Eye Pediatric Specialist',
      image: 'https://images.unsplash.com/photo-1551601651-bc60f254d532',
      price: 125.0,
      rating: 4.7,
      ratingCount: 88,
      yearsExperience: 12,
      patientStories: 65,
      nextAvailable: 'Today, 6:30 PM',
    ),
  ];

  // Heart Specialists (Cardiology)
  static List<DoctorModel> heartList = [
    DoctorModel(
      id: 'heart1',
      name: 'Dr. Amina Yusuf',
      category: 'Heart Specialist',
      image: 'https://images.unsplash.com/photo-1527613426441-4da17471b66d',
      price: 150.0,
      rating: 4.8,
      ratingCount: 120,
      yearsExperience: 12,
      patientStories: 85,
      nextAvailable: 'Today, 4:30 PM',
    ),
    DoctorModel(
      id: 'heart2',
      name: 'Dr. Osama Sami',
      category: 'Heart Surgeon',
      image: 'https://images.unsplash.com/photo-1651008376811-b90baee60c1f',
      price: 230.0,
      rating: 4.9,
      ratingCount: 190,
      yearsExperience: 21,
      patientStories: 160,
      nextAvailable: 'Today, 5:45 PM',
    ),
    DoctorModel(
      id: 'heart3',
      name: 'Dr. Layla Mohsen',
      category: 'Heart Pediatric Specialist',
      image: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2',
      price: 170.0,
      rating: 4.7,
      ratingCount: 105,
      yearsExperience: 14,
      patientStories: 75,
      nextAvailable: 'Tomorrow, 11:15 AM',
    ),
  ];

  // Helper method to get all lists in one map
  static Map<String, List<DoctorModel>> getAllCategoryLists() {
    return {
      'Tooth': toothList,
      'Body': bodyList,
      'Eye': eyeList,
      'Heart': heartList,
    };
  }

  static const List<String> dateTabs = [
    'Today, 23 Feb',
    'Tomorrow, 24 Feb',
    'Thursday, 25 Feb',
  ];

  static const List<String> afternoonSlots = [
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
  ];

  static const List<String> eveningSlots = [
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
  ];
  static String getSlotsAvailableText(int index) {
    switch (index) {
      case 0:
        return 'No slots available';
      case 1:
        return '9 slots available';
      case 2:
        return '10 slots available';
      default:
        return '';
    }
  }
}
