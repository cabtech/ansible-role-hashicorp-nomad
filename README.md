----
# ansible-role-hashicorp-nomad

## Required variables
| Name | Type | Purpose |
| ---- | ---- | ------- |
| local_ipv4 | IPv4 | internal IP address of the node |
| nomad_servers | list(IPv4) | IP addresses of the Nomad servers |

## Default variables
| Name | Type | Value | Purpose |
| ---- | ---- | ----- | ------- |
| nomad_builds | dict | see below | decides with versions of the binary to install |
| nomad_docker_allow_volumes | Boolean | false | whether a Nomad client should allow Docker volumes |
| nomad_enable_ui | Boolean | false ||
| nomad_etc_dir | UnixPath | `/etc/nomad` | where the config lives |
| nomad_format | string | zip | used to work out the name of the Nomad archive |
| nomad_lib_dir | UnixPath | `/var/lib/nomad` ||
| nomad_log_dir | UnixPath | `/var/log/nomad` ||
| nomad_log_level | string | DEBUG ||
| nomad_plugin_raw_exec | Boolean | false ||
| nomad_plugin_docker | Boolean | false ||
| nomad_port | integer | 4646 | where the Nomad UI listens |
| nomad_role | string | oneOf(client,server) ||
| nomad_telemetry_enabled | Boolean | false ||
| nomad_telemetry_hostname | string | localhost ||
| nomad_telemetry_port | integer | 8125 ||
| nomad_telemetry_tags | list(string) | [] | string format = "name:value" |
| nomad_telemetry_type | string | statsd | oneOf(datadog,statsd) |
| nomad_svc_enabled | Boolean | true | whether to start the service after reboot ||
| nomad_svc_state | SystemCtlStatus | started | oneOf(restarted, started, stopped) ||
| nomad_version | string | '1.3.3' | defines which of the entries in `nomad_builds` is active |
```
nomad_builds:
- {version: '1.3.0', state: present}
- {version: '1.3.3', state: present}
```

## Optional variables
| Name | Type | Purpose | Example |
| ---- | ---- | ------- | ------- |
| nomad_consul_client_token | UUID | add this if using Consul ACLs | use the output from `consul acl token create` |
| nomad_consul_server_token | UUID | add this if using Consul ACLs | use the output from `consul acl token create` |
| nomad_consul_url | URL | If defined, Nomad UI will integrate with Consul UI | `https://consul.example.com/ui` |
| nomad_vault_addr | IPv4 | role to use on Vault ||
| nomad_vault_role | string | role to use on Vault ||
| nomad_vault_scheme | string | oneOf(http,https) ||
| nomad_vault_token | token | enables vault integration ||
```
The nomad_vault_* variables are only needed if nomad_vault_token is defined
```

## Experimental variables
| Name | Type | Purpose | Comment |
| ---- | ---- | ------- | ------- |
| nomad_render_templates_once | Boolean | If defined for a client, will add client.template.render_templates_once | Requires custom Nomad build |

## Role Dependencies
- `ansible-role-hashicorp-common`

## Nomad versions
Tag 2.x was built for Nomad `1.3`.  Tag 1.0.0 should work with anything pre `1.0`

## Release Notes
### 2.7.0
`nomad_state` was replaced by `nomad_svc_state`
Introduced `nomad_svc_enabled` to replace hard-coded `true`
### 2.7.2
Stop hardcoding number of Nomad servers to be 3
### 2.8.0
Update licence
### 2.9.0
Added generic script for validating Nomad job files

****
