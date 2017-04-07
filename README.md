# Chef-Hometasks (Task 2)
---
## Java:
Default cookbook

## Jboss:
Custom cookbook

## Runlist.json
```json
{
"run_list": ["recipe[jboss::default]", "recipe[firewall::default]"],
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
```bash
[root@epplkraw0381t1 cookbooks]$ curl 127.0.0.1:8080/testweb/ 
<html>
<body>
<h2>Welcome to Test Web Application !!!!!!!!!!!  </h2>
</body>
</html>
```
