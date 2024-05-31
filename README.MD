## SPMM (Swift Package Manager Manager)

SPMM is a "Manaager" for the "Swift Package Manager".

For [SPM](https://www.swift.org/documentation/package-manager/) packages and for CLI applications dependencies can be added or removed by editing a `Package.swift` file. For all other Xcode projects this is not possible as of this writing. SPMM works with `spmfile`s that describe each target's dependencies (SPM packages, their version and if the package is local or remote.)

```
make build
```
