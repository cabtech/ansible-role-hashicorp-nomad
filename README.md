----
# ansible-role-hashicorp-nomad

## Required variables
None

## Default variables
| Name | Type | Value | Purpose |
| ---- | ---- | ----- | ------- |
| nomad_builds | see below | see below | decides with versions of the binary to install |
| nomad_enable_ui | Boolean | false ||
| nomad_etc_dir | UnixPath | `/etc/nomad` | where the config lives |
| nomad_format | string | zip | used to work out the name of the Nomad archive |
| nomad_lib_dir | UnixPath | `/var/lib/nomad` ||
| nomad_log_dir | UnixPath | `/var/log/nomad` ||
| nomad_log_level | string | DEBUG ||
| nomad_plugin_raw_exec | Boolean | false ||
| nomad_plugin_docker | Boolean | false ||
| nomad_port | integer | 4646 | where the Nomad UI listens |
| nomad_publish_to_datadog | Boolean | false ||
| nomad_role | string | oneOf(client,server) ||
| nomad_state | string | started | anything supported by systemctl ||
| nomad_version | string | '1.3.3' | defines which of the entries in `nomad_builds` is active |

```
nomad_builds:
- {version: '1.3.0', state: present}
- {version: '1.3.3', state: present}
```

## Optional variables
| Name | Type | Purpose | Example |
| ---- | ---- | ------- | ------- |
| nomad_consul_url | If defined, Nomad UI will integrate with Consul UI | `https://consul.example.com/ui` |
| nomad_vault_addr | IPv4 | role to use on Vault ||
| nomad_vault_role | string | role to use on Vault ||
| nomad_vault_scheme | string | oneOf(http,https) ||
| nomad_vault_token | token | enables vault integration ||
```
The nomad_vault_* variables are only needed if nomad_vault_token is defined
```

## Nomad versions
Tag 2.x was built for Nomad `1.3`.  Tag 1.0.0 should work with anything pre `1.0`
****
