
# STC Tour but with Mario walking around it

A basic game made using Godot where you can tour the STC building 

## Instructions for Build and Use

Steps to build and/or run the software:

1. Download the executable for Godot, found here: [Windows Godot Download](https://godotengine.org/download/windows/)
2. Download the zip file for this repository (or clone it onto your machine)
3. Open the Godot executable (no install necessary)
4. Open the downloaded project folder
5. Click the run button in the top right corner
6. You will get an error for invalid variables or something, go to the debugger console
7. Click "Ignore Error Breaks" (The red bell icon)
8. Click play again, and the game should now receive input

Instructions for using the software:

1. Open the downloaded project folder in Godot after opening the Godot executable
2. Click the run button in the top right corner
3. You will get an error for invalid variables or something, go to the debugger console
4. Click "Ignore Error Breaks" (The red bell icon)
5. Click play again, and the game should now receive input
6. Freely walk around the STC building! There is no objective currently, but you can switch floors if you so choose by going to any of the stairs in the building

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

* Latest version of Godot
* I'm not sure if there's anything else, this was all done via the vanilla tools

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [ChatGPT](https://chatgpt.com/)
* [Youtube (this video in particular)](https://www.youtube.com/watch?v=u2fwxuHZXIA&t=242s)
* [Godot documentation](https://docs.godotengine.org/en/stable/getting_started/step_by_step/nodes_and_scenes.html)

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Fix the jittering character sprite, I think that's a combination of not getting the sprites in the sprite sheet centered enough and some Godot weirdness
* [ ] Find a way to skew the map for better player feel, because otherwise the map feels too huge, but the collision was easier to design for scale rather than making doors arbitrarily bigger
* [ ] Ideally I'd have used the pegman from google maps for the character sprite, he would've meshed better with the plain map aesthetic, but alas he had no walking animation. I'd have to make them myself
