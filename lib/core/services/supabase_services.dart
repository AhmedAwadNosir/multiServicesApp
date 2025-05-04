import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final SupabaseClient _supabase = Supabase.instance.client;

  //----------------------------------------
  // Supabase Auth
  //----------------------------------------

  // Sign up with email and password
  Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: data,
    );
    return response;
  }

  // Sign in with email and password
  Future<AuthResponse> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  // Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Send email verification
  Future<void> sendEmailVerification() async {
    await _supabase.auth.resend(
      type: OtpType.signup,
      email: _supabase.auth.currentUser?.email ?? '',
    );
  }

  // Check if email is verified
  bool isEmailVerified() {
    return _supabase.auth.currentUser?.emailConfirmedAt != null;
  }

  //----------------------------------------
  // Database Operations (Tables)
  //----------------------------------------

  // Insert a record (returns the inserted record)
  Future<Map<String, dynamic>> insert({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final response =
        await _supabase.from(tableName).insert(data).select().single();
    return response;
  }

  // Insert multiple records
  Future<List<Map<String, dynamic>>> insertMany({
    required String tableName,
    required List<Map<String, dynamic>> data,
  }) async {
    final response = await _supabase.from(tableName).insert(data).select();
    return response;
  }

  // Upsert a record (insert or update if exists)
  Future<Map<String, dynamic>> upsert({
    required String tableName,
    required Map<String, dynamic> data,
    String? onConflict,
  }) async {
    final response =
        await _supabase
            .from(tableName)
            .upsert(data, onConflict: onConflict)
            .select()
            .single();
    return response;
  }

  // Get all records from a table
  Future<List<Map<String, dynamic>>> getAll({required String tableName}) async {
    final response = await _supabase.from(tableName).select();
    return response;
  }

  // Get records with filtering
  Future<List<Map<String, dynamic>>> getWhere({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    final response = await _supabase.from(tableName).select().eq(column, value);
    return response;
  }

  // Get a single record by ID
  Future<Map<String, dynamic>> getById({
    required String tableName,
    required String id,
  }) async {
    final response =
        await _supabase.from(tableName).select().eq('id', id).single();
    return response;
  }

  // Update a record
  Future<Map<String, dynamic>> update({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final response =
        await _supabase
            .from(tableName)
            .update(data)
            .eq('id', id)
            .select()
            .single();
    return response;
  }

  // Delete a record
  Future<void> delete({required String tableName, required String id}) async {
    await _supabase.from(tableName).delete().eq('id', id);
  }

  //----------------------------------------
  // Advanced Querying
  //----------------------------------------

  // Filter with multiple conditions
  // Future<List<Map<String, dynamic>>> filter({
  //   required String tableName,
  //   Map<String, dynamic>? equals,
  //   Map<String, dynamic>? notEquals,
  //   Map<String, dynamic>? greaterThan,
  //   Map<String, dynamic>? lessThan,
  //   Map<String, List<dynamic>>? inValues,
  //   Map<String, List<dynamic>>? contains,
  //   int? limit,
  //   String? orderBy,
  //   bool? ascending,
  // }) async {
  //   var query = _supabase.from(tableName).select();

  //   // Apply filters
  //   equals?.forEach((key, value) => query = query.eq(key, value));
  //   notEquals?.forEach((key, value) => query = query.neq(key, value));
  //   greaterThan?.forEach((key, value) => query = query.gt(key, value));
  //   lessThan?.forEach((key, value) => query = query.lt(key, value));
  //   inValues?.forEach((key, values) => query = query.in(key, values));
  //   contains?.forEach((key, values) => query = query.contains(key, values));

  //   // Apply ordering
  //   if (orderBy != null) {
  //     query = query.order(orderBy, ascending: ascending ?? true);
  //   }

  //   // Apply limit
  //   if (limit != null) {
  //     query = query.limit(limit);
  //   }

  //   final response = await query;
  //   return response;
  // }

  //----------------------------------------
  // Storage Operations
  //----------------------------------------

  // Upload a file
  Future<String> uploadFile({
    required String bucketName,
    required String path,
    required File file,
  }) async {
    await _supabase.storage.from(bucketName).upload(path, file);

    return getFileUrl(bucketName: bucketName, path: path);
  }

  // Get file URL
  String getFileUrl({required String bucketName, required String path}) {
    return _supabase.storage.from(bucketName).getPublicUrl(path);
  }

  // Delete a file
  Future<void> deleteFile({
    required String bucketName,
    required String path,
  }) async {
    await _supabase.storage.from(bucketName).remove([path]);
  }

  //----------------------------------------
  // Realtime Subscriptions
  //----------------------------------------

  // Subscribe to table changes
  // Stream<List<Map<String, dynamic>>> subscribeToTable({
  //   required String tableName,
  //   String? filterColumn,
  //   dynamic filterValue,
  // }) {
  //   var query = _supabase
  //       .from(tableName)
  //       .stream(primaryKey: ['id']);

  //   if (filterColumn != null && filterValue != null) {
  //     query = query.eq(filterColumn, filterValue);
  //   }

  //   return query;
  // }

  //----------------------------------------
  // Row Level Security (RLS) Helpers
  //----------------------------------------

  // Get current user's UUID (for RLS policies)
  String? getCurrentUserId() {
    return _supabase.auth.currentUser?.id;
  }

  // Check if current user is authenticated
  bool isAuthenticated() {
    return _supabase.auth.currentUser != null;
  }

  //----------------------------------------
  // Custom SQL Queries
  //----------------------------------------

  // Execute a custom SQL query
  Future<List<Map<String, dynamic>>> executeSql(String sql) async {
    final response = await _supabase.rpc(sql);
    return response;
  }
}
