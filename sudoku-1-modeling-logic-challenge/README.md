# Sudoku 1 Modeling Logic

##Learning Competencies

* Model a simple real-world system in Ruby code
* Use Pseudocode effectively to model problem-solving
* Practice single responsibility of methods
* Practice effective naming of variables and methods

##Summary

By the end of the next two challenges you'll have a fully-functioning Sudoku solver that you can run from the command line.

[Sudoku](http://en.wikipedia.org/wiki/Sudoku) is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called "boxes") contains all of the digits from 1 to 9.

The person who created the puzzle provides a partial solution so that some squares already have numbers. Typically, there are enough initial numbers to guarantee a unique solution.

![Unsolved Sudoku](board_images/unsolved_board.gif)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![Solved Sudoku](board_images/solved_board.gif)

For the first iteration, we're just going build a solver that fills in "logically necessary" squares and requires no guessing.

##Releases

###Pre-release: Modeling

#### 1) Write down the nouns and verbs of the game

Think carefully about all the nouns and verbs in a Sudoku game. There's the person who created the puzzle (the setter). There's the person who is solving the puzzle (the player). What are the important parts of the board called? How do the player and setting interact with them?

A computer program that solves Sudoku is simulating the *player*, which means the better you can empathize with the player the more likely you'll understand how to write a Sudoku solver. You'll be tempted to focus on the board first—is it some kind of array, a hash, something else?—but don't! Understanding the person playing the game is key, the code to "power" the board is a detail.

#### 2) Strategies for Humans

Get out an actual Sudoku puzzle, printed on a piece of paper. Play it with your pair. Pay attention to yourself and to each other.

1. What strategies are you adopting and why?
2. How do you choose where to start?
3. How do you know when to really put a number in a cell?
4. Did you adopt the same notation/board markings while playing Sudoku? Why? If not, why did you choose differently?
5. Are you avoiding any strategies because they're too tedious or require you to remember too much?

It's important to see that sometimes the strategies that work for us (humans) would be really hard to implement on a computer, and vice versa: strategies we avoid because we'd have to write too much, use too many sheets of paper, or remember too much are a cakewalk for a computer.

#### 3) Pseudocode for First Iteration

Remember, for the first iteration, we're just going build a solver that fills in "logically necessary" squares and requires no guessing. This might not solve every Sudoku board, although it often solves the easiest. How can you tell when you've filled in all the "logically necessary" squares?  What steps that are part of your algorithm can be encapsulated into well-named methods? 

For example, one step in the process will likely be finding all the neighboring cell values for a current cell.  This step can be broken down into at least three methods:

1. Return the cell values in a current cells's row.
1. Return the cell values in a current cells's column.
1. Return the cell values in a current cells's box.

Applying single responsibility to your methods and naming them succinctly can make this challenge much more manageable!


###Release 0 :  Code your algorithm

**Write a Sudoku solver that can solve a simple Sudoku puzzle.**

#### Details
- You will write a `Sudoku` class, the beginnings of which can be found in the `source/sudoku.rb` file.  Your solver will be an instance of this class; see the driver code provided in the `source/runner.rb` file.


- A solver is instantiated with a `String` representing an unsolved Sudoku board as its argument.  Unsolved squares are marked with a `"-"`.  Solved squares have a character from `"1"` to `"9"`.

  For example:

  `'---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'`

- The `Sudoku` class should have an instance method `#board` that returns the current state of the board in the same format as the argument passed in when instantiating a solver (i.e., an 81-character string).

- The `Sudoku` class should have an instance method `#solve` that attempts to solve the board.  

- Be sure to write the `Sudoku#to_s` method, so that you can see what your board looks like after running the `Sudoku#solve` method.  A `#to_s` method determines how an object is represented in string-form; it should return a `String` object, not `puts` anything to the console.

After defining the `#to_s` method, running the following code ...

```ruby
board = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

game = Sudoku.new(board)
puts game
```

would print something like this:

```text
- - - 2 6 - 7 - 1
6 8 - - 7 - - 9 -
1 9 - - - 4 5 - -
8 2 - 1 - - - 4 -
- - 4 6 - 2 9 - -
- 5 - - - 3 - 2 8
- - 9 3 - - - 7 4
- 4 - - 5 - - 3 6
7 - 3 - 1 8 - - -
```

#### Focus on the MVP 

Part of being a good developer is knowing what NOT to worry about in your first iteration.  Here's some examples of non-core functionality:

- The particular format of the board when printed. The key thing is getting the logic around solving/guessing correctly, not the prettiest display of the board.  Get some help if the `Sudoku#to_s` method is taking a lot of your time.

- Performance.  Don't worry about performance yet! Optimizations can come later. Clean, logical code is more important and will be easier to refactor.


Focus on solving the first board included in `runner.rb`.  Again, **note**, this first iteration might not solve every possible Sudoku board.  We'll create a more powerful solver in the next challenge.


#### Hint: Use good tests to develop your solution

Remember, starting with a simple test case can be very helpful when approaching complicated problems. For a Sudoku solver, what's the simplest case? (besides being passed an already solved board.) Try working with a board that is only missing one number:

```
4-5269781682571493197834562826195347374682915951743628519326874248957136763418259
```

### Release 1: Test for multiple cases and add reporting

Make sure your solver works for all 5 of the simple puzzles included in the `sudoku_puzzles.txt` file.  The first five puzzles are 'simple' and can be solved with basic logic by identifying when a square has only one possible value.  The successive puzzles in the file are increasingly more difficult.

What happens when your solver reaches a puzzle it cannot solve?  Stuck in an infinite loop?  **Upgrade your solver so it reports when it encounters a puzzle that is beyond it's algorithmic capability, and ends gracefully.**

Move on to Sudoku 2 if you're ready to tackle more complex puzzles.


