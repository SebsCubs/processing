# processing
Processing educational projects

Here I've recopiled the projects I've done for small projects using processing.

1. Bluetooth control UART communication
  Here's an interface for controlling through the serial COM port of a PC with bluetooth the colors of an RGB LED, the value of a        cronometer and the opening/closing of serial communication.
  After some experimenting there are few considerations to review:
    - myPort.available() in processing returns the number of bytes available to read
    - myPort.read() this line returns decimal values, this is equivalent to the ASCII code received, so when sending "$" through serial         port I was seeing in processing a "36".
    - myPort.write() works the same way, in order to obtain an ASCII "A" we shall send it like myPort.write(65);
    
    
