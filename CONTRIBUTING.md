# Contributing to OpenMoji Jekyll Plugin

Welcome! Azadeh Afzar - OpenMoji Jekyll Plugin (AA-OMJP) is a hobby project that
aims to implement a wide range of cryptography and cryptanalysis algorithms.
If you're trying AA-OMJP, your experience and what you can contribute are important to
the project's success.


## Getting started, building, and testing

If you haven't already, take a look at the project's [README.md file](README.md).

### Git repository 

All project's development and discussion takes place on  [GitLab][gitlab repo],
there is also a mirror on [GitHub][github repo].

For contributing to this project, first login into your GitLab account and fork this
repository. After forking this repo, clone it into your local machine and create a 
new branch from `master` branch with a descriptive name that describes your new feature
or `fix #issue-code` when you are fixing an issue. This part is important!
we do not accept MRs from master branch.

After doing your changes, commit and push your new branch to your forked repository on
GitLab and then ask for a Merge Request to `master` branch of this repository.

### Environment and dependency


[gitlab repo]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin
[github repo]: https://github.com/azadeh-afzar/OpenMoji-Jekyll-Plugin

## Discussion

If you've run into behavior in OpenMoji Jekyll Plugin you don't understand,
or you're having trouble working out a good way to apply it to your code, or
you've found a bug or would like a feature it doesn't have, we want to hear from you!

Our main forum for discussion is the project's [GitLab issue tracker][gitlab issue].
This is the right place to start a discussion of any of the above or most any other
topic concerning the project.

### Code of Conduct

Everyone participating in the AA-OMJP community, and in particular
in our issue tracker, pull requests, and IRC channel, is expected to treat
other people with respect and more generally to follow the guidelines
articulated in the [OpenMoji Jekyll Plugin Code of Conduct](CODE_OF_CONDUCT.md).

[gitlab issue]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/issues

## First Time Contributors

OpenMoji Jekyll Plugin appreciates your contribution! If you are interested in 
helping improve AA-OMJP, there are several ways to get started:

* Find bugs and open issues on GitLab! this is almost one of the best ways to contribute.
* Work on [documentation issues][project documentation].
* Write tests for existing modules.
* Add new cryptography or cryptanalysis algorithms to the project.

[project documentation]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/labels/documentation

## Submitting Changes

Even more excellent than a good bug report is a fix for a bug, or the
implementation of a much-needed new feature. (*)  We'd love to have
your contributions.

(*) If your new feature will be a lot of work, we recommend talking to
    us early -- see below.

We use the usual [GitLab merge-request flow][gitlab flow],
which may be familiar to you if you've contributed to other projects on GitLab.

Anyone interested in OpenMoji Jekyll Plugin may review your code. 
One of the AA-OMJP core developers will merge your 
merge request when they think it's ready.
For every merge request, we aim to promptly either merge it or say why
it's not yet ready; if you go a few days without a reply, please feel
free to ping the thread by adding a new comment.

For a list of AA-OMJP core developers, see the file [CREDITS](CREDITS).

[gitlab flow]: https://docs.gitlab.com/ee/user/project/merge_requests

## Preparing Changes

Before you begin: if your change will be a significant amount of work
to write, we highly recommend starting by opening an issue laying out
what you want to do.  That lets a conversation happen early in case
other contributors disagree with what you'd like to do or have ideas
that will help you do it.

The best pull requests are focused, clearly describe what they're for
and why they're correct, and contain tests for whatever changes they
make to the code's behavior.  As a bonus these are easiest for someone
to review, which helps your merge request get merged quickly!  Standard
advice about good merge requests for open-source projects applies; we
have [our own writeup][good merge request]
of this advice. (adapted from mypy guidelines)

See also our [coding conventions][code conventions] -- which consist mainly of a 
reference to [PEP 8](https://www.python.org/dev/peps/pep-0008/) -- for the code you
put in the merge request.

Also, do not squash your commits after you have submitted a merge request, as this
erases context during review. We will squash commits when the merge request is merged.

You may also find other pages in the [AA-OMJP wiki][wiki]
helpful in developing your change.

[goode merge request]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/wikis/Good-Merge-Request
[code conventions]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/wikis/Code-Conventions
[wiki]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/wikis

# Core developer guidelines

Core developers should follow these rules when processing merge requests:

* Always wait for tests to pass before merging MRs.
* Use "[Squash and merge](https://gitlab.com/blog/2141-squash-your-commits)"
  to merge MRs.
* Delete branches for merged MRs (by core devs pushing to the main repo).
* Edit the final commit message before merging to conform to the following
  style (we wish to have a clean `git log` output):
  * all commit messages should start with one of these keywords in the subject:
    - init: for initial commits.
    - add: for adding new feature.
    - fix: for fixing an issue.
    - modify: for changing existing code for optimization/readability etc.
    - update: for changing doc files or comments.
    - remove: for deleting code or file.
    - build: for updating MakeFiles, etc for build process.
    - style: for fixing indentation or line breaks, etc.
    - document: for adding new documentation.
    - version: for releasing version tags.
    - ci: for DevOps jobs, like editing `.travis.yml` file.
    - [skip ci]: use this keyword when you change docs to avoid running CI/CD jobs.
  
  * When merging a multi-commit MR make sure that the commit message doesn't
    contain the local history from the committer and the review history from
    the MR. Edit the message to only describe the end state of the MR.
  * Make sure there is a *single* newline at the end of the commit message.
    This way there is a single empty line between commits in `git log`
    output.
  * Split lines as needed so that the maximum line length of the commit
    message is under 80 characters, including the subject line.
  * Do not capitalize the subject and each paragraph.
  * Make sure that the subject of the commit message has no trailing dot.
  * If the MR fixes an issue, make sure something like "issue #xxx." occurs
    in the body of the message and not in the subject (e.g. `fix: issue #32`).
  * Use Markdown for formatting.


## Issue-tracker conventions

We aim to reply to all new issues promptly.  We'll assign a milestone
to help us track which issues we intend to get to when, and may apply
labels to carry some other information.  Here's what our milestones
and labels mean.

### Task priority and sizing

We use GitLab "labels" ([see our list][labels])
to roughly order what we want to do soon and less soon.  There's two dimensions
taken into account: **priority** (does it matter to our users) and **size** (how
long will it take to complete).

Bugs that aren't a huge deal but do matter to users and don't seem
like a lot of work to fix generally will be dealt with sooner; things
that will take longer may go further out.

We are trying to keep the backlog at a manageable size, an issue that is
unlikely to be acted upon in foreseeable future is going to be
respectfully closed.  This doesn't mean the issue is not important, but
rather reflects the limits of the team.

The **question** label is for issue threads where a user is asking a
question but it isn't yet clear that it represents something to actually
change.  We use the issue tracker as the preferred venue for such
questions, even when they aren't literally issues, to keep down the
number of distinct discussion venues anyone needs to track.  These might
evolve into a bug or feature request.

Issues **without a priority or size** haven't been triaged.  We aim to
triage all new issues promptly, but there are some issues from previous
years that we haven't yet re-reviewed since adopting these conventions.

### Other labels

* **discussion**: This issue needs agreement on some kind of
  design before it makes sense to implement it, and it either doesn't
  yet have a design or doesn't yet have agreement on one.
* **feature**, **bug**, **crash**, **refactoring**, **documentation**:
  These classify the user-facing impact of the change.  Specifically
  "refactoring" means there should be no user-facing effect.
  
[labels]: https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/labels