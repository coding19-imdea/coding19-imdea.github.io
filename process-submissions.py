from sys import argv,exit
from os import listdir
from bs4 import BeautifulSoup
import re

def get_cur_submissions_in_order(prob_num):
    html_doc = open('index.html').read()
    soup = BeautifulSoup(html_doc, 'html.parser')

    cur_order = []

    try:
        cnt = soup.find_all(class_="content")[prob_num]
        items = cnt.find_all("li")

        pattern = f"problem{prob_num}/(.*)\" "
        for i,x in enumerate(items):
            # find filename
            id = re.search(pattern, str(x)).group(1)
            cur_order.append(id)
        return cur_order
    except:
        return []


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

    cur_submissions = get_cur_submissions_in_order(int(prob_num))

    submissions_from_file = listdir(f"submissions/problem{prob_num}")

    part_sorted_submissions = cur_submissions.copy()
    for subm in submissions_from_file:
        if subm not in cur_submissions:
            part_sorted_submissions.append(subm)

    name_ext_lst = [x.split('.') for x in part_sorted_submissions]

    for name, ext in name_ext_lst:
        if ext not in ext2lang:
            print("Cannot find mapping for extension ." + ext + " - Please add it to mapping and try again.")
            exit(1)
        lang = ext2lang[ext]
        if output_type == "nosource":
            print(f"<li><b>{name.title()}: <!--<a target=\"_blank\" href=\"submissions/problem{prob_num}/{name}.{ext}\">-->{lang}<!--</a>--></b></li>")
        else: # Assume full
            print(f"<li><b>{name.title()}: <a target=\"_blank\" href=\"submissions/problem{prob_num}/{name}.{ext}\">{lang}</a></b></li>")




