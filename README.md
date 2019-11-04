----
# ansible-role-hashicorp-nomad

## Required variables
None

## Default variables
| Name | Value | Purpose |
| ---- | ----- | ------- |
| nomad_etc_dir | `/etc/nomad` | where the config lives|
| nomad_format | zip | used to work out the name of the Nomad archive |
| nomad_lib_dir | `/var/lib/nomad` | |
| nomad_log_level | DEBUG | |
| nomad_port | 4646 | where the Nomad UI listens |
| nomad_role | client  | ...or server |
| nomad_state | started | anything supported by systemctl |
| nomad_log_dir | `/var/log/nomad` | |
| nomad_version | '0.9.6' | |
||||
| nomad_cni_archive | computed | name of downloaded archive |
| nomad_cni_base    | /opt/cni | where to install things |
| nomad_cni_dirs    | computed | directories to create |
| nomad_cni_url     | computed | URL to download |
| nomad_cni_version | 'v0.8.2' | used to derive download URL |

## Optional variables
| Name | Purpose |
| ---- | ------- |
| nomad_allow_raw_exec | if defined adds raw_exec plugin to a client's config |
| nomad_vault_role | role to use on Vault (only used if nomad_vault_token is set) |
| nomad_vault_token | if set, enables vault connection (needs nomad_vault_role and vault_address) |

****
