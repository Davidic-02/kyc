// lib/features/auth/presentation/screens/magic_link_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kyc/core/constants/app_colors.dart';
import 'package:kyc/core/constants/app_sizes.dart';

import 'package:go_router/go_router.dart';
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
        listenWhen: (previous, current) =>
            previous.isAuthenticated != current.isAuthenticated,
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.goNamed('kyc_intro');
          }
        },

        child: BlocBuilder<MagicLinkBloc, MagicLinkState>(
          buildWhen: (previous, current) =>
              _buildWhen(context, previous, current),

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
                      'Enter your email and we’ll send you a secure magic link to continue.',
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
                        context.read<MagicLinkBloc>().add(
                          const MagicLinkEvent.sendLink(),
                        );
                      },

                      errorText: !state.email.isPure && state.email.isNotValid
                          ? 'Please enter a valid email address'
                          : null,
                    ),

                    const SizedBox(height: AppSizes.xl),

                    if (!state.linkSent)
                      Button(
                        'Send Magic Link',

                        busy: state.sendStatus == MagicLinkStatus.loading,

                        onPressed:
                            state.sendStatus == MagicLinkStatus.loading ||
                                !state.isEmailValid
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

  bool _buildWhen(
    BuildContext context,
    MagicLinkState previous,
    MagicLinkState current,
  ) {
    if (previous.sendStatus != current.sendStatus) {
      return true;
    }

    if (previous.email != current.email) {
      return true;
    }

    if (previous.linkSent != current.linkSent) {
      return true;
    }

    if (previous.errorMessage != current.errorMessage) {
      return true;
    }

    return false;
  }
}
