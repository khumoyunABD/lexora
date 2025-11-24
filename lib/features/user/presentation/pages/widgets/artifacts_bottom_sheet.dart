import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';

class ArtifactsBottomSheet extends StatelessWidget {
  final List<ArtifactEntity> artifacts;

  const ArtifactsBottomSheet({
    super.key,
    required this.artifacts,
  });

  @override
  Widget build(BuildContext context) {
    if (artifacts.isEmpty) {
      return Container();
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
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
                  'Artifacts',
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

          // Artifacts list
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemCount: artifacts.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.white.withValues(alpha: 0.05),
              ),
              itemBuilder: (context, index) {
                final artifact = artifacts[index];
                return _ArtifactItem(
                  artifact: artifact,
                  onTap: () => _showArtifactDetails(context, artifact),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showArtifactDetails(BuildContext context, ArtifactEntity artifact) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ArtifactDetailsSheet(artifact: artifact),
    );
  }
}

class _ArtifactItem extends StatelessWidget {
  final ArtifactEntity artifact;
  final VoidCallback onTap;

  const _ArtifactItem({
    required this.artifact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            // Icon based on artifact type
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: _getArtifactColor(artifact.artifactType),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                _getArtifactIcon(artifact.artifactType),
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),

            // Artifact info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artifact.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        artifact.artifactType.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '• v${artifact.version}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '• ${artifact.wordCount} words',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
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

  Color _getArtifactColor(String type) {
    switch (type.toLowerCase()) {
      case 'code':
        return const Color(0xFF1E4B5F);
      case 'document':
        return const Color(0xFF2D5F3C);
      case 'text':
        return const Color(0xFF6B4423);
      default:
        return const Color(0xFF4A4A4A);
    }
  }

  IconData _getArtifactIcon(String type) {
    switch (type.toLowerCase()) {
      case 'code':
        return Icons.code;
      case 'document':
        return Icons.description_outlined;
      case 'text':
        return Icons.text_snippet_outlined;
      default:
        return Icons.article_outlined;
    }
  }
}

class ArtifactDetailsSheet extends StatelessWidget {
  final ArtifactEntity artifact;

  const ArtifactDetailsSheet({
    super.key,
    required this.artifact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artifact.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${artifact.artifactType.toUpperCase()} • v${artifact.version} • ${artifact.wordCount} words',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(text: artifact.content));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copied to clipboard'),
                              backgroundColor: Color(0xFF2D5F3C),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(
                          Icons.content_copy,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
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
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.1),
          ),

          // Content
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: SelectableText(
                artifact.content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  height: 1.5,
                  fontFamily: artifact.artifactType.toLowerCase() == 'code'
                      ? 'monospace'
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
