# How to add the problem `i`: 

Do the below three steps after the problem `i-1` is closed and before you open problem `i`. 

## Step 1: Update the google form 
In this [google form](https://docs.google.com/forms/d/e/1FAIpQLSdOjMebWrLTRUfTpYfd8AwvYOw65yvxv-B_DLCKahG3qng90A/viewform) update 
  - the title (the title should be e.g., "Problem 8: Problem Name", where 8 can be any number ) and
  - the response validation.
  
**Important:** Submissions will be sent to the directory `submissions/problem8/`, where `8` is the problem number defined in the title of the google form.   
  
## Step 2: trash old responses in the google form
Go to the form, then "Responses", then remove them all.

## Step 3: Update the main page `index.html`:
**The fast way**:
 use the `add-problem.py` script. Just run  `python3 add-problem.py [PROBLEM_NAME] [PROBLEM_URL] [PROBLEM_SOL]` from the command line, e.g. `python3 add-problem.py Sudoku "https://projecteuler.net/problem=96" 24702`. The script automatically overwrites `index.html` (and backs it up as `index.html.bkp`).

 **The other way**:
  - Update the current [submission number](https://github.com/coding19-imdea/coding19-imdea.github.io/blob/master/index.html#L6) to `i`, 
  so that the links to source code files of all previous submissions appears in `index.html` and  
  - add a new problem row (like [this](https://github.com/coding19-imdea/coding19-imdea.github.io/blob/master/index.html#L444-L480)). The row should containt a `<div id="submissions:i"></div>` element that will include the submissions and an `<div id="solution:i" value="sol"></div>` element that will be replaced by a reveal solution button. 
