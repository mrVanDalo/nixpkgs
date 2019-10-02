---
title: Pull requests workflow
author: Ingolf Wagner
date: 2018-10-01
---

# Pull request workflow

The following sections describes the workflow of creating pull-request to the point of merging.

## Roles

Everybody involved in the process of contributing has one or multiple
of the following roles

* *Contributor* is the person proposing the pull request
* *Bot* is a bot that provides automated feedback
* *Reviewer* is any person that reviews the pull request
  (for example a member of [NixOS/nixpkgs-maintainers](https://github.com/orgs/NixOS/teams/nixpkgs-maintainers))
* *Merger* is any person with merge privileges

## States of a pull request

This diagram defines all states of a pull request,
and their transitions to other states.

![pull-request state](./images/submitting-changes/pull-request-states.svg){width=100% class=big-image}

## Responsibilities and Actions

The responsibilities of every role is defined by the following diagram:

![pull-request roles](./images/submitting-changes/pull-request-roles.svg){width=100% class=big-image"}

## About pull requests

### Packages

* Contributors **SHOULD** evaluate and signal that a backport is necessary.
* The [NixOS/backports team](https://github.com/orgs/NixOS/teams/backports)
  **SHOULD** be pinged in situations that are unclear.
* Backport pull requests **MUST** be linked to the original pull requests (using `git cherry-pick -x`).
* [NixOS/nixpkgs-maintainers](https://github.com/orgs/NixOS/teams/nixpkgs-maintainers)
  and 
  [NixOS/backports](https://github.com/orgs/NixOS/teams/backports)
  can deny the backport.
* After the pull request to `master`, `staging` or `staging-next` is merged,
  the backport pull request is created

### Modules

* Modules **SHOULD** have tests
* Reviewers **SHOULD** encourage contributors to write tests for new modules
* Module changes **SHOULD NOT** be backported.
  * For example a module change that's needed due to a package backport is a valid exception

## What to backport

* Security patches which aren't major updates
* If a security patch is a major upgrade, try and find patches to our
  current version which accomplish the same goal. Apply the major
  update to master, and the patches to stable.
* Bug fixes to applications which, again, aren't major updates.
  Generally be cautious about these.
* Any updates when the current stable version is utterly broken. A
  key example of this is Spotify, who regularly breaks their old
  versions.
* Extremely security-sensitive software, in particular Chrome,
  Chromium, Firefox, Thunderbird, and of course the kernel.
