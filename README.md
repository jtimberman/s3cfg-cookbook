# s3cfg Cookbook

This cookbook provides a resource, `s3cfg` that can be used to manage
`.s3cfg` configuration files for s3cmd.

http://s3tools.org/

## Requirements

## Attributes

* `node['s3cfg']['config']` - hash of s3cfg configuration options and
  their values.

## Resource: s3cfg

The `s3cfg` resource can be used to render a `.s3cfg` config file in
the specified location.

### Actions

The allowed actions are passed to a `template` resource rendered at
the path specified by the name or path attribute.

* `:create` - Default
* `:delete`
* `:create_if_missing`

### Attributes

* `path` - path to the s3cfg file to render
* `access_key` - AWS access key id
* `secret_key` - AWS secret access key
* `host_bucket` - Override the default bucket name. Should be the full
  FQDN, e.g., `mybucket.s3.amazonaws.com`.
* `install_s3cmd` - Whether the `s3cmd` package should be installed.
  The default package manager must be able to install a package named `s3cmd`.
* `backup` - passed to the `backup` attribute of the template, default `5`
* `group` - passed to the `group` attribute of the template, default
  `nil` (group will be the group of the user running Chef)
* `mode` - passed to the `mode` attribute of the template, default
  `00600` (read only by owner)
* `owner` - passed to the `owner` attribute of the template, default
  `nil` (owner will be the user running Chef)
* `cookbook` - passed to the `cookbook` attribute of the template,
  default `s3cfg`
* `source` - passed to the `source` attribute of the template, default `s3cfg.erb`
* `config` - Hash of configuration overrides that will be merged with
  the `node['s3cfg']['config']` attributes to dynamically render in
  `s3cfg.erb`. Note that `access_key`, `secret_key` and `host_bucket`
  are added to this.

## Usage

Use the resource in your *own* cookbooks' recipes where applicable. Be
sure to set a dependency in your cookbook on this cookbook, in the
metadata e.g.:

```ruby
depends "s3cfg"
```

If you're using chef-vault for storing AWS secrets (see example
below), also depend on it:

```ruby
depends "chef-vault"
```

To render a config file for the root user, but don't install s3cmd:

```ruby
s3cfg "/root/.s3cfg" do
  access_key "Don't put secrets in recipes..."
  secret_key "Use chef-vault for that instead."
  install_s3cmd false
end
```

To use chef-vault to load an AWS item, and ensure that the s3cmd
package is installed:

```ruby
include_recipe "chef-vault"
aws_creds = chef_vault_item("vault", "aws-credentials")["data"]
s3cfg "/root/.s3cfg" do
  access_key aws_creds['aws_access_key_id']
  secret_key aws_creds['aws_secret_access_key']
end
```

## License and Authors

Authors: Joshua Timberman <joshua@opscode.com>

Copyright (c) 2013, Opscode, Inc. <legal@opscode.com>
License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
