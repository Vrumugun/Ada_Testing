# Prompt

I'm trying to learn the Ada programming language. Give me an idea as a first simple exercise.

# Reply

A good first exercise in a new language should be small, but touch the core concepts you’ll use all the time. For Ada, that means: strong typing, procedures, and basic I/O.

# 👉 Exercise: “Interactive Temperature Converter”

Write a simple Ada program that:

- Asks the user to enter a temperature in Celsius
- Converts it to Fahrenheit
- Prints the result
- Repeats until the user chooses to exit

# 💡 What you’ll practice

- Defining a procedure (Ada’s main program structure)
- Using Float types (Ada is strict about types)
- Input/output with Ada.Text_IO and Ada.Float_Text_IO
- Simple arithmetic
- Loops (loop ... exit when)

# 🧠 Extra challenges (after the basic version works)

- Add conversion in both directions (C ↔ F)
- Validate input (handle invalid numbers)
- Format output nicely (e.g. 2 decimal places)
- Split logic into separate procedures (e.g. Convert_To_Fahrenheit)

# ✨ Why this is a good first step

Unlike something like “Hello World”, this forces you to deal with Ada’s strict typing and modularity, which is exactly what makes it popular in safety-critical domains (like the kind of systems governed by standards such as DO-178C).

If you want, I can give you a clean “idiomatic Ada” solution after you try it—or we can step it up to something closer to embedded/safety-critical patterns (which might be more relevant for you).
