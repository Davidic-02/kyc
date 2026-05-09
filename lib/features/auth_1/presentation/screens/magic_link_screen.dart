import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';
import 'package:go_router/go_router.dart';
import 'package:kyc/core/services/toast_services.dart';
import 'package:kyc/core/widgets/custom_button.dart';
import 'package:kyc/core/widgets/custom_textfield.dart';
import 'package:kyc/features/auth_1/bloc/magic_link/magic_link_bloc.dart';

class MagicLinkScreen extends HookWidget {
  const MagicLinkScreen({super.key});

  static const String routeName = 'magic-link';

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<MagicLinkBloc, MagicLinkState>(
        listenWhen: (prev, curr) =>
            prev.isAuthenticated != curr.isAuthenticated ||
            prev.errorMessage != curr.errorMessage,
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.go('/kyc');
            return;
          }

          if (state.errorMessage.isNotEmpty) {
            ToastService.toast(state.errorMessage, ToastType.error);
          }
          if (state.sendStatus == MagicLinkStatus.success && state.linkSent) {
            ToastService.toast(
              "Magic link sent to ${state.email.value}",
              ToastType.success,
            );
          }
        },
        child: BlocBuilder<MagicLinkBloc, MagicLinkState>(
          buildWhen: (prev, curr) =>
              prev.sendStatus != curr.sendStatus ||
              prev.email != curr.email ||
              prev.linkSent != curr.linkSent ||
              prev.errorMessage != curr.errorMessage,
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .18),

                    Text(
                      'Sign in with Email',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: AppSizes.sm),

                    Text(
                      'Enter your email and we\'ll send you a secure magic link to continue.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: AppSizes.xl),

                    CustomTextFormField(
                      focusNode: emailFocusNode,
                      hintText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      fillColor: AppColors.surface,
                      onChanged: (value) {
                        context.read<MagicLinkBloc>().add(
                          MagicLinkEvent.emailChanged(value),
                        );
                      },
                      onFieldSubmitted: (_) {
                        if (state.isEmailValid) {
                          context.read<MagicLinkBloc>().add(
                            const MagicLinkEvent.sendLink(),
                          );
                        }
                      },
                      errorText: !state.email.isPure && state.email.isNotValid
                          ? 'Please enter a valid email address'
                          : null,
                    ),

                    const SizedBox(height: AppSizes.xl),

                    // ✅ Show inline error under button too
                    if (state.errorMessage.isNotEmpty &&
                        state.sendStatus == MagicLinkStatus.failure) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red.shade700,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.errorMessage,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),
                    ],

                    if (!state.linkSent)
                      Button(
                        'Send Magic Link',
                        busy: state.sendStatus == MagicLinkStatus.loading,
                        onPressed:
                            state.sendStatus == MagicLinkStatus.loading ||
                                state.email.isNotValid
                            ? null
                            : () {
                                context.read<MagicLinkBloc>().add(
                                  const MagicLinkEvent.sendLink(),
                                );
                              },
                      ),

                    if (state.linkSent) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSizes.lg),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.mark_email_read_rounded,
                              color: AppColors.primary,
                              size: 40,
                            ),
                            const SizedBox(height: AppSizes.md),
                            Text(
                              'Check your email',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: AppSizes.sm),
                            Text(
                              'We sent a magic sign in link to ${state.email.value}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSizes.lg),
                      Button(
                        'Resend Link',
                        busy: state.sendStatus == MagicLinkStatus.loading,
                        onPressed: state.sendStatus == MagicLinkStatus.loading
                            ? null
                            : () {
                                context.read<MagicLinkBloc>().add(
                                  const MagicLinkEvent.sendLink(),
                                );
                              },
                      ),
                    ],

                    SizedBox(height: MediaQuery.of(context).size.height * .25),

                    Center(
                      child: Text(
                        'Secure passwordless authentication',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSizes.lg),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
