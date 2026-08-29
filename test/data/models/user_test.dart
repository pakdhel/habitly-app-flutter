import 'package:flutter_test/flutter_test.dart';
import 'package:habitly/data/models/user.dart';

void main() {
  test('User.fromJson() harus parse data dengan benar', () {
    final json = {
      'id': 1,
      'firstName': 'Michael',
      'lastName': 'John',
      'email': 'email@example.com',
      'username': 'michael',
      'gender': 'Female',
      'image': 'example_url_image/image.png',
    };

    final user = User.fromJson(json);

    expect(user.id, json['id']);
    expect(user.firstName, json['firstName']);
    expect(user.lastName, json['lastName']);
    expect(user.email, json['email']);
    expect(user.username, json['username']);
    expect(user.gender, json['gender']);
    expect(user.image, json['image']);
  });

  test(
    'User.fromJson() tidak terjadi crash jika gender atau image kosong dari json',
    () {
      final json = {
        'id': 1,
        'firstName': 'Michael',
        'lastName': 'John',
        'email': 'email@example.com',
        'username': 'michael',
      };

      final user = User.fromJson(json);

      expect(user.id, json['id']);
      expect(user.firstName, json['firstName']);
      expect(user.lastName, json['lastName']);
      expect(user.email, json['email']);
      expect(user.username, json['username']);
      expect(user.gender, null);
      expect(user.image, null);
    },
  );
}
