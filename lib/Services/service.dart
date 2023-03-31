class Post {
  final String userName;
  final String postImage;
  final String postDetails;

  Post(
      {required this.userName,
      required this.postImage,
      required this.postDetails});

  List<Post> posts = [
    Post(
      userName: 'John Doe',
      postImage: 'assets/snake.png',
      postDetails: 'Just saw this beautiful snake in my backyard!',
    ),
    Post(
      userName: 'Jane Smith',
      postImage: 'assets/insect.png',
      postDetails: 'This insect looks so cute!',
    ),
    Post(
      userName: 'Jane Smith',
      postImage: 'assets/insect.png',
      postDetails: 'This insect looks so cute!',
    ),
  ];
}
