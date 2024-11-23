class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  // Factory constructor to create a Post object from JSON
  static List<Post> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Post.fromJson(json)).toList();
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
    );
  }

  // Method to convert a Post object to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

// Function to parse a list of Post objects from JSON
List<Post> parsePosts(List<dynamic> jsonList) {
  return jsonList
      .map((json) => Post.fromJson(json as Map<String, dynamic>))
      .toList();
}
