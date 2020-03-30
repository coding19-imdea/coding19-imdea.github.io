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
submissions[4] = submissions[4].concat('<li>Ale Naser: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Ale Naser.cpp", "C++") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>Niki: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Niki.hs", "Haskell") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>Cesar: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>John Gallagher: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/John Gallagher.pl", "Prolog") + '</li>'
);
if (submissions[4] == undefined) {submissions[4] = "";}
submissions[4] = submissions[4].concat('<li>Ignacio Cascudo: ' + showcode(4,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem4/Ignacio Cascudo.py", "Python") + '</li>'
);
if (submissions[5] == undefined) {submissions[5] = "";}
submissions[5] = submissions[5].concat('<li>Margarita: ' + showcode(5,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem5/Margarita.cpp", "C++") + '</li>'
);
if (submissions[5] == undefined) {submissions[5] = "";}
submissions[5] = submissions[5].concat('<li>Ignacio Cascudo: ' + showcode(5,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem5/Ignacio Cascudo.py", "Python") + '</li>'
);
if (submissions[5] == undefined) {submissions[5] = "";}
submissions[5] = submissions[5].concat('<li>Ale Naser Pastoriza: ' + showcode(5,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem5/Ale Naser Pastoriza.cpp", "C++") + '</li>'
);
if (submissions[6] == undefined) {submissions[6] = "";}
submissions[6] = submissions[6].concat('<li>Ale Naser Pastoriza: ' + showcode(6,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem6/Ale Naser Pastoriza.cpp", "C++") + '</li>'
);
if (submissions[6] == undefined) {submissions[6] = "";}
submissions[6] = submissions[6].concat('<li>Cesar: ' + showcode(6,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem6/Cesar.ml", "ocaml") + '</li>'
);
