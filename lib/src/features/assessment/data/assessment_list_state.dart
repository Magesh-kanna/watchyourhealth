// Pagination State
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watchyourhealth/src/features/assessment/data/assessment_model.dart';

class AssessmentListState {
  final List<Assessment> assessments;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final DocumentSnapshot? lastDocument;

  AssessmentListState({
    this.assessments = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
    this.lastDocument,
  });

  AssessmentListState copyWith({
    List<Assessment>? assessments,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    DocumentSnapshot? lastDocument,
  }) {
    return AssessmentListState(
      assessments: assessments ?? this.assessments,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      error: error ?? this.error,
      lastDocument: lastDocument ?? this.lastDocument,
    );
  }
}
