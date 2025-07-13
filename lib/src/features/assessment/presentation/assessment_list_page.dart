import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';
import 'package:watchyourhealth/src/core/utils/custom_shimmer.dart';
import 'package:watchyourhealth/src/core/utils/custom_snackbar.dart';
import 'package:watchyourhealth/src/features/assessment/data/assessment_list_state.dart';
import 'package:watchyourhealth/src/features/assessment/data/assessment_model.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/assessment_detail_page.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/providers/assessment_list_provider.dart';
import 'package:watchyourhealth/src/features/assessment/presentation/widgets/assessment_card.dart';

class AssessmentListPage extends ConsumerStatefulWidget {
  const AssessmentListPage({super.key, required this.assessments});

  final List<Assessment> assessments;

  @override
  ConsumerState<AssessmentListPage> createState() => _AssessmentListPageState();
}

class _AssessmentListPageState extends ConsumerState<AssessmentListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final state =
        ref.read(assessmentListProvider).value ?? AssessmentListState();
    final notifier = ref.read(assessmentListProvider.notifier);

    // Load more when scrolled to bottom and not already loading more
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        state is AsyncData &&
        !(state).isLoadingMore &&
        state.hasMore) {
      notifier.loadMoreData();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showErrorSnackBar(String message) {
    CustomSnackBar.showError(
      context,
      message:
          'Something went wrong while login, Please try again after some time',
    );
  }

  final ScrollPhysics combinedPhysics = const ClampingScrollPhysics().applyTo(
    const AlwaysScrollableScrollPhysics(),
  );

  @override
  Widget build(BuildContext context) {
    final assessmentListState = ref.watch(assessmentListProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.wakeYourHealthPrimary,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Assessments',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.wakeYourHealthPrimary,
                    ),
                  ),
                ],
              ),

              // Body
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: assessmentListState.when(
                  loading: () => ShimmerListPage(),
                  error: (err, stack) => Center(child: Text('Oops!')),
                  data: (state) {
                    if (state.error != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _showErrorSnackBar(state.error!);
                      });
                    }

                    return RefreshIndicator(
                      onRefresh: () =>
                          ref.read(assessmentListProvider.notifier).refresh(),
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: combinedPhysics,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 12.0,
                        ),
                        itemCount:
                            state.assessments.length +
                            (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < state.assessments.length) {
                            final assessment = state.assessments[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: AssessmentCard(
                                assessment: assessment,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AssessmentDetailPage(
                                            assessment: assessment,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            // Show loader while loading more
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
