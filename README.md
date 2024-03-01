# ILoveTimers
Simple timer library for LÖVE, based off of Garry's Mod Lua's "timer" library.

# Functions

```newTimer(identifier {string},timePerIter {number},maxIter {integer},execution {function},isPrecise {boolean})```: Creates a new timer with the specified parameters.\
```identifier``` -> A unique string used to identify the timer.\
```timePerIter``` -> The duration of each iteration of the timer, in seconds.\
```maxIter``` -> The maximum number of iterations before the timer is automatically removed. Set to 0 or a negative value for infinite iterations.\
```execution(data {table})``` -> A function to execute on each iteration of the timer. The "data" argument contains information about the timer's state.\
```isPrecise``` -> If true, the timer will use *love.timer.getTime()* instead of deltatime, useful for events that requires precise timing.

```findTimer(identifier {string})```: Searches for a timer by its identifier and returns it along with its index if found. Returns false if the timer could not be found.

```rewindTimer(identifier {string},resetCrntInt {boolean})```: Resets the timer's internal variables, dt (delta time)/preciseTime. If resetCrntInt if true, it also resets the timer's current iterations.

```setTimerPaused(identifier {string},toggle {boolean})```: Pauses or resumes the specified timer based on the toggle argument, if it exists.

```getTimerPaused(identifier {string})```: Returns whether or not the timer is currently paused. Returns 'notfound' if it couldn't be found.

```removeTimer(identifier {string})```: Removes the timer identified by the given identifier, if it exists.

```update(dt {number})```: Updates all active timers with the provided delta time.
