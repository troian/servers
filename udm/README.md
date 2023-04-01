# Provision Unifi UDM Pro/SE with various tools

:warning: **All commands below must be executed from project's root dir**

## Prerequisites
Init default configs from samples
```shell
make udm-init-configs
```

## How it works
There is single `udm-deploy` make target that can be configured with following parameters:
- `INVENTORY` - inventory file. Default `inventory.yml`
- `SIMULATE` - substitute all templates and files into `testfs` dir. Default `false`
- `CONNECTION` - ansible connection mode. Default `smart`. Set to local automatically if `SIMULATE=true`
- `UDM_ROLES` - list of roles to execute. [Default value](#roles)

## Inventory
copy `sample.inventory.yml` to `inventory.yml` and set UDM host

Should you wish you use different name of the file, it can be further send to the make using `INVENTORY` file
```shell
INVENTORY=inv.yml make udm-deploy
```

## Roles
Following roles are executable by default
- [cni-plugins](#cni-plugins)
- [mdns-relay](#mdns-relay)
- [podman](#podman)
- [pihole](#pihole): expects `cni-plugins` as well as `podman` to be installed
- [split-vpn](#split-vpn): expects `pihole` to be up and running

To install all the roles above, simply run:
```shell
make udm-deploy
```

To execute specific roles alter `UDM_ROLES`. For example to deploy `pihole` only
```shell
UDM_ROLES=pihole make udm-deploy
```

It is useful sometimes to generate all installable files locally to check templates substituted correctly, etc.
Flag `SIMULATE` will help to do so
```shell
SIMULATE=true UDM_ROLES=pihole make udm-deploy
```

## Configuration
TBD

## Secrets
VPN secrets and SSH keys are retrieved using `1Password connect`. Should you wish to add support for Ansible vault - PRs are welcome

## cni-plugins
TBD

## mdns-relay
TBD

## podman
TBD

## pihole
TBD

## split-vpn
TBD