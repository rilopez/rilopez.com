--- 
date: 2021-05-04T23:17:52-05:00
title: "Bazel Docker Install Sqlite"
tags: ["TIL", "bazel"]
---


Some time ago the bazel docker rules did not allow the use of `RUN` because of two main reasons:

1. Virtually everything folks do in RUN isn't reproducible.
2. The way the Docker daemon evaluates RUN is never reproducible.

Fortunately that changed, now they provide rules not only to `RUN` (and create commits/layers) but 
also specific rules to download & install system packages.


Here an example on how to install sqlite into a ubuntu base image

```python
download_pkgs(
    name = "sqlite_pkgs",
    image_tar = "@ubuntu1604//image",
    packages = [
        "libsqlite3-dev",
        "sqlite3",
    ],
)

install_pkgs(
    name = "sqlite_pkgs_image",
    image_tar = "@ubuntu1604//image",
    installables_tar = ":sqlite_pkgs.tar",
    installation_cleanup_commands = "rm -rf /var/lib/apt/lists/*",
    output_image_name = "sqlite_pkgs_image",
)
```


more examples:

- [apt packages](https://github.com/bazelbuild/rules_docker/blob/master/testing/examples/run_instruction_apt_pkgs/BUILD)
- [run arbitrary instructions](https://github.com/bazelbuild/rules_docker/blob/master/testing/examples/run_instruction_arbitrary/BUILD)

 