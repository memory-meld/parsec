# parsec-3.0

The code here is based on original parsec-3.0 on [web archive](https://web.archive.org/web/20230707181635/https://parsec.cs.princeton.edu/download.htm).
The input data are separately uploaded to [here](https://github.com/memory-meld/parsec/releases/tag/upstream) because of GitHub's limitation.
Original documentation is in [README](./README)

## Instruction to use
```bash
# git clone ...
cd parsec
# download and restore original input data
wget https://github.com/memory-meld/parsec/releases/download/upstream/parsec-3.0-inputs.tar.zst.{0,1}
cat parsec-3.0-inputs.tar.zst.* | tar xvf - --zstd
# build all the benchmarks
bin/parsecmgmt -a build
# run what you want
bin/parsecmgmt -a run -p <benchmark>
```
All benchmarks can be built successfully. (Tested on Clearlinux 41040 with Icelake-x CPU and gcc 13.2.1).

## Fixed bugs
- Incorrect c++ standard
- Make has no parallelism
- [OpenSSL manual error](https://yulistic.gitlab.io/2016/05/parsec-3.0-installation-issues/)
- [`__mbstate_t`](https://yulistic.gitlab.io/2016/05/parsec-3.0-installation-issues/)
- [HUGE/DBL_MAX](https://yulistic.gitlab.io/2016/05/parsec-3.0-installation-issues/)
- mesa: same problem as [here](https://www.mail-archive.com/mesa3d-dev@lists.sourceforge.net/msg05105.html) fixed with `--disable-asm`
- `swaptions` defaults to tbb version.
    However, the header search path is not set.
    Use `bin/parsecmgmt -a build -p swaptions -c gcc-tbb` to fix.
- Multiple definitions during linking.
    Workloads which have this problem include: `raytrace`, `volrend`
- Incorrect use of `iostream`: `facesim`.
    This should be fixed when `std::filesystem` is used. (which is not available in `c++0x`)

