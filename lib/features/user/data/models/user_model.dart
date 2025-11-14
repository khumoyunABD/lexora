import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/user/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required int id,
    required String email,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Converts UserModel to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}
