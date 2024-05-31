## SPMM (Swift Package Manager Manager)

SPMM is a "Manaager" for the [SPM](https://www.swift.org/documentation/package-manager/) (Swift Package Manager).

For [SPM](https://www.swift.org/documentation/package-manager/) packages and for CLI applications dependencies can be added or removed by editing a `Package.swift` file. For all other Xcode projects this is not possible as of this writing. SPMM works with `spmfile`s that describe each target's dependencies (SPM packages, their version and if the package is local or remote.)

### Installation

Use make to compile and install SPMM:

1)
```
// Compile SPMM and move it to /usr/local/bin
make build
```

2)
Close your terminal of choice or reload your `PATH` variable

## How to use SPMM

### Generating an `spmfile`

```
SPMM init // Not yet implemented
```

### Adding dependencies to an `spmfile`

// TODO

### Installing packages with an `spmfile`


// TODO
