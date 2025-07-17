// ignore_for_file: deprecated_member_use

import 'package:advice/cubit/app_cubit.dart';
import 'package:advice/cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppCubit>().getAdvice();
      context.read<AppCubit>().getQuote();
      context.read<AppCubit>().getCatFact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Daily Content',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              context.read<AppCubit>().getAdvice();
              context.read<AppCubit>().getQuote();
              context.read<AppCubit>().getCatFact();
            },
          ),
        ],
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SimpleContentCard(
                  title: 'Daily Advice',
                  icon: Icons.lightbulb_outline,
                  content: state.advice?.advice ?? 'Loading advice...',
                  isLoading: state.isLoading && state.advice == null,
                  onRefresh: () => context.read<AppCubit>().getAdvice(),
                ),

                SizedBox(height: 16.h),

                SimpleContentCard(
                  title: 'Quote of the Day',
                  icon: Icons.format_quote,
                  content: state.quote?.content ?? 'Loading quote...',
                  author: state.quote?.author,
                  isLoading: state.isLoading && state.quote == null,
                  onRefresh: () => context.read<AppCubit>().getQuote(),
                ),

                SizedBox(height: 16.h),

                SimpleContentCard(
                  title: 'Cat Fact',
                  icon: Icons.pets,
                  content: state.catFact?.fact ?? 'Loading cat fact...',
                  isLoading: state.isLoading && state.catFact == null,
                  onRefresh: () => context.read<AppCubit>().getCatFact(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SimpleContentCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;
  final String? author;
  final bool isLoading;
  final VoidCallback onRefresh;

  const SimpleContentCard({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
    this.author,
    this.isLoading = false,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(icon, color: Colors.blue[300], size: 24.w),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              if (isLoading)
                SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.blue,
                  ),
                )
              else
                GestureDetector(
                  onTap: onRefresh,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.grey[400],
                    size: 20.w,
                  ),
                ),
            ],
          ),

          SizedBox(height: 12.h),

          // Content
          Text(
            content,
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.5,
              color: Colors.grey[300],
            ),
          ),

          // Author if exists
          if (author != null) ...[
            SizedBox(height: 8.h),
            Text(
              '— $author',
              style: TextStyle(
                fontSize: 12.sp,
                fontStyle: FontStyle.italic,
                color: Colors.grey[400],
              ),
            ),
          ],

          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _ActionButton(
                icon: Icons.copy,
                onPressed: () => _copyToClipboard(context),
              ),
              SizedBox(width: 8.w),
              _ActionButton(
                icon: Icons.share,
                onPressed: () => _shareContent(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    final textToCopy = _getFormattedText();

    Clipboard.setData(ClipboardData(text: textToCopy));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Copied to clipboard'),
        backgroundColor: Colors.green[600],
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _shareContent(BuildContext context) {
    final textToShare = _getFormattedText();
    
    try {
      Share.share(
        textToShare,
        subject: title,
      );
    } catch (e) {
      // Fallback to clipboard if share fails
      Clipboard.setData(ClipboardData(text: textToShare));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Share unavailable - copied to clipboard instead'),
          backgroundColor: Colors.orange[600],
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  String _getFormattedText() {
    return author != null ? '$content\n— $author' : content;
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ActionButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: Colors.white, size: 18.w),
      ),
    );
  }
}