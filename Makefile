SIMULATE   ?= false
CONNECTION ?= smart

ifeq ($(SIMULATE), true)
	CONNECTION := local
endif


include make/tools.mk
include udm/make.mk