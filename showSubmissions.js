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
if (submissions[11] == undefined) {submissions[11] = "";}
submissions[11] = submissions[11].concat('<li>Margarita: ' + showcode(11,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem11/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[11] == undefined) {submissions[11] = "";}
submissions[11] = submissions[11].concat('<li>Cesar: ' + showcode(11,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem11/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[12] == undefined) {submissions[12] = "";}
submissions[12] = submissions[12].concat('<li>Margarita: ' + showcode(12,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem12/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[12] == undefined) {submissions[12] = "";}
submissions[12] = submissions[12].concat('<li>Cesar: ' + showcode(12,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem12/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[12] == undefined) {submissions[12] = "";}
submissions[12] = submissions[12].concat('<li>Ale Naser Pastoriza: ' + showcode(12,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem12/Ale Naser Pastoriza.cpp", "C++") + '</li>'
                                        );
if (submissions[12] == undefined) {submissions[12] = "";}
submissions[12] = submissions[12].concat('<li>Ignacio Cascudo: ' + showcode(12,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem12/Ignacio Cascudo.py", "Python (+alternative algebra approach)") + '</li>'
                                        );
if (submissions[13] == undefined) {submissions[13] = "";}
submissions[13] = submissions[13].concat('<li>Margarita: ' + showcode(13,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem13/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[13] == undefined) {submissions[13] = "";}
submissions[13] = submissions[13].concat('<li>Cesar: ' + showcode(13,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem13/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[14] == undefined) {submissions[14] = "";}
submissions[14] = submissions[14].concat('<li>Margarita: ' + showcode(14,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem14/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[14] == undefined) {submissions[14] = "";}
submissions[14] = submissions[14].concat('<li>Cesar: ' + showcode(14,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem14/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[14] == undefined) {submissions[14] = "";}
submissions[14] = submissions[14].concat('<li>Ignacio Cascudo: ' + showcode(14,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem14/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
if (submissions[15] == undefined) {submissions[15] = "";}
submissions[15] = submissions[15].concat('<li>Margarita: ' + showcode(15,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem15/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[15] == undefined) {submissions[15] = "";}
submissions[15] = submissions[15].concat('<li>Ignacio Cascudo: ' + showcode(15,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem15/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
if (submissions[15] == undefined) {submissions[15] = "";}
submissions[15] = submissions[15].concat('<li>Cesar: ' + showcode(15,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem15/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[16] == undefined) {submissions[16] = "";}
submissions[16] = submissions[16].concat('<li>Cesar: ' + showcode(16,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem16/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[16] == undefined) {submissions[16] = "";}
submissions[16] = submissions[16].concat('<li>Ignacio Cascudo: ' + showcode(16,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem16/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
if (submissions[16] == undefined) {submissions[16] = "";}
submissions[16] = submissions[16].concat('<li>Ale Naser Pastoriza: ' + showcode(16,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem16/Ale Naser Pastoriza.cpp", "C++") + '</li>'
                                        );
if (submissions[17] == undefined) {submissions[17] = "";}
submissions[17] = submissions[17].concat('<li>Ale Naser Pastoriza: ' + showcode(17,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem17/Ale Naser Pastoriza.cpp", "C++") + '</li>'
                                        );
submissions[18]="";
if (submissions[19] == undefined) {submissions[19] = "";}
submissions[19] = submissions[19].concat('<li>Margarita: ' + showcode(19,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem19/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[19] == undefined) {submissions[19] = "";}
submissions[19] = submissions[19].concat('<li>Ignacio Cascudo: ' + showcode(19,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem19/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
if (submissions[20] == undefined) {submissions[20] = "";}
submissions[20] = submissions[20].concat('<li>Margarita: ' + showcode(20,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem20/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[20] == undefined) {submissions[20] = "";}
submissions[20] = submissions[20].concat('<li>Ale Naser Pastoriza: ' + showcode(20,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem20/Ale Naser Pastoriza.cpp", "C++") + '</li>'
                                        );
if (submissions[20] == undefined) {submissions[20] = "";}
submissions[20] = submissions[20].concat('<li>Cesar: ' + showcode(20,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem20/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[21] == undefined) {submissions[21] = "";}
submissions[21] = submissions[21].concat('<li>Ignacio Cascudo: ' + showcode(21,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem21/Ignacio Cascudo.IgnacioCascudo-music - Ignacio Cascudo", "human") + '</li>'
                                        );
if (submissions[23] == undefined) {submissions[23] = "";}
submissions[23] = submissions[23].concat('<li>Cesar: ' + showcode(23,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem23/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[23] == undefined) {submissions[23] = "";}
submissions[23] = submissions[23].concat('<li>Margarita: ' + showcode(23,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem23/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[22] == undefined) {submissions[22] = "";}
submissions[22] = submissions[22].concat('<li>Cesar: ' + showcode(22,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem22/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[23] == undefined) {submissions[23] = "";}
submissions[23] = submissions[23].concat('<li>Ignacio Cascudo: ' + showcode(23,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem23/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
submissions[24]="";
if (submissions[25] == undefined) {submissions[25] = "";}
submissions[25] = submissions[25].concat('<li>Cesar: ' + showcode(25,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem25/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[25] == undefined) {submissions[25] = "";}
submissions[25] = submissions[25].concat('<li>Margarita: ' + showcode(25,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem25/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[25] == undefined) {submissions[25] = "";}
submissions[25] = submissions[25].concat('<li>Ignacio Cascudo: ' + showcode(25,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem25/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
if (submissions[26] == undefined) {submissions[26] = "";}
submissions[26] = submissions[26].concat('<li>Margarita: ' + showcode(26,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem26/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[26] == undefined) {submissions[26] = "";}
submissions[26] = submissions[26].concat('<li>Ignacio Cascudo: ' + showcode(26,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem26/Ignacio Cascudo.py", "Python") + '</li>'
                                        );
if (submissions[27] == undefined) {submissions[27] = "";}
submissions[27] = submissions[27].concat('<li>Margarita: ' + showcode(27,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem27/Margarita.cpp", "c++") + '</li>'
                                        );
if (submissions[28] == undefined) {submissions[28] = "";}
submissions[28] = submissions[28].concat('<li>Margarita: ' + showcode(28,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem28/Margarita.cpp", "c++") + '</li>'
                                        );
if (submissions[30] == undefined) {submissions[30] = "";}
submissions[30] = submissions[30].concat('<li>Cesar: ' + showcode(30,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem30/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[31] == undefined) {submissions[31] = "";}
submissions[31] = submissions[31].concat('<li>Margarita: ' + showcode(31,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem31/Margarita.cpp", "c++") + '</li>'
                                        );
if (submissions[31] == undefined) {submissions[31] = "";}
submissions[31] = submissions[31].concat('<li>Cesar: ' + showcode(31,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem31/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[33] == undefined) {submissions[33] = "";}
submissions[33] = submissions[33].concat('<li>Cesar: ' + showcode(33,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem33/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[34] == undefined) {submissions[34] = "";}
submissions[34] = submissions[34].concat('<li>Cesar: ' + showcode(34,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem34/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[34] == undefined) {submissions[34] = "";}
submissions[34] = submissions[34].concat('<li>Margarita: ' + showcode(34,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem34/Margarita.cpp", "C++") + '</li>'
                                        );
submissions[29]="";
submissions[32]="";
submissions[35]="";

if (submissions[36] == undefined) {submissions[36] = "";}
submissions[36] = submissions[36].concat('<li>Cesar: ' + showcode(36,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem36/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[36] == undefined) {submissions[36] = "";}
submissions[36] = submissions[36].concat('<li>Margarita: ' + showcode(36,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem36/Margarita.cpp", "C++") + '</li>'
                                        );
if (submissions[37] == undefined) {submissions[37] = "";}
submissions[37] = submissions[37].concat('<li>margarita: ' + showcode(37,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem37/margarita.cpp", "c++") + '</li>'
                                        );
if (submissions[37] == undefined) {submissions[37] = "";}
submissions[37] = submissions[37].concat('<li>Cesar: ' + showcode(37,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem37/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[39] == undefined) {submissions[39] = "";}
submissions[39] = submissions[39].concat('<li>margarita: ' + showcode(39,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem39/margarita.cpp", "c++") + '</li>'
                                        );
if (submissions[39] == undefined) {submissions[39] = "";}
submissions[39] = submissions[39].concat('<li>Cesar: ' + showcode(39,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem39/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[41] == undefined) {submissions[41] = "";}
submissions[41] = submissions[41].concat('<li>Cesar: ' + showcode(41,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem41/Cesar.ml", "ocaml") + '</li>'
                                        );
if (submissions[41] == undefined) {submissions[41] = "";}
submissions[41] = submissions[41].concat('<li>Margarita: ' + showcode(41,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem41/Margarita.cpp", "C++") + '</li>'
                                        );

submissions[38]="";
submissions[40]="";
submissions[42]="";
submissions[43]="";
submissions[44]="";

if (submissions[45] == undefined) {submissions[45] = "";}
submissions[45] = submissions[45].concat('<li>Lisa: ' + showcode(45,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem45/Lisa.cpp", "C++") + '</li>'
);
if (submissions[45] == undefined) {submissions[45] = "";}
submissions[45] = submissions[45].concat('<li>Cesar: ' + showcode(45,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem45/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[45] == undefined) {submissions[45] = "";}
submissions[45] = submissions[45].concat('<li>Fedor: ' + showcode(45,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem45/Fedor.ml", "ocaml") + '</li>'
);
if (submissions[45] == undefined) {submissions[45] = "";}
submissions[45] = submissions[45].concat('<li>Ale: ' + showcode(45,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem45/Ale.cpp", "c++") + '</li>'
);
if (submissions[45] == undefined) {submissions[45] = "";}
submissions[45] = submissions[45].concat('<li>Marga: ' + showcode(45,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem45/Marga.cpp", "c++") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Fernando: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Fernando.go", "Go") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Fedor: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Fedor.go", "go") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Cesar: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Niki: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Niki.hs", "Haskell") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Luka: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Luka.rkt", "Racket") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Lydia: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Lydia.c", "C") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Louis-Marie: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Louis-Marie.py", "Python") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Diego: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Diego.py", "python") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Martín: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Martín.hs", "Haskell") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Marga: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Marga.cpp", "c++") + '</li>'
);
if (submissions[46] == undefined) {submissions[46] = "";}
submissions[46] = submissions[46].concat('<li>Ale: ' + showcode(46,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem46/Ale.cpp", "c++") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Cesar: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Cesar.ml", "ocaml") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Louis-Marie DANDO: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Louis-Marie DANDO.spl", "Shakespear Programming Language") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Lydia: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Lydia.c", "C") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Lisa: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Lisa.cpp", "C++") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Niki: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Niki.rs", "Rust") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Fedor: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Fedor.go", "go") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Ale: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Ale.cpp", "c++") + '</li>'
);
if (submissions[47] == undefined) {submissions[47] = "";}
submissions[47] = submissions[47].concat('<li>Marga: ' + showcode(47,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem47/Marga.cpp", "c++") + '</li>'
);
if (submissions[48] == undefined) {submissions[48] = "";}
submissions[48] = submissions[48].concat('<li>Niki: ' + showcode(48,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem48/Niki.rs", "Rust") + '</li>'
);
if (submissions[48] == undefined) {submissions[48] = "";}
submissions[48] = submissions[48].concat('<li>Fedor: ' + showcode(48,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem48/Fedor.ml", "ocaml") + '</li>'
);
if (submissions[48] == undefined) {submissions[48] = "";}
submissions[48] = submissions[48].concat('<li>Juan Manuel Copia: ' + showcode(48,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem48/Juan Manuel Copia.py", "Python") + '</li>'
);
if (submissions[48] == undefined) {submissions[48] = "";}
submissions[48] = submissions[48].concat('<li>Martin: ' + showcode(48,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem48/Martin.hs", "Haskell") + '</li>'
);
if (submissions[48] == undefined) {submissions[48] = "";}
submissions[48] = submissions[48].concat('<li>Ale: ' + showcode(48,"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/submissions/problem48/Ale.cpp", "c++") + '</li>'
);
