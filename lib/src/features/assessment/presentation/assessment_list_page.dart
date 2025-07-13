import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchyourhealth/src/core/utils/app_colors.dart';
import 'package:watchyourhealth/src/core/utils/custom_shimmer.dart';
import 'package:watchyourhealth/src/core/utils/custom_snackbar.dart';
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(assessmentListProvider.notifier).loadMoreData();
    }
  }

  void _showErrorSnackBar(String message) {
    CustomSnackBar.showError(
      context,
      message:
          'Something went wrong while login, Please try again after some time',
    );
  }

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

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: assessmentListState.when(
                  data: (assessmentListState) {
                    print(
                      "assessmentListState.assessments.length ${assessmentListState.assessments.length}",
                    );
                    print(
                      "assessmentListState.isLoading ${assessmentListState.isLoading}",
                    );
                    print(
                      "assessmentListState.isLoadingMore ${assessmentListState.isLoadingMore}",
                    );
                    print(
                      "assessmentListState.hasMore ${assessmentListState.hasMore}",
                    );
                    print(
                      "${assessmentListState.lastDocument} assessmentListState.lastDocument",
                    );
                    if (assessmentListState.error != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _showErrorSnackBar(assessmentListState.error!);
                      });
                    }

                    if (assessmentListState.isLoading) {
                      return ShimmerListPage();
                    } else {
                      return RefreshIndicator(
                        onRefresh: () =>
                            ref.read(assessmentListProvider.notifier).refresh(),
                        child: ListView.builder(
                          controller: _scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 12.0,
                          ),
                          itemCount:
                              assessmentListState.assessments.length +
                              (assessmentListState.hasMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            // Show loading indicator at the bottom when loading more
                            if (index ==
                                assessmentListState.assessments.length) {
                              return assessmentListState.isLoadingMore
                                  ? const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }

                            final assessment =
                                assessmentListState.assessments[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: AssessmentCard(
                                assessment: assessment,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          AssessmentDetailPage(
                                            assessment: assessment,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 12.0,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: widget.assessments.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: AssessmentCard(
                              assessment: widget.assessments[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => AssessmentDetailPage(
                                      assessment: widget.assessments[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    return Text('Oops');
                  },
                  loading: () => ShimmerListPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
