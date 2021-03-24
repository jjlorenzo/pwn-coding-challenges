## Problem 1

Provide some Python code that can be used to measure how long some code took to run in a
friendly format. The amount of time can range from less than a second to several hours and
should be easy for a human to read (for example “193048.231s” is not a good output).

## Solution

The solution is an installable python package. It has both a Command-Line Interface as well as a callable one.

#### Command-Line Interface

```shell
$ pip install problem-1/dist/cprofile-0.1.0.tar.gz


$ cprofile -h
usage: cprofile [-h] [-v] statements [statements ...]

positional arguments:
  statements

optional arguments:
  -h, --help  show this help message and exit
  -v


$ cprofile "import time" "time.sleep(2)"
Execution time: 2 seconds and 3975 microseconds


# using the -v cli flag
$ cprofile "import time" "time.sleep(2)" -v
DEBUG:cprofile:code ['import time', 'time.sleep(2)']
DEBUG:cprofile:duration 0:00:02.002211
Execution time: 2 seconds and 2210 microseconds
```

#### Python API

```python
from cprofile import Timer
from foo.bar.baz import code_to_measure_time

with Timer() as timer:
  code_to_measure_time()
print(timer.duration)
```

#### Test suite

For now, I have decided to cover only the `humanize_timedelta_duration` function, mostly because the rest is glue-code:

- A Timer class that implements the Context-Manager protocol interface
- A cli entry_point using argparse

In any case, for a production code a test-suite that complete the coverage is important.

#### Dist

I have included the source and binary build in the `dist` folder to ease the testing and installation.

## Caveats

- For geetting accurate values, the timing should disable temporarily the garbage collection, with something like:

  ```python
  import gc
  
  gc.isenabled()  # get current value (Timer.__init__)
  
  gc.disable()    # disable the gc before timing (Timer.__enter__)
  
  ### ...code to measure execution time...
  
  gc.enable()     # enable the gc after timing (Timer.__exit__)
  ```

- The conversion from a duration `timedelta` to a friendly `str` representation is prone to floating point arithmetic errors. Usually the `decimal` module is used when an exact decimal representation is required, but I don't feel it was required for this exercise.

