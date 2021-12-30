# Nix image for Bitbucket Pipelines

For some weird reason, Bitbucket Pipelines runs various commands using absolute paths
in its setup script which results in errors like these:

```shell
/bin/sh: /usr/bin/mkfifo: No such file or directory
/bin/sh: /bin/echo: No such file or directory
```

Needless to say that doesn't work with Nix.

This image works around the problem by symlinking the necessary binaries to the paths Bitbucket uses.

In addition, it also installs `git` as it's usually required for all kinds of stuff (eg. Flakes).

Last, but not least Flakes are enabled by default.


## Usage

```yaml
pipelines:
    branches:
        master:
            - step:
                image: ghcr.io/sagikazarmark/nix-bitbucket
                name: Tests
                script:
                    - nix-channel --update
                    - nix develop -c YOUR_TEST_COMMAND
```

**Pro tip:** Use a [tagged version](https://github.com/users/sagikazarmark/packages/container/nix-bitbucket/versions) instead of `latest`.


## License

The project is licensed under the [MIT License](LICENSE).
