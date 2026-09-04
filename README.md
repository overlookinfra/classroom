# OpenVox Essentials Training Classroom

This is a self contained classroom environment, containing a few helper scripts
and a control repository codebase of Puppet code. Each spawned codespace runs containers
that serve the roles of an OpenVox infrastructure.

| Container        | What it is                                  |
| ---------------- | ------------------------------------------- |
| `openvox-server` | OpenVox server and CA, `server.example.com` |
| `agent-alma`     | AlmaLinux 10 target, `alma.example.com`     |
| `agent-ubuntu`   | Ubuntu 26.04 target, `ubuntu.example.com`   |

## Starting the Environment

> [!IMPORTANT]
> This environment requires an active GitHub account. If needed, create a free
> account using the `Sign up` button in the top right and then return to this repository.

1. Open <https://github.com/overlookinfra/classroom> on GitHub.
2. Click the green **Code** button, then the **Codespaces** tab.
3. Click the green button or the plus icon to create a codespace on `main`.
4. It will ask you to confirm trust. Click ***Trust Folder & Continue***.

The codespace builds itself and starts the lab. Note that the VS Code window
opens and will likely a terminal before it is actually done setting everything
up. Just give it time to finish.

Eventually, it will show a terminal while it runs the `postCreateCommand`. Wait
for this to finish before checking the status of the lab with `bin/status` in
the terminal window. This may take several minutes.

### Running Commands

```sh
bin/alma puppet agent -t                # run the agent on the Alma node
bin/alma {command}                      # run a command on the Alma node
bin/alma                                # shell into the AlmaLinux target

bin/ubuntu puppet agent -t              # run the agent on the Ubuntu node
bin/ubuntu {command}                    # run a command on the Ubuntu node
bin/ubuntu                              # shell into the Ubuntu target

bin/status                              # container statuses, CA, agent certs
bin/deploy                              # deploy modules from the Forge to the classroom infrastructure

# Not commonly used
bin/server puppetserver ca list --all   # list certificates on the server
bin/server {command}                    # run a command on the server node
bin/server                              # shell into the server
bin/server --root                       # shell into the server as root, for installing tools

bin/agent-regen {node}                  # revoke and regenerate the agent's cert
```

## Exercises

Exercises to go along with the OpenVox Essentials training are contained in the
[/exercises](exercises) folder. Please note that these exercises were designed to
be completed in a very short timeframe, so they're quite simple. You're not restricted
to only these exercises. Please feel free to explore and experiment as you see fit.

> [!IMPORTANT]
> If you find the editor not behaving as you'd expect, try turning off ad blockers and try again.

* [Explore the resource abstraction layer](exercises/explore_ral.md)
* [Find modules on the Forge](exercises/find_modules.md)
* [Designing a profile class](exercises/design_profile.md)
* [Classifying nodes](exercises/classify_nodes.md)
* [Profile Parameters in Hiera](exercises/profile_parameters_hiera.md)
* [Edit Puppet code](exercises/edit_puppet_code.md)
* [Manipulating information](exercises/manipulate_info.md)


## Saving Progress

Codespaces work by starting an environment made up of ephemeral nodes running in the cloud
and then cloning this repository onto the running node. This means that any code changes will
be lost when the environment is deleted unless you save them to their own repository.

1. In the Activity Bar to the left, click the **Source Control** view.
1. Use the ➕ icons to add everything you want to save to the changeset.
1. Type a commit message and then click **Commit**.
    * Note that this only commits to the local git repository. It's still only ephemeral.
1. Now save it to a repository in your own github namespace with the **Publish Branch** button.
    * Type a name for your new repository and select either the `public` or `private` option.

See https://docs.github.com/en/codespaces/quickstart#committing-and-pushing-your-changes
for more detailed information.

Now you own this Codespace and can run it and experiment at any time. Being container-based,
we do not guarantee that it will always behave exactly like real nodes, but it should be
reasonably close. At the time of writing, GitHub includes 120 monthly hours of Codespace
runtime with the free tier.
