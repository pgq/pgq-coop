
EXTENSION = pgq_coop

EXT_VERSION = 3.3.8
EXT_OLD_VERSIONS = 3.1 3.1.1 3.3 3.3.1 3.3.2 3.3.3 3.3.4 3.3.5 3.3.6 3.3.8

Contrib_regress   = pgq_coop_init_noext pgq_coop_test
Extension_regress = pgq_coop_init_ext   pgq_coop_test

include mk/common-pgxs.mk

#
# docs
#
dox: cleandox $(SRCS)
	mkdir -p docs/html
	mkdir -p docs/sql
	$(CATSQL) --ndoc structure/functions.sql > docs/sql/functions.sql
	$(NDOC) $(NDOCARGS)

deb:
	make -f debian/rules genfiles
	debuild -us -uc -b

debclean:
	make -f debian/rules debclean

