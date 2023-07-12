local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-oomph') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    blog: "https://eclipse.dev/oomph",
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Provides tools and frameworks for working more effectively with the Eclipse IDE.",
    discussion_source_repository: "eclipse-oomph/oomph",
    email: "oomph-dev@eclipse.org",
    has_discussions: true,
    name: "Eclipse Oomph",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/oomph/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('oomph') {
      allow_update_branch: false,
      default_branch: "master",
      has_discussions: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('oomph.incubator') {
      allow_update_branch: false,
      default_branch: "master",
      web_commit_signoff_required: false,
    },
  ],
}
