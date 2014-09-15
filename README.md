ECE382_Lab1 Assembly Language "A Simple Calculator"
===========
# Purpose
  The purpose of this lab was to use our knowledge from class and write an assembly language program that interprets a series of operands and operations and then stores the results. This is also known as an assembly language calculator. There were 3 functionalities our code was required to meet. The first implemented four operations: add_op, sub_op, Clr_op, and end_op. The second set the maximum value to 255, if the result exceeded 255 and the minimum value to zero is the result was less than zero. The final functionality implemented a multiplication operation. 


# PreLab:

Below is a picture of my pseudocode done in my class notebook. It was discussed and signed off by Capt Trimble on 9 SEP 14. 

![alt text] (https://raw.github.com/CassieMcPeek/ECE382_Lab1/master/Prelab.jpg "Prelab Pseudocode")


# Debugging
  
  For the program, I began my using my psuedocode and the lesson 6 handout to help me with the format and syntax of this program. I also referenced the textbook (MSP430 Microcontroller Basics) to review the different jump functions. Once I felt I had a good program, I ran the basic tests on it and found that there was a problem with the clr_op operation. I then put multiple breakpoints in the program and stepped through each step. After a few times, I realized that the issue was actually in the addition operation section of my code. Originally, I moved the value from register 5 to register 9 and then added the value from register 6 to register 9. That was incorrect, what I needed to do was move the value from register 5 into register 6 and then add the values from register 6 to register 9. Once I made that fix, all of the test cases worked.

  
