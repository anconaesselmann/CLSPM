## SPMM (Swift Package Manager Manager)

SPMM is a "Manager" for [SPM](https://www.swift.org/documentation/package-manager/) (Swift Package Manager).

For [SPM](https://www.swift.org/documentation/package-manager/) packages and for CLI applications dependencies can be added or removed by editing a `Package.swift` file. For all other Xcode projects this is not possible as of this writing. SPMM works with `spmfile`s that describe each target's dependencies (SPM packages, their version and if the package is local or remote.)

### Installation

Use make to compile and install SPMM:

1) Compile and install

`make build` will compile SPMM and move the executable to /usr/local/bin

2) Reload your `PATH` variable or restart `Terminal`/`iTerm`...

## How to use SPMM

### Generating an `spmfile`

```
SPMM init // Not yet implemented
```

### Adding dependencies to an `spmfile`

// TODO

### Installing packages with an `spmfile`


// TODO


## TODO:
[ ] Create a master version file to keep dependency versions synchronized across multiple projects
