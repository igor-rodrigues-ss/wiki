# AsyncIO

## Introduction

__AsyncIO__ is a library to provide concurrency in Python based on async functions (coroutines). To have real concurrency in python we need 3 components: __coroutines, tasks__ and __event loop__.

#### Coroutines

Coroutines are async functions that can be paused and resumed.

```python
async def my_coroutine():
    print("Coroutine started")
    await asyncio.sleep(1)
    print("Coroutine finished")
```

- __async__ keyword is used to define a coroutine.
- __await__ keyword is used to pause the coroutine and return the control to the event loop.


#### Tasks

Tasks are coroutines that are scheduled on an event loop. If I wanna run a coroutine concurrently I need to create a task. under the hood a task has a state of coroutine execution. (PENDING, DONE, CANCELLED)

```python
import asyncio

async def main():
    task = asyncio.create_task(my_coroutine()) # Execute the coroutine concurrently in event loop
    
    await task
```

#### Event Loop

The event loop is a loop to run the tasks concurrently.

```python
import asyncio

async def main():
    await asyncio.sleep(1)

asyncio.run(main())  # Start the event loop and run tasks
```

#### Real concurrency:
- If we have a funcion with many `await` in serial, __each a wait will run in serial, not concurrently__. Only exists real concurrency when wen create tasks.

##### Serial Processing:

```python
import asyncio

async def coro1():
    for i in range(5):
        print(i)
        await asyncio.sleep(1)

async def coro2():
    for i in ["a", "b", "c", "d", "e"]:
        print(i)
        await asyncio.sleep(1)

async def main():
    await coro1()

    await coro2()

asyncio.run(main())
```

_In this example, even though we have two coroutines being called by await, all the processing will be executed in serial. It happens because the await keyword pauses the coroutine and returns the control to the event loop to execute other tasks, but, we don’t have other tasks running in the event loop, so this code will execute in serial_

##### Concurrent Processing:

```python
import asyncio

async def coro1():
    for i in range(5):
        print(i)
        await asyncio.sleep(1)

async def coro2():
    for i in ["a", "b", "c", "d", "e"]:
        print(i)
        await asyncio.sleep(1)

async def main():
    asyncio.create_task(coro1())

    await coro2()

asyncio.run(main())
```

_In this case we have real concurrency because we create a task with asyncio.create_task(coro1()), with it on the next await command the event loop will run the other available tasks concurrently._