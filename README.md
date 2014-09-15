ECE382_Lab1 Assembly Language "A Simple Calculator"
===========
# Purpose
  The purpose of this lab was to use our knowledge from class and write an assembly language program that interprets a series of operands and operations and then stores the results. This is also known as an assembly language calculator. There were 3 functionalities our code was required to meet. The first implemented four operations: add_op, sub_op, Clr_op, and end_op. The second set the maximum value to 255, if the result exceeded 255 and the minimum value to zero is the result was less than zero. The final functionality implemented a multiplication operation. 


# PreLab:

Below is a picture of my pseudocode done in my class notebook. It was discussed and signed off by Capt Trimble on 9 SEP 14. 

![alt text] (https://raw.github.com/CassieMcPeek/ECE382_Lab1/master/Prelab.jpg "Prelab Pseudocode")


# Debugging
  
  For the program, I began my using my psuedocode and the lesson 6 handout to help me with the format and syntax of this program. I also referenced the textbook (MSP430 Microcontroller Basics) to review the different jump functions. Once I felt I had a good program, I ran the basic tests on it and found that there was a problem with the clr_op operation. I then put multiple breakpoints in the program and stepped through each step. After a few times, I realized that the issue was actually in the addition operation section of my code. Originally, I moved the value from register 5 to register 9 and then added the value from register 6 to register 9. That was incorrect, what I needed to do was move the value from register 5 into register 6 and then add the values from register 6 to register 9. Once I made that fix, all of the test cases worked.

  
# Testing 

  For the testing, I did it piece by piece throughout my program. After I felt that the code was complete to perform the add_op operation, I did the short test case from the lab handout. I placed 0x14, 0x11, 0x12 into the program memory and it ouput 0x26 (the addition of 0x14 and 0x12) into the address 0x0200.
  After that operation functioned, I moved onto the sub_op operation. After I had that code in place and felt confident with it, I entered 0x21, 0x22, 0x01 into the program memory and it output 0x20, the correct answer into the address 0x0200. 
    Then I moved onto the clr_op operation. After this code was done, I ran the test case 0x21, 0x22, 0x01, 0x44, 0x14, 0x11, 0x12. This is where I ran into issues. Instead of outputting the correct answer of 0x20, 0x00, 0x26, it would output 0x20, 0x00, 0x00. At this point, I went back to debugging my code by placing breakpoints throughout the code and stepping through each step to determine where the issue was at. This is where I had the wrong register for the addition operation. Once I made that fix, it output the correct answer into the address 0x0200.
    The last part of the required functionality testing was the end operation. When I input the test case 0x14, 0x11, 0x32, 0x22, 0x08, 0x44, 0x11, 0x08, 0x55, it output the proper answer 0x46, 0x3e, 0x00, 0x0c into the address 0x0200. 
    After that was done, I added the necessary code to perform the B and A functionalities and ran the provided test cases to ensure they worked properly. I got the correct answers in the address 0x0200 for all three test cases. I went back and switched the register that I fixed earlier to see what would happen, and I would receive the correct answers for all test cases until the clr_op (0x44) was referenced, and then the program would not output the correct answer. However, with that issue fixed, the program demonstrated all of the functionalities. 
    
    I demonstrated all functionalities to Capt Trimble on Thurs 11 SEP 2014 at 1335. 
    
    
Documentation: C2C Ian Goodbody assisted me with debugging by showing me how to step through the program by single steps to find where the issue was at. 
