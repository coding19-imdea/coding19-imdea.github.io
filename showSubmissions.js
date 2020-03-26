var submissions = [];

function loadSubmissions() {
    var i;
    for (i = 0; i < submissions.length; i++) {
        if (document.getElementById("submissions"+i) !== null){
         document.getElementById("submissions"+i).innerHTML = submissions[i];
    }
   }

  }

 function showcode(i,filename,language){
    if (i < currentSubmission) {
        var tmp = ('<a target="_blank" href="' + filename + '>' + language +'</a>');
        console.log("tmp = " + tmp);
        return '<a target="_blank" href="' + filename + '">' + language +  '</a>'; 
     }
     else {
        return language;
     }
  }


/* Assumption: the place that submissions of problem will get 
inserted has <div id="submissionsi"></div> */

/* The following should get created for each new submission of problem i
if (submissions[i] == undefined) {
    submissions[i] = "";
}
submissions[i] = submissions[i].concat('<li>name: ' + showcode(i,filename,language) + '</li>');
*/
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Alejandro Aguirre: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/Alejandro Aguirre.cpp", "C++") + '</li>'
);
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Matteo Campanelli: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/Matteo%20Campanelli.py", 'Python') + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>Fernando Macías: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Fernando Macías.go", "Go") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>Mohamed Moanis: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Mohamed Moanis.cc", "C++") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>David Munuera: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/David Munuera.hs", "Haskell") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>Ale Naser Pastoriza: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Ale Naser Pastoriza.cpp", "C++") + '</li>'
);
