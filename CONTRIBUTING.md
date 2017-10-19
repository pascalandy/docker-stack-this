# Contributing to docker-stack-this

Please take a moment to review this document in order to make the contribution process easy and effective for everyone involved!Also make sure you read our [Code of Conduct](./CODE_OF_CONDUCT.md) that outlines our commitment towards an open and welcoming environment.

## Using the issue tracker

Use the issues tracker for:

* [bug reports](#bug-reports)
* [submitting pull requests](#pull-requests)

Development issues can be discussed on [twitter](https://twitter.com/askpascalandy).

We do our best to keep the issue tracker tidy and organized, making it useful for everyone. For example, we classify open issues per perceived difficulty, making it easier for developers to [contribute](#pull-requests).

## Bug reports

A bug is a _demonstrable problem_ that is caused by the code in the repository. Good bug reports are extremely helpful - thank you!

Guidelines for bug reports:

1. **Use the GitHub issue search** — check if the issue has already been
   reported.

2. **Check if the issue has been fixed** — try to reproduce it using the `master` branch in the repository.

3. **Isolate and report the problem** — ideally create a reduced test case.

Please try to be as detailed as possible in your report. Include information about your Operating System, Docker version, docker info, etc. Please provide steps to reproduce the issue as well as the outcome you were expecting! All these details will help developers to fix any potential bugs.

Example:

> Short and descriptive example bug report title
>
> A summary of the issue and the environment in which it occurs. If suitable,
> include the steps required to reproduce the bug.
>
> 1. This is the first step
> 2. This is the second step
> 3. Further steps, etc.
>
> Any other information you want to share that is relevant to the issue being
> reported. This might include the lines of code that you have identified as
> causing the bug, and potential solutions (and your opinions on their
> merits).

## Feature requests

Feature requests are welcome and should be discussed by creating an issue. In the title of your issue, include [FEAT] at the beginning of the title. It's up to *you* to make a strong case to convince the community of the merits of this feature. Please provide as much detail and context as possible.

## Contributing Documentation

Try to keep unnecessary details out of the first paragraph, it's only there to give a user a quick idea of what the documented "thing" does/is.

## Pull requests

Good pull requests - patches, improvements, new features are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

By submitting a patch, you agree that your work will be licensed under the [license](./LICENCE.md) used by the project.

If you have any large pull request in mind (e.g. implementing features, refactoring code, etc), **please ask first** via an issue otherwise you risk spending a lot of time working on something that the project's developers might not want to merge into the project.

Please adhere to the coding conventions in the project (indentation, accurate comments, etc.) and don't forget to add your own tests and documentation. When working with git, we recommend the following process in order to craft an excellent pull request:

**The process**:

1. [Fork](https://help.github.com/articles/fork-a-repo/) the project, clone your fork, and configure the remotes:

```
bash
# Clone your fork of the repo into the current directory
git clone https://github.com/<your-username>/docker-stack-this
# Navigate to the newly cloned directory
cd docker-stack-this
# Assign the original repo to a remote called "upstream"
git remote add upstream https://github.com/pascalandy/docker-stack-this
```

2. If you cloned a while ago, get the latest changes from upstream, and update your fork:

```
bash
git checkout master
git pull upstream master
git push
```

3. Create a new topic branch (off of `master`) to contain your feature, change, or fix.

**IMPORTANT**: Making changes in `master` is discouraged. You should always keep your local `master` in sync with upstream `master` and make your changes in topic branches.

```
bash
git checkout -b <topic-branch-name>
```

4. Commit your changes in logical chunks. Keep your commit messages organized, with a short description in the first line and more detailed information on the following lines. Feel free to use Git's [interactive rebase](https://help.github.com/articles/about-git-rebase/) feature to tidy up your commits before making them public.

5. Make sure all the tests are still passing by following your own documentation.

6. Push your topic branch up to your fork:

```
bash
git push origin <topic-branch-name>
```

7. [Open a Pull Request](https://help.github.com/articles/about-pull-requests/) with a clear title and description.

8. If you haven't updated your pull request for a while, you should consider rebasing on master and resolving any conflicts.

**IMPORTANT**: _Never ever_ merge upstream `master` into your branches. You should always `git rebase` on `master` to bring your changes up to date when necessary.

```bash
git checkout master
git pull upstream master
git checkout <your-topic-branch>
git rebase master
```

Thank you for your contributions!