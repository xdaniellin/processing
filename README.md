Processing
==========

Interactivity (DESMA 28)


This course is an introduction to writing code within the context of the visual arts. 
It promotes conditional and systemic thinking. The concepts and skills taught in this
course set a foundation for future Design Media Arts courses about the internet (161),
game design (157), and media arts (159A, 171).

Content

This course asks a few questions:

How has software affected the visual arts?
What is the potential of software within the visual arts?
As a designer or artist, why would I want (or need) to write software?

Software influences all aspects of contemporary visual culture. Many established artists have integrated software into their process. Prominent architects and designers not only use software, they commission custom software to help them realize their unique ideas. The creators of every innovative video game and Hollywood animated film write custom software to enhance their work.

While these exciting developments are taking place at the highest levels of their respective professions, integrating them into education is a challenge. For even the most motivated student, the technical boundaries are difficult to overcome and getting beyond them requires tremendous dedication. As a comprehensive first introduction to the potential of software development within a broad range of the arts, this course aspires to encourage the enthusiasm.

In reference to the emerging media of his time, the eminent media theorist Marshall McLuhan wrote: "Today we're beginning to realize that the new media aren't just mechanical gimmicks for creating worlds of illusion, but new languages with new and unique powers of expression." Writing code is one gateway into these "new and unique powers of expression." Learning to program and to engage the computer more directly with code opens the possibility to create not only tools, but systems, environments, and new modes of expression. It is here that the computer ceases to be a tool and becomes a medium.

==========

PROJECT 1: Image System

Build on the ideas and code from Workshop 1 to write a program that creates a simple, geometric image that is different each time the program is run. Look at images by creators such as Georges Vantongerloo, Vera Molnar, Sol LeWitt, and Sara Morris for examples, but keep it simple. Focus on the complexity of the _variability_, rather than the intricacy of the initial image. In short, the goal of Project 1 is to think about images as systems. One program (one set of relations) is a generator for many related images.

Arrive to class on Wednesday with a variety of drawings on paper or on screen; we'll spend the time in class starting to realize them in code. The final program must be 600 x 600 pixels. The code should draw differently each time the program is run by using random values with variables. Export the patterns as PDF files and print a 2 x 2 grid in the center of a vertical 11" x 17" page. Use this template. Neatly post your print on the wall and place your code on the server. We will let you know how to upload code to the server at the beginning of class on the due date. 



PROJECT 2: Collage

Build on the ideas and code from Workshop 2 to write a program that combines the technical "rubber stamp" feature of KidPix with the "escape" and "fantasy" ideas introduced in Sherry Turkle's "Video Games and Computer Holding Power". You'll make your own collage software using a series of images (.gif, .jpg, or .png) that you select based on your personal ideas about "escape" and "fantasy". You can be earnest or ironic, serious or absurd. Arrive to class on Wednesday with the images for your project within a Photoshop mockup; we'll spend the time in class starting to realize your plan and images in code. The final program must be 1024 x 768 pixels. Write a long comment at the top of the code to explain your idea for the project. Post the code on the server by the start of class on the due date. 



PROJECT 3: Story

Adapt the historical game Snakes and Ladders into a one-player nonlinear experience. You can choose to retain the vignettes of the original game or to build it into a larger story. This project has a few constraints: work at 1024 x 768 pixels, use the Source Code Pro typeface, the screen background must be a solid color, the letters can be white or grayscale, no images. First, develop the idea and second, draw the gameboard in Illustrator of Photoshop. In class on Wednesday, bring a printed copy of the gameboard and we'll start to convert it into code. The mouse and/or keyboard may be used for the interface. As interesting challenges you may: use sound, load the text from a data file, include interative components. Post the code on the server by the start of class on the due date. [Note: Because of midterm reviews, the project will be due for Group A on Monday and Group B on Wednesday.] 



PROJECT 4: Perform

This project has clear technical and aesthetic objectives. One one hand, you will gain experience with object-oriented programming. On the other hand, you have the opportunity to explore the area of parameterized form in relation to facial expression. The objective for parameterizing the face is to depict a range of emotions. Use only a single variable value from 0 to 1024 to change the expression; base all of the changes on this single input.

First, select one of faces drafted by Bruno Munari. Next, sketch the way the face changes with input from the mouse and microphone -- does it change from angry to excited, from annoyed to extremely annoyed? Make three, one-page sketch series to explore three separate face ideas using this template.

Next, go through the exercises from Workshop 4 to build a Face class step by step. Start by drawing the face directly, then by writing a function to draw it, then finally build a class with fields, methods, and a constructor. You'll likely want to use the map() function to convert the values from mouseX into values that make sense in relation to your expression. After your program is working well with mouseX, convert it to work with sound input through your microphone. We'll demonstrate this on Wednesday. Pay attention to the subtle details of the facial expression.

Make your program 1024 x 768 pixels wide. Post the code on the server by the start of class on the due date. 



PROJECT 5: Animation

Create an interactive image/scene/illustration where the mouse triggers and/or stops events. In the tradition of interactive books, cd-roms, and video games, construct an environment that contains animated events. Think about a composition created from animated GIFs, but extend the idea to control when to stop, start, pause, and otherwise change the animation. The animations must be controlled through arrays. Develop the project idea and create placeholder images prior to class on Wednesday so you're ready to start coding at the start of class.

Remember the four primary mouse event functions, mousePressed(), mouseDragged(), mouseMoved(), and mouseReleased() as well as your knowledge about defining the location of a mouse event. Remember to load in small images with as few frames as possible to avoid memory issues. You are responsible for the look and feel of the project as well as the behavior. For the look and feel, keep in mind what you're good at and what you can do quickly. Do you love to draw, take photos, or make collages? Feel free with make your own animated sequences or to use existing animations. The primary goal for the project is to create an engaging interactive experience.

Make your program 1024 x 768 pixels wide. Post the code on the server by the start of class on the due date. 



PROJECT 6: Synthesis

Design a simple game in the tradition of ball and paddle games. First design three game variation using the provided template and in the manner explained in class through the example. (One piece of paper and six sketches for each game idea!) Arrive in class on Wednesday with finished sketches. Think about the game dynamics, for example keeping score, putting spin on the ball, adding more players. Think about the game aesthetics, for example, sound, graphics, feedback animation. Next, plan how to realize your game in code.Think about how you will use variables, functions, objects, and arrays. Start by making a series of short sketches to work through each piece of the game, then put them together into a single program. You may use the Pong_Foundation code example to start. If you keep the game similar to Pong, make a plan to extend the game in an inspired and extraordinary way. Make your program 1024 x 768 pixels wide. Post the code on the server by the start of class on the due date. 
