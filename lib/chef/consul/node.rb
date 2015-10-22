#
# Copyright 2015, Sam Dunne <sam@sam-dunne.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Node
    require 'diplomat'

    class AttributeDoesNotExistError < StandardError
      def initialize(keys, key)
        hash = keys.map { |key| "['#{key}']" }

        super <<-EOH
No attribute `node#{hash.join}' exists on
the current node. Specifically the `#{key}' attribute is not
defined. Please make sure you have spelled everything correctly.
EOH
      end
    end

    def first_service(name)
      ::Diplomat::Service.get(name)
    end

    def all_services(name)
      ::Diplomat::Service.get(name, :all)
    end

    def get_consul_key(key, recursive = false)
      ::Diplomat::Kv.get(key, recurse: recursive)
    end

    def put_consul_key(key, value)
      ::Diplomat::Kv.put(key, value)
    end
  end
end
