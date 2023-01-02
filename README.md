# Advanced-Encryption-Standard-Acceleration
VHDL RTL Description of Accelerated AES Algorithm implemented on Field Programmable Gate Arrays.

RTL Description of Accelerated 128bits AES Algorithm implemented on Field Programmable Gate Arrays in VHDL.

This is is my first foray in the world of FPGA/SoC hardware acceleration. 

**Learning Outcomes :**
* Loop Unrolling
* High-throughput Design Techniques : Pipelining and Register Balancing
* Writing Basic Testbenches

**The project contains two implementation variants :**
* A low-area, loop unrolled 128bits AES 
* A high-throughput, fully pipelined 128bits AES

**The design was implemented on two available Intel/Altera Devices :**
* Cyclone V 5CSXFC6D6F31C6
* Cyclone II EP2C35F672C6

# Background
## Algorithm
Originally known as Rijndael, it was one of the contestants of NIST’s AES competition featuring multiple algorithms from the open cryptographic community. Rijndael scored highest among the finalists after assessments on both security and
performance. In addition to being able to provide up to TOP SECRET level of
security with high performance on both software and hardware, Rijndael features
multiple key lengths 128, 192, and 256 bits each different number of rounds 10, 12
and 14 respectively.

Initially, the encryption starts by XORing the key and the input data before feeding the result through the rounds. Each round of Rijndael consists of four steps
: SubBytes, ShiftRows, MixColumns and 
Add RoundKey, except for the last round
which requires no column mixing.

![aes_round](https://user-images.githubusercontent.com/62886215/210189736-e4559f55-f72f-41c8-8e9e-bb7e104242ea.PNG)

## Counter Mode Of Operation (CTR)
A block cipher mode of operation is an algorithm that uses a block cipher to provide information security such as confidentiality or authenticity.

In CTR mode, the block cipher generates the next keystream block by encrypting successive values of a "counter". The counter can be any function that produces a sequence that is guaranteed not to repeat for a long time, although an actual increment-by-one counter is the simplest and most popular.

[CTR Mode Block Diagram](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/CTR_encryption_2.svg/1920px-CTR_encryption_2.svg.png)

## Why CTR Mode?
Operating block ciphers in CTR Mode has majors advantages:
* [Security](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#ECB-weakness)
* Encryption parallelizable
* Decryption parallelizable
* Random read access
* Hardware Reuse for both enc and dec


# Design
## Fully Pipelined Architecture
In pipelining, registers are inserted between each combinational processing element so that each input data block can be processed simultaneously in each processing element. This allows for an overall higher throughput (since the data is processed simultaneously without overhead), however, a delay that is linearly proportional to the pipeline depth is anticipated.

![aes-pipe](https://user-images.githubusercontent.com/62886215/210190488-e7a76afa-f6ab-4ea7-abfb-2afce836213b.PNG)

## Loop Unrolled Architecture
In contrast to pipelining, loop unrolling involves a single combinational processing element with data fed-back at every clock cycle. Input to output delay of this type of architecture is similar to that of the pipelined architecure. However, area and throughput are orthogonal. 

![non-pipe](https://user-images.githubusercontent.com/62886215/210194395-0b8862a5-102d-4246-8cde-a8f7fa1c69fb.png)
