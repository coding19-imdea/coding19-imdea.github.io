# How to add the problem `i`: 

Do the below three steps after the problem `i-1` is closed and before you open problem `i`. 

## Step 1: Update the google form 
In this [google form](https://docs.google.com/forms/d/e/1FAIpQLSdOjMebWrLTRUfTpYfd8AwvYOw65yvxv-B_DLCKahG3qng90A/viewform) update 
  - the title and
  - the response validation.
  
## Step 2: Update the google script
  - In the same google form open the script editor and update the [problemNumber](https://github.com/coding19-imdea/coding19-imdea.github.io/blob/master/scripts/google-form.gs#L4) to `":i"`.
  
**Important:** this update should happen in the google form script, not in this github repo!
  
This is required to 1/add the submission entries in the index.html and 2/sent the submitted source code files to the directory `submissions/problem:i/`.

## Step 3: trash old responses in the google form
Go to the form, then "Responses", then remove them all.

## Step 4: Update the main page `index.html`:
**The fast way**:
 use the `add-problem.py` script. Just run  `python3 add-problem.py [PROBLEM_NAME] [PROBLEM_URL]` from the command line, e.g. `python3 add-problem.py Sudoku "https://projecteuler.net/problem=96"`. The script automatically overwrites `index.html` (and backs it up as `index.html.bkp`).

 **The other way**:
  - Update the current [submission number](https://github.com/coding19-imdea/coding19-imdea.github.io/blob/master/index.html#L5) to `i`, 
  so that the links to source code files of all previous submissions appears in `index.html` and 
  - add a new problem row (like [this](https://github.com/coding19-imdea/coding19-imdea.github.io/blob/master/index.html#L179-L193)), 
  the new submissions will appear inside the `<div id="submissions:i"></div>` element. 
