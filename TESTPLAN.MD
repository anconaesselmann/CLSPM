# Test plan

## init command

### JSON spmfile

- One target I-JSPM-T1 
	- [x] 0, 1, 2 dependencies resolved from global dependencies file
		- [x] dependencies stored in spmfile I-JSPM-T1-DEP-LD0/1/2
		- [x] dependencies not stored in spmfile I-JSPM-T1-DEP-G0/1/2
	- [x] 1, 2 remote dependencies from xproj file I-JSPM-T1-XPROJ-L1/2
	- [ ] 1, 2 local dependencies from xproj file
	- [ ] mix of local and remote dependencies from xproj file

- Multi target
	- [ ] same as one target

### CSV spmfile

- One target
	- [x] 0, 1, 2 dependencies resolved from global dependencies file
		- [x] dependencies stored in spmfile
		- [ ] dependencies not stored in spmfile

- Multi target
	- [ ] same as one target
	- [ ] targets have different dependencies

- Regular and Test target
	- [ ] same as one target
	- [ ] targets have different dependencies