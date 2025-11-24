import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class SourcesBottomSheet extends StatelessWidget {
  final List<SourceItemEntity> sources;

  const SourcesBottomSheet({
    super.key,
    required this.sources,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sources',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.1),
          ),

          // Sources list
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemCount: sources.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.white.withValues(alpha: 0.05),
              ),
              itemBuilder: (context, index) {
                final source = sources[index];
                return _SourceItem(source: source);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SourceItem extends StatelessWidget {
  final SourceItemEntity source;

  const _SourceItem({required this.source});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (source.sourceUrl != null && source.sourceUrl!.isNotEmpty) {
          final url = Uri.parse(source.sourceUrl!);
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not open ${source.sourceUrl}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            // Icon based on source type
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: source.sourceType == 'UPLOAD'
                    ? const Color(0xFF2D5F3C)
                    : const Color(0xFF1E4B5F),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                source.sourceType == 'UPLOAD'
                    ? Icons.upload_file
                    : Icons.search,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),

            // Source info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    source.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (source.contentPreview.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Text(
                      source.contentPreview,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            // Arrow icon
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withValues(alpha: 0.4),
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
