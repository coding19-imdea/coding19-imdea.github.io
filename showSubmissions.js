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
submissions[0] = '<li>Alejandro Naser Pastoriza: ' + showcode(0,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem0/Pastoriza.cpp", "C++") + '</li>';
submissions[0] = submissions[0].concat('<li>Zack Grannan: ' + showcode(0,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem0/Grannan.hs", "Haskell") + '</li>');
submissions[0] = submissions[0].concat('<li>Alejandro Aguirre: ' + showcode(0,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem0/Aguirre.cpp", "C++") + '</li>');
submissions[0] = submissions[0].concat('<li>Cesar Sanchez: OCAML </li>');
submissions[0] = submissions[0].concat('<li>Matteo Campanelli: Rust </li>');
submissions[0] = submissions[0].concat('<li>Niki: Haskell </li>');
submissions[0] = submissions[0].concat('<li>Juan Cespedes: Go </li>');
submissions[0] = submissions[0].concat('<li>Ignacio Cascudo: Python </li>');
submissions[0] = submissions[0].concat('<li>Joakim \u00d6hman: Haskell</li>');
submissions[1] = '<li>Fedor: ' + showcode(1,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem1/fedor.ml", "OCaml") + '</li>';
submissions[1] = submissions[1].concat('<li>John Gallagher: ' + showcode(1,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem1/gallagher.pl", "Prolog") + '</li>');
submissions[1] = submissions[1].concat('<li>Ignacio Cascudo: ' + showcode(1,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem1/Ignacio.py", "Python") + '</li>');
submissions[1] = submissions[1].concat('<li>Cesar: ' + showcode(1,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem1/Cesar.ml", "OCaml") + '</li>');
submissions[1] = submissions[1].concat('<li>Isabel: ' + showcode(1,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem1/Isabel.pl", "Prolog") + '</li>');
submissions[1] = submissions[1].concat('<li>Alejandro Aguirre ' + showcode(1,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem1/Aguirre.hs", "Haskell") + '</li>');
submissions[2] = '<li>Nikita (12.46): ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/nikita.scm", "Scheme") + '</li>';
submissions[2] = submissions[2].concat('<li>Pastoriza (12.53): ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/pastoriza.cpp", "C++") + '</li>');
submissions[2] = submissions[2].concat('<li>Gallagher (12.58): ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/gallagher.pl", "Prolog") + '</li>');
submissions[2] = submissions[2].concat('<li>Aguirre: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/Aguirre.cpp", "C++") + '</li>');
submissions[2] = submissions[2].concat('<li>Mohammed Moanis: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/mohammedali.cc", "C++") + '</li>');
submissions[2] = submissions[2].concat('<li>Margarita Capretto: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/margaritacapretto.cpp", "C++") + '</li>');
submissions[2] = submissions[2].concat('<li>Fernando Macias: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/fernandomacias.go", "Go") + '</li>');
submissions[2] = submissions[2].concat('<li>Cascudo: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/cascudo.py", "Python") + '</li>');
submissions[2] = submissions[2].concat('<li>Cesar Sanchez: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/cesarsanchez.ml", "OCaml") + '</li>');
submissions[2] = submissions[2].concat('<li>Juan Cespedes: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/juancespedes.go", "Go") + '</li>');
submissions[2] = submissions[2].concat('<li>Niki Vazou: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/niki.hs", "Haskell") + '</li>');
submissions[2] = submissions[2].concat('<li>Zack Grannan: ' + showcode(2,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem2/grannan.hs", "Haskell") + '</li>');

if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Alejando Pastoriza: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/alejando pastoriza.cpp", "C++") + '</li>'
);
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Margarita: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/margarita.cpp", " C++") + '</li>'
);
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Mohamed Moanis: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/MohamedMoanis.cc", "C++") + '</li>'
);
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Cesar: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/Cesar.ml", "OCaml") + '</li>'
);
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Palandjian: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/Palandjian.py", "Python") + '</li>'
);
if (submissions[3] == undefined) {submissions[3] = "";}
submissions[3] = submissions[3].concat('<li>Ignacio Cascudo: ' + showcode(3,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem3/Ignacio.py", "Python") + '</li>'
);
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
if (submissions[6] == undefined) {submissions[6] = "";}
submissions[6] = submissions[6].concat('<li>Alejandro Aguirre: ' + showcode(6,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem6/Alejandro Aguirre.cpp", "C++") + '</li>'
);
if (submissions[6] == undefined) {submissions[6] = "";}
submissions[6] = submissions[6].concat('<li>Niki: ' + showcode(6,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem6/Niki.hs", "Haskell") + '</li>'
);
if (submissions[7] == undefined) {submissions[7] = "";}
submissions[7] = submissions[7].concat('<li>Palandjian: ' + showcode(7,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem7/Palandjian.c", "C") + '</li>'
);
if (submissions[7] == undefined) {submissions[7] = "";}
submissions[7] = submissions[7].concat('<li>Cesar: ' + showcode(7,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem7/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[7] == undefined) {submissions[7] = "";}
submissions[7] = submissions[7].concat('<li>Margarita: ' + showcode(7,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem7/Margarita.cpp", "C++") + '</li>'
);
if (submissions[7] == undefined) {submissions[7] = "";}
submissions[7] = submissions[7].concat('<li>Ale Naser Pastoriza: ' + showcode(7,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem7/Ale Naser Pastoriza.cpp", "C++") + '</li>'
);
if (submissions[7] == undefined) {submissions[7] = "";}
submissions[7] = submissions[7].concat('<li>Fedor: ' + showcode(7,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem7/Fedor.ml", "OCaml") + '</li>'
);
if (submissions[7] == undefined) {submissions[7] = "";}
submissions[7] = submissions[7].concat('<li>Matteo Campanelli: ' + showcode(7,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem7/Matteo Campanelli.py", "Python") + '</li>'
);
if (submissions[8] == undefined) {submissions[8] = "";}
submissions[8] = submissions[8].concat('<li>Ignacio Cascudo: ' + showcode(8,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem8/Ignacio Cascudo.py", "Python") + '</li>'
);
if (submissions[9] == undefined) {submissions[9] = "";}
submissions[9] = submissions[9].concat('<li>Margarita: ' + showcode(9,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem9/Margarita.cpp", "C++") + '</li>'
);
if (submissions[9] == undefined) {submissions[9] = "";}
submissions[9] = submissions[9].concat('<li>Ale Naser Pastoriza: ' + showcode(9,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem9/Ale Naser Pastoriza.cpp", "C++") + '</li>'
);
if (submissions[9] == undefined) {submissions[9] = "";}
submissions[9] = submissions[9].concat('<li>Cesar: ' + showcode(9,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem9/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[9] == undefined) {submissions[9] = "";}
submissions[9] = submissions[9].concat('<li>Ignacio Cascudo: ' + showcode(9,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem9/Ignacio Cascudo.py", "Python") + '</li>'
);
if (submissions[9] == undefined) {submissions[9] = "";}
submissions[9] = submissions[9].concat('<li>Matteo Campanelli: ' + showcode(9,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem9/Matteo Campanelli.cc", "C++") + '</li>'
);
if (submissions[10] == undefined) {submissions[10] = "";}
submissions[10] = submissions[10].concat('<li>Margarita: ' + showcode(10,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem10/Margarita.cpp", "C++") + '</li>'
);
if (submissions[10] == undefined) {submissions[10] = "";}
submissions[10] = submissions[10].concat('<li>Alejandro Aguirre: ' + showcode(10,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem10/Alejandro Aguirre.py", "Python") + '</li>'
);
if (submissions[10] == undefined) {submissions[10] = "";}
submissions[10] = submissions[10].concat('<li>Cesar: ' + showcode(10,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem10/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[10] == undefined) {submissions[10] = "";}
submissions[10] = submissions[10].concat('<li>Ale Naser Pastoriza: ' + showcode(10,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem10/Ale Naser Pastoriza.cpp", "C++") + '</li>'
);
if (submissions[10] == undefined) {submissions[10] = "";}
submissions[10] = submissions[10].concat('<li>Ignacio Cascudo: ' + showcode(10,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem10/Ignacio Cascudo.py", "Python") + '</li>'
);
