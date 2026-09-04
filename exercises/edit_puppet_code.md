# Edit Puppet code

The Puppet language is quite readable and even newcomers can read and make minor
edits. This allows practitioners to maintain role and profile classes without
necessarily becoming OpenVox experts.


## Exercises

You may have noticed funny log messages that clearly indicate that a string is
not being interpolated properly. We'll fix that and then we'll add a conditional
to the profile we're working on.

1. Edit the site manifest
    * `/code/environments/production/manifests/site.pp`
2. Find the single quoted string in the notify resource title and correct it
   so that the strings are interpolated properly.
3. Add a new class parameter to enable SSL conditionally.
    * Edit `/code/environments/production/site/profile/manifests/apache.pp`
    * Add `Boolean $ssl = false` to the class parameters list.
    * Wrap the SSL enabled vhost resource in an `if $ssl { ... }` conditional block.
4. Enforce the configuration and observe the vhost configuration being removed.
    * `bin/alma puppet agent -t`
    * `bin/ubuntu puppet agent -t`
5. Add a new parameter to one or more Hiera data files to re-enable the vhost on a node.
    * `profile::apache:ssl true`
