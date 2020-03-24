from sys import argv,exit
from os import listdir

ext2lang = {
    'ml' : "OCaml",
    'py' : "Python",
    'c' : "C",
    'cc' : "C++",
    'cpp' : "C++",
    'cxx' : "C++",
    'rs' : "Rust",
    'pl' : "Prolog",
    'scm' : "Scheme",
    'hs' : "Haskell",
    'java' : "Java",
    'go' : "Go"
}

if __name__=='__main__':
    if len(argv) < 3:
        print("Usage: python3 process-submissions.py [PROBLEM_NUMBER] [full|nosource]")
        exit(1)

    prob_num = argv[1]
    output_type = argv[2]

    submissions_raw = listdir(f"submissions/problem{prob_num}")
    name_ext_lst = [x.split('.') for x in submissions_raw]

    for name, ext in name_ext_lst:
        if ext not in ext2lang:
            print("Cannot find mapping for extension ." + ext + " - Please add it to mapping and try again.")
            exit(1)
        lang = ext2lang[ext]
        if output_type == "nosource":
            print(f"<li><b>{name.title()}: {lang}</b></li>")
        else: # Assume full
            print(f"<li><b>{name.title()}: <a target=\"_blank\" href=\"submissions/problem1/{name}.{ext}\">{lang}</a></b></li>")




