Chef Consul
==========
[![Gem Version](http://img.shields.io/gem/v/chef-consul.svg?style=flat-square)][gem]
[![Build Status](http://img.shields.io/travis/samdunne/chef-consul.svg?style=flat-square)][travis]

[gem]: https://rubygems.org/gems/chef-consul
[travis]: http://travis-ci.org/samdunne/chef-consul

Chef Consul is a Gem & Chef Recipe that includes extensions to chefs node object that allows easy interaction with consul leveraging [Diplomat](https://github.com/WeAreFarmGeek/diplomat).


Installation
------------
If you want to develop/hack on chef-consul, please see the CONTRIBUTING.md.

If you are using Berkshelf, add `chef-consul` to your `Berksfile`:

```ruby
cookbook 'chef-consul'
```

Otherwise, you can use `knife` or download the tarball directly from the community site:

```ruby
knife cookbook site install chef-consul
```


Usage
-----
In order to use Chef Consul in your Chef Recipes, you'll first need to include it:

```ruby
include_recipe 'chef-consul::default'
```

Alternatively you can put it in a base role or recipe and it will be included subsequently.

Requiring the Chef Consul Gem will automatically extend the node object with consul methods.


API
---
**Note:** For the most extensive API documentation, please see the YARD documentation.

### Node

Additional methods for the `node` object

- `first_service(name)` - fetch the first node in a service.
- `all_services(name)` - fetch all nodes in a service.
- `get_consul_key(key, recursive = false)` - return the value of a key in consul.
- `put_consul_key(key, value)` - write a value to a key in consul

#### Examples
```ruby
services = node.all_services('consul')
# => [#<OpenStruct Node="consul0", Address="1.2.3.4", ServiceID="consul", ServiceName="consul", ServiceTags=["consul"], ServicePort=8300>,#<OpenStruct Node="consul1", Address="1.2.3.5", ServiceID="consul", ServiceName="consul", ServiceTags=["consul"], ServicePort=8300>]
```

```ruby
node.put_consul_key('test', 'value')
# => "value"
```


License & Authors
-----------------
- Author: Sam Dunne (sam@sam-dunne.com)

```text
Copyright 2015 Sam Dunne

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
