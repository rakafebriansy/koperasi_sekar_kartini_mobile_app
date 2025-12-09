// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'http://192.168.1.8:8000';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<dynamic> login({
    required String phoneNumber,
    required String password,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phone_number': phoneNumber,
      'password': password,
    };
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> register({
    String? identityNumber,
    String? name,
    String? birthDate,
    String? phoneNumber,
    String? address,
    String? occupation,
    String? password,
    int? workAreaId,
    File? identityCardPhoto,
    File? selfPhoto,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (identityNumber != null) {
      _data.fields.add(MapEntry(
        'identity_number',
        identityNumber,
      ));
    }
    if (name != null) {
      _data.fields.add(MapEntry(
        'name',
        name,
      ));
    }
    if (birthDate != null) {
      _data.fields.add(MapEntry(
        'birth_date',
        birthDate,
      ));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry(
        'phone_number',
        phoneNumber,
      ));
    }
    if (address != null) {
      _data.fields.add(MapEntry(
        'address',
        address,
      ));
    }
    if (occupation != null) {
      _data.fields.add(MapEntry(
        'occupation',
        occupation,
      ));
    }
    if (password != null) {
      _data.fields.add(MapEntry(
        'password',
        password,
      ));
    }
    if (workAreaId != null) {
      _data.fields.add(MapEntry(
        'work_area_id',
        workAreaId.toString(),
      ));
    }
    if (identityCardPhoto != null) {
      if (identityCardPhoto != null) {
        _data.files.add(MapEntry(
          'identity_card_photo',
          MultipartFile.fromFileSync(
            identityCardPhoto.path,
            filename: identityCardPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (selfPhoto != null) {
      if (selfPhoto != null) {
        _data.files.add(MapEntry(
          'self_photo',
          MultipartFile.fromFileSync(
            selfPhoto.path,
            filename: selfPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/register',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> refreshToken() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/refresh',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> logout() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/logout',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getWorkAreas({String? search}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'search': search};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/work-areas',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> createWorkArea({String? name}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'name': name};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/work-areas',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateWorkArea({
    required int id,
    String method = "PUT",
    String? name,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      '_method': method,
      'name': name,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/work-areas/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> deleteWorkArea({
    required int id,
    String method = "DELETE",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'_method': method};
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/work-areas/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getUsers({
    String? search,
    int? groupId,
    String? role,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'group_id': groupId,
      r'role': role,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getUnlistedMembers({
    String? search,
    int? workAreaId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'work_area_id': workAreaId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/unlisted-members',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getInactiveMembers({String? search}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'search': search};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/inactive-members',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> createUser({
    String? identityNumber,
    String? memberNumber,
    String? name,
    String? birthDate,
    String? phoneNumber,
    String? address,
    String? occupation,
    String? password,
    String? role,
    File? identityCardPhoto,
    File? selfPhoto,
    File? memberCardPhoto,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (identityNumber != null) {
      _data.fields.add(MapEntry(
        'identity_number',
        identityNumber,
      ));
    }
    if (memberNumber != null) {
      _data.fields.add(MapEntry(
        'member_number',
        memberNumber,
      ));
    }
    if (name != null) {
      _data.fields.add(MapEntry(
        'name',
        name,
      ));
    }
    if (birthDate != null) {
      _data.fields.add(MapEntry(
        'birth_date',
        birthDate,
      ));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry(
        'phone_number',
        phoneNumber,
      ));
    }
    if (address != null) {
      _data.fields.add(MapEntry(
        'address',
        address,
      ));
    }
    if (occupation != null) {
      _data.fields.add(MapEntry(
        'occupation',
        occupation,
      ));
    }
    if (password != null) {
      _data.fields.add(MapEntry(
        'password',
        password,
      ));
    }
    if (role != null) {
      _data.fields.add(MapEntry(
        'role',
        role,
      ));
    }
    if (identityCardPhoto != null) {
      if (identityCardPhoto != null) {
        _data.files.add(MapEntry(
          'identity_card_photo',
          MultipartFile.fromFileSync(
            identityCardPhoto.path,
            filename: identityCardPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (selfPhoto != null) {
      if (selfPhoto != null) {
        _data.files.add(MapEntry(
          'self_photo',
          MultipartFile.fromFileSync(
            selfPhoto.path,
            filename: selfPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (memberCardPhoto != null) {
      if (memberCardPhoto != null) {
        _data.files.add(MapEntry(
          'member_card_photo',
          MultipartFile.fromFileSync(
            memberCardPhoto.path,
            filename: memberCardPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateUser({
    required int id,
    String method = "PUT",
    String? identityNumber,
    String? name,
    String? birthDate,
    String? memberNumber,
    String? phoneNumber,
    String? address,
    String? occupation,
    String? role,
    String? password,
    int? workAreaId,
    File? identityCardPhoto,
    File? selfPhoto,
    File? memberCardPhoto,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    if (identityNumber != null) {
      _data.fields.add(MapEntry(
        'identity_number',
        identityNumber,
      ));
    }
    if (name != null) {
      _data.fields.add(MapEntry(
        'name',
        name,
      ));
    }
    if (birthDate != null) {
      _data.fields.add(MapEntry(
        'birth_date',
        birthDate,
      ));
    }
    if (memberNumber != null) {
      _data.fields.add(MapEntry(
        'member_number',
        memberNumber,
      ));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry(
        'phone_number',
        phoneNumber,
      ));
    }
    if (address != null) {
      _data.fields.add(MapEntry(
        'address',
        address,
      ));
    }
    if (occupation != null) {
      _data.fields.add(MapEntry(
        'occupation',
        occupation,
      ));
    }
    if (role != null) {
      _data.fields.add(MapEntry(
        'role',
        role,
      ));
    }
    if (password != null) {
      _data.fields.add(MapEntry(
        'password',
        password,
      ));
    }
    if (workAreaId != null) {
      _data.fields.add(MapEntry(
        'work_area_id',
        workAreaId.toString(),
      ));
    }
    if (identityCardPhoto != null) {
      if (identityCardPhoto != null) {
        _data.files.add(MapEntry(
          'identity_card_photo',
          MultipartFile.fromFileSync(
            identityCardPhoto.path,
            filename: identityCardPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (selfPhoto != null) {
      if (selfPhoto != null) {
        _data.files.add(MapEntry(
          'self_photo',
          MultipartFile.fromFileSync(
            selfPhoto.path,
            filename: selfPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (memberCardPhoto != null) {
      if (memberCardPhoto != null) {
        _data.files.add(MapEntry(
          'member_card_photo',
          MultipartFile.fromFileSync(
            memberCardPhoto.path,
            filename: memberCardPhoto.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/users/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> activateMember({
    required int id,
    String method = "PATCH",
    bool? isActive,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      '_method': method,
      'is_active': isActive,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}/activate',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> deleteUser({
    String method = "DELETE",
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'_method': method};
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> addGroupMember({
    required int id,
    required int groupId,
    String method = "PATCH",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'_method': method};
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}/group/${groupId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getGroups({
    String? search,
    int? workAreaId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'work_area_id': workAreaId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getGroup({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> createGroup({
    int? number,
    String? description,
    int? workAreaId,
    int? chairmanId,
    int? facilitatorId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'number': number,
      'description': description,
      'work_area_id': workAreaId,
      'chairman_id': chairmanId,
      'facilitator_id': facilitatorId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateGroup({
    required int id,
    String method = "PUT",
    int? number,
    String? description,
    int? workAreaId,
    int? chairmanId,
    int? facilitatorId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      '_method': method,
      'number': number,
      'description': description,
      'work_area_id': workAreaId,
      'chairman_id': chairmanId,
      'facilitator_id': facilitatorId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> deleteGroup({
    String method = "DELETE",
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateGroupChairman({
    required int id,
    required int userId,
    String method = "PATCH",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'_method': method};
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups/${id}/chairman/${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateGroupFacilitator({
    required int id,
    required int userId,
    String method = "PATCH",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'_method': method};
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups/${id}/facilitator/${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateFundAmount({
    required int id,
    String method = "PATCH",
    String? fundType,
    int? fundAmount,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      '_method': method,
      'fund_type': fundType,
      'fund_amount': fundAmount,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/groups/${id}/update-fund-amount',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getMeetings({
    String? search,
    int? groupId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'group_id': groupId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/meetings',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> getMeeting({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/meetings/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> createMeeting({
    String? name,
    String? type,
    String? datetime,
    String? location,
    String? description,
    File? photo,
    int? groupId,
    int? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (name != null) {
      _data.fields.add(MapEntry(
        'name',
        name,
      ));
    }
    if (type != null) {
      _data.fields.add(MapEntry(
        'type',
        type,
      ));
    }
    if (datetime != null) {
      _data.fields.add(MapEntry(
        'datetime',
        datetime,
      ));
    }
    if (location != null) {
      _data.fields.add(MapEntry(
        'location',
        location,
      ));
    }
    if (description != null) {
      _data.fields.add(MapEntry(
        'description',
        description,
      ));
    }
    if (photo != null) {
      if (photo != null) {
        _data.files.add(MapEntry(
          'photo',
          MultipartFile.fromFileSync(
            photo.path,
            filename: photo.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (groupId != null) {
      _data.fields.add(MapEntry(
        'group_id',
        groupId.toString(),
      ));
    }
    if (userId != null) {
      _data.fields.add(MapEntry(
        'user_id',
        userId.toString(),
      ));
    }
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/meetings',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateMeeting({
    required int id,
    String method = "PUT",
    String? name,
    String? type,
    String? datetime,
    String? location,
    String? description,
    File? photo,
    int? groupId,
    int? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    if (name != null) {
      _data.fields.add(MapEntry(
        'name',
        name,
      ));
    }
    if (type != null) {
      _data.fields.add(MapEntry(
        'type',
        type,
      ));
    }
    if (datetime != null) {
      _data.fields.add(MapEntry(
        'datetime',
        datetime,
      ));
    }
    if (location != null) {
      _data.fields.add(MapEntry(
        'location',
        location,
      ));
    }
    if (description != null) {
      _data.fields.add(MapEntry(
        'description',
        description,
      ));
    }
    if (photo != null) {
      if (photo != null) {
        _data.files.add(MapEntry(
          'photo',
          MultipartFile.fromFileSync(
            photo.path,
            filename: photo.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    if (groupId != null) {
      _data.fields.add(MapEntry(
        'group_id',
        groupId.toString(),
      ));
    }
    if (userId != null) {
      _data.fields.add(MapEntry(
        'user_id',
        userId.toString(),
      ));
    }
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/meetings/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> deleteMeeting({
    String method = "DELETE",
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/meetings/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
