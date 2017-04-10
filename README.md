# Chef-Hometasks (Task 3)
---
## Appserver
```json
chef_type:           role
default_attributes:
description:         The AppServer role
env_run_lists:
json_class:          Chef::Role
name:                Appserver
override_attributes:
run_list:            recipe[ my_jboss ]

```

## Chev-dev
```json
chef_type:           environment
cookbook_versions:
default_attributes:
description:         EPAM Dev Ops Lab 2017 development environment.
json_class:          Chef::Environment
name:                Chef-dev
override_attributes:
  jboss7:
    app_url: http://www.cumulogic.com/download/Apps/hudson.zip 
```
## Knife.rb
```ruby
log_level                :info
log_location             STDOUT
node_name                'heorhivysotski'
client_key               '/home/student/.chef/heorhivysotski.pem'
#validation_client_name   'lab'
validation_key           '/home/student/none'
chef_server_url          'https://node-server/organizations/dolab'
syntax_check_cache_path  '/root/.chef/syntax_check_cache'
cookbook_path '/tmp/chef/cookbooks'
ssl_verify_mode :verify_none
#verify_api_cert :false
#ssl_verify_mode :verify_none
```
## Check (curl)
```bash
[root@node-one vagrant]# curl -IL 127.0.0.1:8080/hudson/
HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
X-Hudson: 2.0.0
X-Hudson-CLI-Port: 40930
Expires: 0
X-Hudson-Theme: default
Content-Type: text/html;charset=UTF-8
Transfer-Encoding: chunked
Date: Mon, 10 Apr 2017 12:16:01 GMT
```

## Data Bag
```json
{
  "name": "data_bag_item_hudson_engine",
  "json_class": "Chef::DataBagItem",
  "chef_type": "data_bag_item",
  "data_bag": "hudson",
  "raw_data": {
    "id": "engine",
    "Chef-dev": {
      "engine": "Jboss-7.1.1"
    }
  }
}
```


## Hudson.xml
```bash
[root@node-one vagrant]# cat /opt/jboss-as-7.1.1.Final/standalone/deployments/hudson/hudson.xml
<?xml version="1.0" encoding="UTF-8"?>
<cumulogic-app>
<single-vm>false</single-vm>
<application>
  <application-context>hudson</application-context>
  <jndi-name></jndi-name>
  <db-name></db-name>
  <db-type></db-type>
<application-file-name>hudson.war</application-file-name>
 <bind-global-services>true</bind-global-services>
</application>
 <services>
    <framework>
      <type>Java EE</type>
       <engine>Jboss-7.1.1</engine>
      <no-of-nodes>1</no-of-nodes>
      <max-nodes>2</max-nodes>
    </framework>
  </services>
</cumulogic-app>
```

