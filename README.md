# Chef-Hometasks (Task 1)
---
## Default:
Cookbook:: chef_nginx
Attributes:: default

## Default2:
Cookbook:: firewall
Recipe:: default

## Default3:
default['firewall']['allow_ssh'] = true
default['firewall']['allow_winrm'] = false
default['firewall']['allow_mosh'] = false

## Runlist.json
```json
{
"run_list": ["recipe[chef_nginx::default]", "recipe[iptables::default]", "recipe[firewall::default]"],
"nginx": {"default_root":"/usr/share/nginx/html"}
} 
```

## Solo.rb
```ruby
log_level :debug
file_cache_path "/root/.chef/"
cookbook_path "/root/cookbooks"
json_attribs "/root/.chef/runlist.json"
```
## Report.txt
