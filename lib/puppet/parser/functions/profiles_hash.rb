module Puppet::Parser::Functions
  newfunction(:profiles_hash, :type => :rvalue) do |args|
    hash = args[0]
    profiles = {}
    hash.each { |name, params| 
      profiles[name] = {
        :params => params,
      }
    }
    profiles
  end
end
