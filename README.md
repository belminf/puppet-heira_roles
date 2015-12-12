hiera_roles
====
Uses hiera to define basic server role constructs:

- profiles
- user groups
- user permissions
- firewall
- file ACLs

Requires [puppetlabs/puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib).

Parameters:
=====
Required
-------
* `user_group_resource` - instantiate groups. `$title` will be the group name.
* `user_access_resource` - grant access to a group. `$title` will be "${group}-${access}", `$group` will be the group name and `$access` will be the access listed
* `profile_resource` - add a profile to the role. `$name` of profile is passed along with `$parameters` if any are included in hiera.
* `firewall_hole_resource` - add a firewall hole. `$name` will be the key while the hash will be passed as parameters.
* `file_acl_resource` - add file ACLs. `$name` will be the key while the hash will be passed as parameters.

Optional
--------
These are keys for Hiera data:

* `user_groups_hiera_key` (default: `user_groups`)
* `profiles_hiera_key` (default: `profiles`)
* `firewall_holes_key` (default `firewall_holes`)
* `file_acls_key` (default: `file_acls`)

Example usage
======

Puppet class:
------------
    class { 'hiera_roles':
        user_group_resource    => 'my_org::user_group',
        user_access_resource   => 'my_org::user_access',
        profile_resource       => 'my_org::profile',
        firewall_hole_resource => 'my_org::firewall_hole',
        file_acl_resource      => 'my_org::file_acl',
    }

YAML Hiera source:
-----
    user_groups:
      ops:
        - power_management
        - apache_control
      dev:
        - power_management
      accounting: []
    profiles:
      apache_server: {}
      roobis_app:
        url: roobis-dev.example.com
        path: /var/www/roobis
    firewall_holes:
      "roobis debug":
        port: 808
        protocol: tcp
        protocol: udp
    file_acls:
      "dev - full roobis config":
        group: dev
        path: /etc/roobis
        permission: rwX
      "accounting - read roobis config":
        group: accounting
        path: /etc/roobis
        permission: rX
