import 'package:school_management_app/screens/students/marks_screen/model/post_model.dart';

List<Post> getPostsData() {
  return [
    Post(
        title: 'Post 1',
        subtitle: "Class 6",
        description: 'Please find your respective marks for class test 4 for science',
        attachmentUrl: 'attachment_url1.pdf'),
    Post(
        title: 'Post 2',
        subtitle: "Class 10",
        description: 'Please find your respective marks for class test 2 for history',
        attachmentUrl: 'attachment_url2.pdf'),
    // Add more posts as needed
  ];
}
