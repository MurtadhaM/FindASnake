SUBDIRS := $(wildcard */.)

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

clean:
	$(foreach dir,$(SUBDIRS),$(MAKE) -C $(dir) clean;)

empty:
	$(foreach dir,$(SUBDIRS),$(MAKE) -C $(dir) empty;)

.PHONY: all $(SUBDIRS) clean %