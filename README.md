
# Limited Array

Create a native-feeling array, whose 'push' method automatically shifts the first value off the
front. Useful if you want to keep track of the last `n` things for some reason. Also supports
'last' getter to cut down on that x[x.length - 1] nonsense.


## Example

    LimitedArray = require 'limited-array'


    # Remember last 3 values

    previousValues = new LimitedArray 3

    onTick = (newValue) ->
      previousValues.push newValue
      console.log previousValues


    # Limited array was initialised with 3 zeros

    console.log previousValues
    => [ 0, 0 ,0 ]


    # Tick 1 ... 5

    => [ 0, 0, 1 ]
    => [ 0, 1, 2 ]
    => [ 1, 2, 3 ]
    => [ 2, 3, 4 ]
    => [ 3, 4, 5 ]


    # Special 'last' getter

    console.log previousValues.last
    => 5


## Constructor params

###### 0 - Length

How long you need the array to be. Constructor will automatically fill the array with a seed value.

    console.log new LimitedArray 10
    => [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

###### 1 - Seed (0)

Seed value to use to initialise the array. Default is zero.

    console.log new LimitedArray 3, 'x'
    => [ 'x', 'x', 'x' ]

## Usage

###### .push

Just like normal array push.

###### .last

Returns item at last position in the array. Just a getter, not a function, dont call it.

