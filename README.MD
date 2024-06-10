## CLSPM (Command Line Swift Package Manager)

CLSPM is a command line application for managing [SPM](https://www.swift.org/documentation/package-manager/) (Swift Package Manager) dependencies in Xcode projects.

For [SPM](https://www.swift.org/documentation/package-manager/) packages and for CLI applications dependencies can be added or removed by editing a `Package.swift` file. For all other Xcode projects this is not possible as of this writing. CLSPM works with `spmfile`s that describe each target's dependencies (SPM packages, their version and if the package is local or remote.)

- [Toggle packages](https://github.com/anconaesselmann/CLSPM/wiki/Toggle-Package-Sources) between local and remote
- [Add multiple packages](https://github.com/anconaesselmann/CLSPM/wiki/Adding-Packages) to new or existing packages
- [Keep package versions consistent](https://github.com/anconaesselmann/CLSPM/wiki/Consistent-Versions-Across-Projects) across multiple projects

### Installation

Use make to compile and install CLSPM:

1) Compile and install

`make build` will compile CLSPM and move the executable to /usr/local/bin

2) Reload your `PATH` variable or restart `Terminal`/`iTerm`...

### How to use CLSPM

See the [quickstart guide](https://github.com/anconaesselmann/CLSPM/wiki#quickstart) in the [wiki](https://github.com/anconaesselmann/CLSPM/wiki) for how to get started.
