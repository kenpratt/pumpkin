Pumpkin
=======

A carved pumpkin with a high-powered LED that I made for Halloween 2011.

![The pumpkin](https://github.com/kenpratt/pumpkin/blob/master/pumpkin.jpg?raw=true)

[Video of pumpkin in action](http://www.youtube.com/watch?feature=player_embedded&v=TVvJAJWg51A)

Building
--------

* Soldering instructions and general circuit design from [Power LED's - simplest light with constant-current circuit](http://www.instructables.com/id/Power-LED-s---simplest-light-with-constant-current/)
* Specific circuit from [High Power LED Driver Circuits](http://www.instructables.com/id/Circuits-for-using-High-Power-LED-s/step8/a-little-micro-makes-all-the-difference/)

I built out the project in this order:

1. Build constant-current circuit on a breadboard to power one LED channel
2. Adapted the circuit to use the Arduino
3. Wrote a bit of code to test out PWM
4. Soldered the three drivers
5. Hooked everything up to the Arduino & tested (put the three drivers in parallel)
6. Coded up the light show

Diagram
-------

![The circuit diagram](https://github.com/kenpratt/pumpkin/blob/master/circuit_diagram.jpg?raw=true)

(Credit: Dan Goldwater, [High Power LED Driver Circuits](http://www.instructables.com/id/Circuits-for-using-High-Power-LED-s/))

Parts
-----

* 1x Arduino Duemilanove
* 3x 1W 100kΩ resistors (R1)
* 3x 1W 1.5Ω resistors (R3)
* 1x High-power 3W RGB LED (LED) (350mA forward current per channel)
* 3x BC 547 (Q1)
* 3x IRFZ44N (Q2)
* 1x 5V, 2A power adapter

Guts
----

![The guts of the pumpkin](https://github.com/kenpratt/pumpkin/blob/master/guts.jpg?raw=true)
