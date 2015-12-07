module Hadouken
  module Helpers
    module Common
      def hadouken_config
        node['hadouken']['config']
      end

      def hadouken_user
        node['hadouken']['user']
      end

      def hadouken_version
        node['hadouken']['version']
      end

      def hadouken_package
        "hadouken-#{hadouken_version}-amd64.deb"
      end

      def hadouken_home
        node['hadouken']['home']
      end

      def hadouken_save_path
        node['hadouken']['settings']['bittorrent']['defaultSavePath']
      end

      def hadouken_state_path
        node['hadouken']['settings']['bittorrent']['statePath']
      end
    end
  end
end

Chef::Recipe.send(:include, Hadouken::Helpers::Common)

# This might be a little to broad of a stroke
Chef::Resource.send(:include, Hadouken::Helpers::Common)
