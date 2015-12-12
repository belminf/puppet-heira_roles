# Glues Hiera data to actual resources

class hiera_roles(
    $user_group_resource,
    $user_access_resource,
    $profile_resource,
    $firewall_hole_resource,
    $file_acl_resource,
    $user_groups_hiera_key='user_groups',
    $profiles_hiera_key='profiles',
    $firewall_holes_key='firewall_holes',
    $file_acls_key='file_acls',
) {

    # Hiera hash for user groups
    $user_groups_hash = hiera_hash($user_groups_hiera_key)

    # Create user group resources
    ensure_resource($user_group_resource, keys($user_groups_hash))

    # Create user access resources
    create_resources($user_access_resource, user_access_hash($user_groups_hash))

    # Create profiles
    $profiles = hiera($profiles_hiera_key)
    create_resources($profile_resource, profiles_hash($profiles))

    # Create firewall holes
    $firewall_holes = hiera($firewall_holes_key)
    create_resources($firewall_hole_resource, $firewall_holes)

    # Create file ACLs
    $file_acls = hiera($file_acls_key)
    create_resources($file_acl_resource, $file_acls)
}
