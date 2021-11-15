from sys import argv,exit
from os import listdir
from bs4 import BeautifulSoup
import re
import datetime
import shutil

def get_tr_str(probName, probURL, probSol, curSubmNum, deadlineStrLnk, deadlineStrUser):
    return \
        f"""
        <!--Start Problem {curSubmNum}: {probName}-->
        <tr>
        <td>{curSubmNum}</td> <!-- NB: Problem counter here -->
        <td><a href="https://www.timeanddate.com/countdown/generic?iso={deadlineStrLnk}&amp;p0=141&amp;font=cursive" target="_blank">{deadlineStrUser}</a></td>
        <td><a href="{probURL}" target="_blank">{probName}</a></td>
        <td><div id="solution{curSubmNum}" value="{probSol}"><a href="https://forms.gle/4H96mwVDmHL6CVvE7" target="_blank">Submit</a></div></td>
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
    #isTodayFriday = todayDate.weekday() == 4 # 0 = Monday, 1 = Tuesday, etc.
    # deadline is in a week
    delta = 7 # if not isTodayFriday else 3 # Deadline is two days unless it's Friday
    deadlineDate = todayDate + datetime.timedelta(days=delta)
    return (deadlineDate.strftime("%Y%m%d") + "T12", "12:00 CET, " + deadlineDate.strftime("%d/%m/%Y"))

def getUpdatedHtmlStr(probName, probURL,probSol):
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
    formattedTrStr = get_tr_str(probName, probURL, probSol, curSubmNum, deadlineStrs[0], deadlineStrs[1])
    newTr = BeautifulSoup(formattedTrStr, "html.parser")
    probsTbl.insert(2,newTr)

    return soup.prettify()



if __name__=='__main__':

    if len(argv) < 3:
        print("Usage: python3 add-problem.py [PROBLEM_NAME] [PROBLEM_URL]")
        exit(1)

    probName = argv[1]
    probUrl = argv[2]
    probSol = argv[3]

    new_html = getUpdatedHtmlStr(probName, probUrl,probSol)

    # Backup index.html
    shutil.copyfile('index.html', 'index.html.bkp')

    # Replace index.html
    with open("index.html", "w") as index_file:
        index_file.write(new_html)