# Contributing

> Thank you for contributing. Contributions are always welcome, no matter how large or small.

## Table of Contents

- [Guidelines](#guidelines)
- [Pull Requests](#submitting-a-pull-request)
- [Coding Rules](#coding-rules)
- [Working with Code](#working-with-code)
- [Release Flow](#release-flow)
- [File Structure](#file-structure)

---

## Guidelines <a id="guidelines"></a>

As a contributor, here are the guidelines you should follow:

- [Code of conduct](#code-of-conduct)
- [How can I contribute?](#how-can-i-contribute)
- [Using the issue tracker](#using-the-issue-tracker)
- [Submitting a Pull Request](#submitting-a-pull-request)
- [Coding rules](#coding-rules)
- [Working with code](#working-with-code)

We also recommend to read [How to Contribute to Open Source](https://opensource.guide/how-to-contribute).

---

## Code of conduct <a id="code-of-conduct"></a>

Please read and follow our [code of conduct](CODE_OF_CONDUCT.md).

---

## How can I contribute? <a id="how-can-i-contribute"></a>

### Improve documentation <a id="improve-documentation"></a>

Consider helping us to improve our documentation by finding _documentation issues_ that need help, and by submitting pull requests for corrections, clarifications, more examples, new features, etc.

Please follow the [Documentation guidelines](STYLE_GUIDES.md#documentation).

### Give feedback on issues <a id=""></a>

Some issues are created without information requested in the [Bug report guideline](#bug-report). Help making them easier to resolve by adding any relevant information.

Issues with the [`type: discussion` label](https://github.com/seantrane/image-ruby-jekyll/issues?q=is%3Aissue+is%3Aopen+label%3A%22type%3A+discussion) are meant to discuss the implementation of new features. Participating in the discussion is a good opportunity to get involved and influence the future.

### Fix bugs and implement features <a id=""></a>

Confirmed bug and ready to implement features are marked with the [`help` label](https://github.com/seantrane/image-ruby-jekyll/issues?q=is%3Aissue+is%3Aopen+label%3Ahelp). Post a comment on an issue to indicate you would like to work on it and to request help from the team and the community.

---

## Using the issue tracker <a id="using-the-issue-tracker"></a>

The issue tracker is the channel for [bug reports](#bug-report), [features requests](#feature-request) and [submitting pull requests](#submitting-a-pull-request) only. Please use the [Support](README.md#support) and [Get help](README.md#get-help) sections for support, troubleshooting and questions.

Before opening an Issue or a Pull Request, please use the [GitHub issue search](https://github.com/seantrane/image-ruby-jekyll/issues?q=) to make the bug or feature request hasn't been [already reported](https://github.com/seantrane/image-ruby-jekyll/issues?q=is%3Aopen+) or [fixed](https://github.com/seantrane/image-ruby-jekyll/issues?q=reason%3Acompleted).

### Bug report <a id="bug-report"></a>

A good bug report shouldn't leave others needing to chase you up for more information. Please try to be as detailed as possible in your report and fill the information requested in the _[Bug/Issue Template](.github/ISSUE_TEMPLATE/issue_template.md)_.

### Feature request <a id="feature-request"></a>

Feature requests are welcome. But take a moment to find out whether your idea fits with the scope and aims of the project. It's up to you to make a strong case to convince the project's developers of the merits of this feature. Please provide as much detail and context as possible and fill the information requested in the _[Agile Story Template](STORY_TEMPLATE.md)_.

---

## Submitting a Pull Request <a id="submitting-a-pull-request"></a>

Good pull requests whether patches, improvements or new features are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

**Please ask first** before embarking on any significant pull request (e.g. implementing features, refactoring code), otherwise you risk spending a lot of time working on something that the project's developers might not want to merge into the project.

If you never created a pull request before, then [learn how to submit a pull request (great tutorial)](https://opensource.guide/how-to-contribute/#opening-a-pull-request).

Here is a summary of the steps to follow:

1. [Set up the workspace](#set-up-the-workspace)
2. If you cloned a while ago, get the latest changes from upstream and update dependencies.
3. Create a new topic branch (off the main project development branch) to contain your feature, change, or fix; `git checkout -b <topic-branch-name>`
4. Make your code changes, following the [Coding rules](#coding-rules)
5. Push your topic branch up to your fork; `git push origin <topic-branch-name>`
6. [Open a Pull Request](https://help.github.com/articles/creating-a-pull-request/#creating-the-pull-request) with a clear title and description.

**Tips**:

- Create your branch from `main`.
- Ensure your [git commit messages follow the required format](STYLE_GUIDES.md#git-commit-messages).
- Ensure your scripts are well-formed, well-documented and object-oriented.
- Ensure your scripts are stateless and can be reused by all.
- Update your branch, and resolve any conflicts, before making pull request.
- Fill in [the PR template](.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).
- Do not include issue numbers in the PR title.
- Include screenshots and animated GIFs in your pull request whenever possible.
- Follow the [style guide](STYLE_GUIDES.md) [applicable to the language](STYLE_GUIDES.md#languages) or task.
- Include thoughtfully-worded, well-structured tests/specs. See the [Tests/Specs Style Guide](STYLE_GUIDES.md#tests).
- Document new code based on the [Documentation Style Guide](STYLE_GUIDES.md#documentation).
- End all files with a newline.

---

## Coding rules <a id="coding-rules"></a>

- [Commit message guidelines](STYLE_GUIDES.md#git-commit-messages)
- [Documentation](STYLE_GUIDES.md#documentation)
- [Lint](STYLE_GUIDES.md#lint)
- [Source Code](STYLE_GUIDES.md#source-code)
- [Tests/Specs](STYLE_GUIDES.md#tests)

---

## Working with code <a id="working-with-code"></a>

- [Set up the workspace](#set-up-the-workspace)
- [Running tests](#run-tests)

### Set up the workspace <a id="set-up-the-workspace"></a>

#### Clone the repo into the current directory <a id="clone-repo"></a>

```sh
git clone git@github.com:seantrane/image-ruby-jekyll.git image-ruby-jekyll && cd image-ruby-jekyll
```

### Running tests <a id="run-tests"></a>

Use MegaLinter to scan repo. Build Docker image to test version installs and test Jekyll website(s) using image.

---

## Release Flow <a id="release-flow"></a>

```text
PR into main
  └── integration.yml triggers
        ├── parses RUBY_VERSION + JEKYLL_VERSION from Dockerfile ARGs
        ├── passes them as --build-args to Docker
        ├── builds image
        └── checks versions of ruby, jekyll, nodejs installed in image
```

```text
PR merged into main
  └── delivery.yml triggers
        ├── parses RUBY_VERSION + JEKYLL_VERSION from Dockerfile ARGs
        ├── checks if tag ruby-3.4.9_jekyll-4.4.1 already exists
        └── creates GitHub release → ruby-3.4.9_jekyll-4.4.1
              └── deployment.yml triggers
                    ├── parses versions back out of the tag (disabled)
                    ├── passes them as --build-args to Docker (disabled)
                    └── pushes image to ghcr.io/org/repo:ruby-3.4.9_jekyll-4.4.1
                                          ghcr.io/org/repo:latest
```

The _"skip if release already exists"_ guard in `delivery.yml` is important. Any push to main that isn't a version bump (e.g. a README fix) won't create a duplicate release or re-trigger the publish pipeline.

### Notes

- No secrets setup needed — `GITHUB_TOKEN` is provided automatically and the `packages: write` permission gives it access to GHCR.
- The `cache-from/cache-to: type=gha` lines use GitHub Actions cache to speed up repeat builds significantly, since the `ruby:3` base layer is large.
- The image will be published at `ghcr.io/<org-or-username>/<repo-name>` and will be private by default. You can make it public under the package settings on GitHub.
- The image tag will be auto-generated using Ruby/Jekyll versions from the Dockerfile: `ghcr.io/<org-or-username>/<repo>:ruby-3.4.9_jekyll-4.4.1`

---

## File Structure <a id="file-structure"></a>

```text
image-ruby-jekyll/
├─ .github/                                     * Repository configuration directory
│  ├─ ISSUE_TEMPLATE/                           * Templates available when creating an issue
│  │  ├─ issue_template.md                      * Default issue template
│  │  ├─ issue_form.yml                         * Default issue form
│  │  ├─ [name]_template.md                     * An issue template
│  │  ├─ [name]_form.yml                        * An issue form
│  │  :
│  │
│  ├─ linters/                                  * Directory for linter configuration files
│  │  ├─ .yaml-lint.yml                         * YAML-lint config
│  │  :
│  │
│  ├─ PULL_REQUEST_TEMPLATE/                    * Templates available when creating a pull request
│  │  ├─ pull_request_template.md               * Default pull request template
│  │  ├─ pull_request_form.yml                  * Default pull request form
│  │  ├─ [name]_template.md                     * A pull request template
│  │  ├─ [name]_form.yml                        * A pull request form
│  │  :
│  │
│  ├─ workflows/                                * Directory for GitHub Actions Workflows
│  │  ├─ [name]-v[version].yml                  * Reusable GitHub Actions Workflows
│  │  ├─ contribution.yml                       * Automated Contribution Workflow
│  │  ├─ delivery.yml                           * Continuous Delivery Workflow
│  │  ├─ deployment.yml                         * Continuous Deployment Workflow
│  │  ├─ integration.yml                        * Continuous Integration Workflow
│  │  ├─ maintenance.yml                        * Maintenance Workflow
│  │  :
│  │
|  ├─ dependabot.yml                            * Dependabot config
|  └─ labels.json                               * GitHub Labels config
│
├─ .dockerignore                                * Docker-ignore unnecessary/sensitive files, directories
├─ .editorconfig                                * keep developers/IDE's in sync
├─ .gitignore                                   * ignore files for git
├─ .markdownlint.json                           * Markdown-lint rules and config
├─ .mega-linter.yml                             * MegaLinter config
├─ .prettierrc                                  * JS/YAML Prettier config
├─ Dockerfile                                   * Docker config for Ruby-Jekyll
├─ CHANGELOG.md                                 * changelog autogenerated by `@semantic-release/changelog`
├─ CODE_OF_CONDUCT.md                           * Code of conduct policy
├─ CODEOWNERS                                   * default pull-request reviewers
├─ CONTRIBUTING.md                              * contributing guidelines
├─ README.md                                    * repository readme
└─ STYLE_GUIDES.md                              * Style guides, standards and practices
```

---

#### Happy coding!
