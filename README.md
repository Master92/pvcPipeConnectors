# PVC pipe connectors

This repository holds the OpenSCAD files for PVC pipe connectors used for building RaceGOW gates with 20mm conduit.

## Generating STL files

There are two ways for generating the STL files. You can either use CMake and generate them in batch or you can use the
OpenSCAD built-in designer and choose from a dropdown list of connectors.

### CMake

The objects can be generated in batch by running the following commands:

**Linux:**
```Shell
cmake -B <build_dir> .
cmake --build <build_dir>
```

**Windows:**
```Batchfile
cmake -B <build_dir> . -DCMAKE_PREFIX_PATH="C:\Program Files\OpenSCAD"
cmake --build <build_dir>
```

The generated files can then be found in the `<build_dir>` directory.

#### Generating ABS connectors

The ABS option can be used to generate connectors for printing in ABS material. This special option will increase the
size of the upward facing part of the connector by 2% to account for shrinking. If you find that factor doesn't work
with your printer, you can adjust it in the CMakeLists.txt file. To make use of this option, you have to append
`-DABS=ON` to your first (configure step) line.

### OpenSCAD IDE

Be aware that the file defaults to generating no connector at all and uses a scale factor of 1.0 to accommodate for the
most general usage. If you want to generate object files for printing in ABS, you have to manually adjust the
`scaleFactor` variable in the list of design parameters.

## License

This work is licensed under [CC BY-NC-SA 4.0
<img height=15pt src="https://mirrors.creativecommons.org/presskit/icons/cc.svg" />
<img height=15pt src="https://mirrors.creativecommons.org/presskit/icons/by.svg" />
<img height=15pt src="https://mirrors.creativecommons.org/presskit/icons/nc.svg" />
<img height=15pt src="https://mirrors.creativecommons.org/presskit/icons/sa.svg" />
](https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1)
