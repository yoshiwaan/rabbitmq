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

require File.expand_path('../support/helpers', __FILE__)

describe 'rabbitmq_test::cook-openfiles' do
  include Helpers::RabbitMQ

  it 'properly sets open_file_limit' do
    if node['rabbitmq']['open_file_limit']
      command("grep 'Max open files' /proc/$(sudo pgrep -u rabbitmq beam)/limits | awk '{print $5}'").stdout.chomp == "#{node['rabbitmq']['open_file_limit']}"
    end
  end
end
