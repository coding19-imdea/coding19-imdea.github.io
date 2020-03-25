var submissions = [];

function loadSubmissions() {
    var i;
    console.log(submissions.length);
    for (i = 0; i < submissions.length; i++) {
        console.log(i);
        console.log(submissions[i]);
        console.log("submissions"+i);
        console.log(document.getElementById("submissions"+i));
        if (document.getElementById("submissions"+i) !== null){
         document.getElementById("submissions"+i).innerHTML = submissions[i];
    }
   }

  }

/* Assumption: the place that submissions of problem will get 
inserted has <div id="submissionsi"></div> */

/* The following should get created for each new submission of problem i
if (submissions[i] == undefined) {
    submissions[i] = "";
}
submissions[i] = submissions[i].concat("<li>submission entry!</li>");
*/
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat(<li>Niki: <a target="_blank" href="https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Niki.hs">Haskell</a></li>
);
