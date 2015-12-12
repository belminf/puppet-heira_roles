hiera_roles
====
Manage server roles via hiera.

Requires [puppetlabs/puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib).

Basic role constructs:

- profiles
- user groups
- permissions
- firewall

hiera_roles parameters:
=====
`$user_group_resource` - resource to instantiate groups. `$title` will be the group name.
`$user_access_resource` - resource to grant access to a group. `$group` will be the group name and `$access` will be the access listed in hiera.
`$profile_resource` - resource to add a profile to the role. `$name` of profile is passed along with `$parameters` if any are included in hiera.
`$firewall_hole_resource` - 
`$file_acls_resource` - 
