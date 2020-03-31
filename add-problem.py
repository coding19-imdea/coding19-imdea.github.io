from sys import argv,exit
from os import listdir
from bs4 import BeautifulSoup
import re
import datetime
import shutil

def get_tr_str(probName, probURL, curSubmNum, deadlineStrLnk, deadlineStrUser):
    return \
        f"""
        <!--Start Problem {curSubmNum}: {probName}-->
        <tr>
        <td>{curSubmNum}</td> <!-- NB: Problem counter here -->
        <td><a href="https://www.timeanddate.com/countdown/generic?iso={deadlineStrLnk}&amp;p0=141&amp;font=cursive" target="_blank">{deadlineStrUser}</a></td>
        <td><a href="{probURL}" target="_blank">{probName}</a></td>
        <td><a href="https://forms.gle/8n1jTaPT9XqMyFeF9" target="_blank">Submit</a></td>
        <td>
        <button class="collapsible" type="button">Check Submissions</button>
        <div class="content">
        <p><ol>
        <div id="submissions{curSubmNum}"></div>
        </ol> </p>
        </div> </td>
        </tr>
        """


def get_deadline_strs():
    todayDate = datetime.date.today()
    isTodayFriday = todayDate.weekday == 4 # 0 = Monday, 1 = Tuesday, etc.
    # deadline is tomorrow if it's not Friday, else Monday
    delta = 1 if not isTodayFriday else 3
    deadlineDate = todayDate + datetime.timedelta(days=delta)
    return (deadlineDate.strftime("%Y%m%d") + "T12", "12:00 CET, " + deadlineDate.strftime("%d/%m/%d"))

def getUpdatedHtmlStr(probName, probURL):
    html_doc = open('index.html').read()
    soup = BeautifulSoup(html_doc, 'html.parser')

    # == Update submission number ==
    submScriptTag = [t for t in soup.find_all("script") \
        if "var currentSubmission" in str(t)][0]

    curSubmNum = int(submScriptTag.contents[0].split()[-1])
    curSubmNum += 1
    newContent = f" var currentSubmission = {curSubmNum} "
    submScriptTag.contents[0].replaceWith(newContent)

    # == Add row to table ==
    probsTbl = soup.find("table", {'id':'problems'})

    deadlineStrs = get_deadline_strs()
    formattedTrStr = get_tr_str(probName, probURL, curSubmNum, deadlineStrs[0], deadlineStrs[1])
    newTr = BeautifulSoup(formattedTrStr, "html.parser")
    probsTbl.append(newTr)

    return soup.prettify()





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
        print("Usage: python3 add-problem.py [PROBLEM_NAME] [PROBLEM_URL]")
        exit(1)

    probName = argv[1]
    probUrl = argv[2]

    new_html = getUpdatedHtmlStr(probName, probUrl)

    # Backup index.html
    shutil.copyfile('index.html', 'index.html.bkp')

    # Replace index.html
    with open("index.html", "w") as index_file:
        index_file.write(new_html)