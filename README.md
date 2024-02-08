Simple timer library for Love2D, based off of Garry's Mod Lua's "timer" library.

# FUNCTIONS

```newTimer(identifier {string},timePerInc {number},maxInc {integer},execution {function})```: Creates a new timer with the specified parameters.
```identifier``` -> A unique string used to identify the timer.\
```timePerIter``` -> The duration of each iteration of the timer, in seconds.\
```maxInc``` -> The maximum number of iterations before the timer is automatically removed. Set to 0 or a negative value for infinite iterations.\
```execution(data {table})``` -> A function to execute on each iteration of the timer. The "data" parameter contains information about the timer's state.\

```findTimer(identifier {string})```: Searches for a timer by its identifier and returns it along with its index if found. Returns false if the timer could not be found.

```rewindTimer(identifier {string})```: Resets the timer's internal variables, dt (delta time) and crntInc (current iteration), to zero if the timer exists.

```removeTimer(identifier {string})```: Removes the timer identified by the given identifier, if it exists.

```update(dt {number})```: Updates all active timers with the provided delta time.