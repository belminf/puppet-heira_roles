module Puppet::Parser::Functions
  newfunction(:user_access_hash, :type => :rvalue) do |args|
    hash = args[0]
    resources = {}
    hash.each { |group, access_list| 
      access_list.each { | access |
        resources["#{group}-#{access}"] = {
          :group => group,
          :access => access,
        }
      }
    }
    resources
  end
end
