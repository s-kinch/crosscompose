CrossCompose

CrossCompose is a tool to create, share, and play crossword puzzles in the browser. Users can click the ‘Create’ tab to create a new crossword puzzle. Once saved, the puzzle will be playable at its own unique URL. All saved puzzles are searchable under the ‘Play’ tab.
A live demo of CrossCompose is up at https://crosscompose.herokuapp.com.


User Experience

A user can begin creating a crossword puzzle by clicking the ‘Create’ button in the top menu. A new puzzle is created with a default title, which the user can click to edit. Puzzle creation has two modes, ‘Text’ and ‘Layout,’ and begins in ‘Text’ mode. The user can click on the grid and type a letter in the selected square, and click to the right of across and down clue numbers to type clue text. The ‘Get Suggestions’ button searches for words that fit in the currently highlighted word on the grid, matching any letters already placed. Clicking on a suggested word places it on the grid. The user can switch to ‘Layout’ mode, in which clicking on a grid square toggles its color. The numbers on the grid and corresponding clue numbers will update accordingly. The user can turn radial symmetry on and can cycle through several default grid layouts. The percentages of black and white squares update with changes. When a puzzle is finished, pressing ‘Save’ redirects the user to the puzzle’s unique URL, where the puzzle is publicly playable.

The ‘Play’ button in the top menu takes a user to a list of all published puzzles and a search function. The user can click a puzzle’s name to play it. The user can click a square on the grid and begin typing. Clicking on a clue will highlight its corresponding space on the grid. With letters placed, a user can check if their answers are correct with the check square, word, and grid options. A correct letter turns dark green and an incorrect letter turns red. The reveal square, word, and grid options will place the correct answers on the grid.

In both ‘Create’ and ‘Play’ modes, the user can use the arrow keys to move the selected square. Tab and shift + tab move to the next and previous word, respectively. Double clicking a square or pressing the space bar toggles the selected direction between across and down.


Acknowledgements 

This is a final project from the Software Engineering Immersive program at the Flatiron School. Thanks to instructors Steven, Tashawn, and Graham for their help along the way.
