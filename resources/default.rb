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
actions :create, :delete, :create_if_missing
default_action :create

attribute :path, :name_attribute => true
attribute :access_key, :kind_of => String, :default => nil, :required => true
attribute :backup, :kind_of => [String, Fixnum], :default => 5
attribute :config, :kind_of => Hash, :default => {}
attribute :cookbook, :kind_of => String, :default => "s3cfg"
attribute :group, :kind_of => String, :default => nil
attribute :host_bucket, :kind_of => String, :default => "%(bucket)s.s3.amazonaws.com"
attribute :install_s3cmd, :kind_of => [FalseClass, TrueClass, NilClass], :default => true
attribute :mode, :kind_of => [String, Fixnum], :default => 00600
attribute :owner, :kind_of => String, :default => nil
attribute :secret_key, :kind_of => String, :default => nil, :required => true
attribute :source, :kind_of => String, :default => "s3cfg.erb"
attribute :variables, :kind_of => Hash, :default => {}
