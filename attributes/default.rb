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

# These attributes are passed into the s3cfg resource which are
# rendered in the s3cfg.erb template.
default['s3cfg']['config'] = {
  "access_key" => "",
  "acl_public" => "False",
  "bucket_location" => "US",
  "cloudfront_host" => "cloudfront.amazonaws.com",
  "cloudfront_resource" => "/2010-07-15/distribution",
  "default_mime_type" => "binary/octet-stream",
  "delete_removed" => "False",
  "dry_run" => "False",
  "encoding" => "UTF-8",
  "encrypt" => "False",
  "force" => "False",
  "get_continue" => "False",
  "gpg_command" => "/usr/bin/gpg",
  "gpg_decrypt" => "%(gpg_command)s -d --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s",
  "gpg_encrypt" => "%(gpg_command)s -c --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s",
  "gpg_passphrase" => "",
  "guess_mime_type" => "True",
  "host_base" => "s3.amazonaws.com",
  "host_bucket" => "%(bucket)s.s3.amazonaws.com",
  "human_readable_sizes" => "False",
  "list_md5" => "False",
  "preserve_attrs" => "True",
  "progress_meter" => "True",
  "proxy_host" => "",
  "proxy_port" => "0",
  "recursive" => "False",
  "recv_chunk" => "4096",
  "secret_key" => "",
  "send_chunk" => "4096",
  "simpledb_host" => "sdb.amazonaws.com",
  "skip_existing" => "False",
  "urlencoding_mode" => "normal",
  "use_https" => "True",
  "verbosity" => "WARNING"
}
