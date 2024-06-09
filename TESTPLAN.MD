# Test plan

## init command

### JSON spmfile

#### One target INIT-JSPM-T1 
- [x] INIT_JSON_T1_D0: 
	##### Setup:
	- ~/.swiftpmm
		- not relevant
	- MyApp/.swiftpmm
		- not relevant
	- Project directory
		- not relevant
	- Project:
		- Targets: "MyApp", "MyAppTests", "MyAppUITests". 
		- Package Dependencies: none
	##### Command: 
	```
	init
	```
	##### Outcome:
	- ~/.swiftpmm
		- not relevant
	- MyApp/.swiftpmm
		- not relevant
	- Project directory
		- A JSON spmfile is generated:
			- One target named "MyApp"
			- Empty dependency section
	- Project:
		- no change

- [x] INIT_JSONC_OPT_T1_R1/R2: 
	##### Setup:
	- ~/.swiftpmm
		- `dependencies` file:
			- two remote dependencies: "LoadableView" and "DebugSwiftUI"
			- each has an ID, a remote url and a version
	- MyApp/.swiftpmm
		- not relevant
	- Project directory
		- not relevant
	- Project:
		- Targets: "MyApp", "MyAppTests", "MyAppUITests". 
		- Package Dependencies: none
	##### Command: 
	```
	// R1:
	init -d LoadableView

	// R2:
	init -d LoadableView, -d MyAppUITests
	```
	##### Outcome:
	- ~/.swiftpmm
		- not relevant
	- MyApp/.swiftpmm
		- not relevant
	- Project directory
		- A JSON spmfile is generated:
			- One target named "MyApp"
			- Dependency section with 1/2 remote dependencies
	- Project:
		- no change

- One target INIT-JSPM-T1 
	- [x] 0, 1, 2 dependencies resolved from global dependencies file
		- [x] dependencies stored in spmfile INIT-JSPM-T1-DEP-LD0/1/2
		- [x] dependencies not stored in spmfile INIT-JSPM-T1-DEP-G0/1/2
	- [x] 1, 2 remote dependencies from xproj file
		- [x] dependencies stored in spmfile INIT-JSPM-T1-XPROJ-L1/2
		- [x] dependencies not stored in spmfile INIT-JSPM-T1-XPROJ-G1/2
	- [ ] 1, 2 local dependencies from xproj file
		- [x] dependencies stored in spmfile INIT-JSPM-T1-XPROJ_DL-L1/2
		- [ ] dependencies not stored in spmfile INIT-JSPM-T1-XPROJ-DL-G1/2
	- [ ] mix of local and remote dependencies from xproj file
		- [ ] dependencies stored in spmfile INIT-JSPM-T1-XPROJ_MD-L2
		- [ ] dependencies not stored in spmfile INIT-JSPM-T1-XPROJ-MD-G2

- Multi target
	- [ ] same as one target

### CSV spmfile

- One target
	- [x] 0, 1, 2 dependencies resolved from global dependencies file

- Multi target
	- [ ] same as one target
	- [ ] targets have different dependencies

- Regular and Test target
	- [ ] same as one target
	- [ ] targets have different dependencies

## install command

### JSON spmfile

- One target INST-JSPM-T1 
    - [x] 1, 2 dependencies resolved from global dependencies file
        - [x] dependencies stored in spmfile INST-JSPM-T1-LD1/2
        - [x] dependencies not stored in spmfile INST-JSPM-T1-G1/2

### CSV spmfile

- One target INST-CSPM-T1 
    - [x] 1, 2 dependencies resolved from global dependencies file INST-CSPM-T1-D1/2
