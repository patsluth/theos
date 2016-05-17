.PHONY: clean stage before-stage internal-stage after-stage





clean::
	$(ECHO_NOTHING)  \
		rm -rf obj  \
		rm -rf debs  \
		rm -rf .theos  \
		rm -rf Resources/*.nib  \
	$(ECHO_END)




before-all::
	/opt/theos/makefiles/compilexib *.xib





stage::
	$(ECHO_NOTHING) cd $(THEOS_STAGING_DIR); find . -name '*.DS_Store' -type f -delete $(ECHO_END)





before-stage::





internal-stage::





after-stage::
ifeq ($(DEBUG), 1)
	$(ECHO_NOTHING) \
		echo "Generating .dYSM debug file..."; \
		pushd .theos/$(THEOS_OBJ_DIR_NAME) > /dev/null; \
		dsymutil $(TWEAK_NAME).dylib -o $(TWEAK_NAME).dSYM; \
		popd > /dev/null; \
	$(ECHO_END)
endif




