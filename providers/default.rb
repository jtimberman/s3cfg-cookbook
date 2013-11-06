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
# We should be on Chef 11, but in case we're not, dragons may lie in
# wait to devour our flock of resources below.
use_inline_resources if defined?(:use_inline_resources)

action :delete do
  file new_resource.path do
    action :delete
  end
end

action :create_if_missing do
  render_s3cfg_template(:create_if_missing)
end

action :create do
  package 's3cmd' if new_resource.install_s3cmd
  render_s3cfg_template(:create)
end

def render_s3cfg_template(_action)
  template "s3cfg-#{new_resource.name}" do
    path new_resource.path
    source new_resource.source
    cookbook new_resource.cookbook
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    action _action
    variables :config_options => config_options
  end
end

def config_options
  new_resource.config['access_key'] = new_resource.access_key
  new_resource.config['secret_key'] = new_resource.secret_key
  new_resource.config['host_bucket'] = new_resource.host_bucket
  node['s3cfg']['config'].to_hash.merge!(new_resource.config)
end
