import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watchyourhealth/src/features/assessment/data/assessment_list_state.dart';
import 'package:watchyourhealth/src/features/assessment/data/assessment_model.dart';

part 'assessment_list_provider.g.dart';

@riverpod
class AssessmentList extends _$AssessmentList {
  @override
  Future<AssessmentListState> build() async {
    // Enable offline persistence
    _configureOfflineSupport();

    // Load initial data
    return await loadInitialData();
  }

  static const int _pageSize = 10;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _configureOfflineSupport() {
    // Configure Firestore for offline support
    _firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  Future<AssessmentListState> loadInitialData() async {
    try {
      state = AsyncValue.data(
        AssessmentListState(isLoading: true, error: null),
      );

      final querySnapshot = await _firestore
          .collection('assessments')
          .limit(_pageSize)
          .get(const GetOptions(source: Source.cache));

      // If no cached data, fetch from server
      QuerySnapshot finalSnapshot;
      if (querySnapshot.docs.isEmpty) {
        finalSnapshot = await _firestore
            .collection('assessments')
            .limit(_pageSize)
            .get();
      } else {
        finalSnapshot = querySnapshot;
      }

      final assessments = finalSnapshot.docs
          .map((doc) => Assessment.fromFirestore(doc))
          .toList();

      return AssessmentListState(
        assessments: assessments,
        isLoading: false,
        hasMore: finalSnapshot.docs.length == _pageSize,
        lastDocument: finalSnapshot.docs.isNotEmpty
            ? finalSnapshot.docs.last
            : null,
      );
    } catch (e) {
      return AssessmentListState(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMoreData() async {
    if ((state.value?.isLoadingMore ?? false) ||
        !(state.value?.hasMore ?? false) ||
        state.value?.lastDocument == null) {
      return;
    }

    try {
      state = AsyncValue.data(AssessmentListState(isLoadingMore: true));

      final collectionRef = _firestore
          .collection('assessments')
          .limit(_pageSize);

      final query = (state.value?.lastDocument != null)
          ? collectionRef.startAfterDocument(state.value!.lastDocument!)
          : collectionRef;

      final querySnapshot = await query.get();

      final newAssessments = querySnapshot.docs
          .map((doc) => Assessment.fromFirestore(doc))
          .toList();

      state = AsyncValue.data(
        AssessmentListState(
          assessments: [...(state.value?.assessments ?? []), ...newAssessments],
          isLoadingMore: false,
          hasMore: querySnapshot.docs.length == _pageSize,
          lastDocument: querySnapshot.docs.isNotEmpty
              ? querySnapshot.docs.last
              : state.value?.lastDocument,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        AssessmentListState(isLoadingMore: false, error: e.toString()),
      );
    }
  }

  Future<void> refresh() async {
    state = AsyncValue.data(AssessmentListState(isLoading: true));
    await loadInitialData();
  }

  Future<void> addAssessment(Assessment assessment) async {
    try {
      await _firestore.collection('assessments').add(assessment.toJson());
      // Refresh the list to include the new assessment
      await refresh();
    } catch (e) {
      state = AsyncValue.data(AssessmentListState(error: e.toString()));
    }
  }

  Future<void> updateAssessment(
    String documentId,
    Assessment assessment,
  ) async {
    try {
      await _firestore
          .collection('assessments')
          .doc(documentId)
          .update(assessment.toJson());
      // Refresh the list to reflect changes
      await refresh();
    } catch (e) {
      state = AsyncValue.data(AssessmentListState(error: e.toString()));
    }
  }
}
