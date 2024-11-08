MAKEFLAGS += -r

DEBUG ?= 1
ifeq ($(DEBUG), 1)
    CFLAGS=-std=c23 $(COMMON_COMPILE_LINK_FLAGS) $(COMMON_WARNING_FLAGS) $(GCC_WARNING_FLAGS) $(GCC_GE13_WARNING_COMPILE_LINK_FLAGS) $(GCC_GE12_WARNING_COMPILE_LINK_FLAGS) $(GCC_GE11_WARNING_COMPILE_LINK_FLAGS) $(GCC_GE10_WARNING_COMPILE_LINK_FLAGS) $(COMMON_DEBUG_MODE_FLAGS) $(GCC_DEBUG_MODE_FLAGS) -DDBG_MACRO_NO_WARNING -DDEBUG
else
    CFLAGS=-std=c23 -O2 -flto $(COMMON_COMPILE_LINK_FLAGS) $(GCC_RELEASE_COMPILE_LINK_FLAGS) $(GCC_GE12_RELEASE_COMPILE_LINK_FLAGS) $(COMMON_WARNING_FLAGS) $(GCC_WARNING_FLAGS) $(GCC_GE13_WARNING_COMPILE_LINK_FLAGS) $(GCC_GE12_WARNING_COMPILE_LINK_FLAGS) $(GCC_GE11_WARNING_COMPILE_LINK_FLAGS) $(GCC_GE10_WARNING_COMPILE_LINK_FLAGS) -DDBG_MACRO_NO_WARNING -DNDEBUG
endif

default: $(EXE)

%: %.c
	$(CC) $< -o $@.x $(CFLAGS)

.PHONY: clean
clean:
	@printf "Deleting compiled executables and other build artefacts ...\n"
	@find . -name "*.o" -print -delete 2>/dev/null
	@find . -name "*.x" -print -delete 2>/dev/null
	@find . -name "*.dwo" -print -delete 2>/dev/null
	@find . -name "*.exe" -print -delete 2>/dev/null
	@find . -name "*.out" -print -delete 2>/dev/null
	@find . -name "*.su" -print -delete 2>/dev/null
	@find . -name "cppcheck_suppressions.txt" -size 0 -print -delete 2>/dev/null
	@find . -type d -name "*.out" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name "cppcheck_build" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name ".ccls-cache" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name ".cmake" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name "build" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name "build_*" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name "buildtree" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name "CMakeFiles" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d -name "*x_dwo" -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -type d \( -name "debug" -o -name "release" \) -print -exec rm -rf "{}" \; 2>/dev/null
	@find . -name "*.out" -print -delete 2>/dev/null
	@find . -name "*.x" -print -delete 2>/dev/null
	@find . -name "cmake_install.cmake" -print -delete 2>/dev/null
	@find . -name "CMakeCache.txt" -print -delete 2>/dev/null
	@find . -name "CTestTestfile.cmake" -print -delete 2>/dev/null
	@find . -name "CPackConfig.cmake" -print -delete 2>/dev/null
	@# find . -iname "MakeFile" -print -delete 2>/dev/null
	@find . -iname "hello.txt" -print -delete 2>/dev/null
	@find . -iname "hello.data" -print -delete 2>/dev/null
	@find . -name "output.db" -print -delete 2>/dev/null
	@echo "Removed build-output files. DONE!"

