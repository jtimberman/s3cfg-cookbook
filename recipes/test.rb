#
# Author:: Joshua Timberman <joshua@opscode.com>
# Copyright (c) 2013, Opscode, Inc. <legal@opscode.com>
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This is a test recipe. Don't use it on a real node.
return unless node['s3cfg']['test_allowed']

s3cfg "/tmp/s3cfg-#{cookbook_name}-#{recipe_name}" do
  access_key "Don't put secrets in recipes..."
  secret_key "Use chef-vault for that instead."
  install_s3cmd false
end
