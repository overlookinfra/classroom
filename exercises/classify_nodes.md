# Classifying nodes

Classification is how we tell OpenVox which role classes are assigned
to which nodes in our infrastructure. The role class is named for the
business need rather than the technology stack, which allows us
implementation flexibility in the future.

In other words, we'll create a role class named `role::website` and
classify our nodes. This conveys the intent of our business requirements
and makes it easier to change the backed implementation later if needed.

## Exercise

1. Find the `role::website` class manifest and ensure that it includes `profile::apache`.
    * `/code/environments/production/site/role/manifests/website.pp`
2. Edit the site manifest and add `include role::website` to the `default` node declaration.
    * `/code/environments/production/manifests/site.pp`
3. Run OpenVox on each node
    * `bin/alma puppet agent -t`
    * `bin/ubuntu puppet agent -t`
4. Validate that the server is running.
    * `bin/alma curl http://localhost`
    * `bin/alma curl -k https://localhost`
    * `bin/ubuntu curl http://localhost`
    * `bin/ubuntu curl -k https://localhost`

> [!TIP]
> Notice that the output may not be exactly what you expected! We will get to that very soon.
