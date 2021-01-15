# Git Hooks

Git hooks, the `pre-push` hook in particular, should be thought of as
a local, mini-CI. By placing hooks in the `.git/hooks/` folder in a repository,
we can ensure Soluble is run prior to pushing our changes upstream.

As Soluble will also be run by the CI system, this gives us an opportunity
to identify and fix issues without having to wait for a full CI run.

These hooks are only examples, and it is expected that you will modify them
(or integrate their contents into CI).

## App

App git hooks are for source code repositories.

To install, copy or symlink the hooks from [app/](./app/) to your local repo's `.git/hooks/`
folder.

Ex:

```sh
ln -s ${PWD}/app/pre-push /path/to/application/source/repo/.git/hooks/
```

## IaC

IaC git hooks are for Infrastructure as Code repositories, like terraform,
kubernetes, etc.

To install, copy or symlink the hooks from [iac/](./iac/) to your local repo's `.git/hooks/`
folder.

Ex:

```sh
ln -s ${PWD}/iac/pre-push /path/to/application/source/repo/.git/hooks/
```
