UDM_ROLES ?= \
	cni-plugins \
	mdns-relay \
	podman \
	pihole \
	split-vpn

INVENTORY  ?= $(CURRENT_DIR)/inventory.yml
LIMIT      ?= udm

ifeq ($(SIMULATE), true)
	LIMIT := localhost
endif

CONFIGS := \
	$(CURRENT_DIR)/vars.yml \
	$(CURRENT_DIR)/inventory.yml \
	$(CURRENT_DIR)/config.yml.j2

SAMPLE_CONFIGS := \
	$(CONFIGS:=.sample)

.PHONY: udm-init-configs
udm-init-configs: $(CONFIGS)

$(CURRENT_DIR)/%.yml:
	cp $@.sample $@

$(CURRENT_DIR)/%.yml.j2:
	cp $@.sample $@

udm_tags := $(shell echo $(UDM_ROLES) | tr ' ' ',')

.PHONY: udm-deploy
udm-deploy:
	ansible-playbook $(CURRENT_DIR)/udm.yml -i $(INVENTORY) -c $(CONNECTION) --tags="$(udm_tags)" -l $(LIMIT)
