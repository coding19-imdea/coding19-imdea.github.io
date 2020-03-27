function onFormSubmit(e) {

/* Begin Edit Area */
var problemNumber = "i";
/* End Edit Area */


var nameQueryIndex = 0;
// reponse field is not use since it is validated by google forms 
var languageQueryIndex = 2;
var srcFileIndex = 3;




var ghToken = "this is the secret personal token"; // generated from here: https://github.com/settings/tokens
var ee = e.response;
var rsp = ee.getItemResponses();


var name     = rsp[nameQueryIndex].getResponse();
var language = rsp[languageQueryIndex].getResponse();
var srcFile = DriveApp.getFileById(rsp[srcFileIndex].getResponse());
var driveFileName = srcFile.getName();

var srcfilename = "submissions/problem" + problemNumber + "/" + name + '.' + driveFileName.split('.').pop();
var srccontent  = Utilities.base64Encode(srcFile.getBlob().getBytes());


var filename = "showSubmissions.js";

  
 var optionsRead = {
    "method": "GET",
    "contentType": "application/json",
    "muteHttpExceptions": true,
    "recursive": false,
    "headers": {"Accept": "application/vnd.github.v3+json"}
 };
 
 
var responseRead = UrlFetchApp.fetch("https://api.github.com/repos/coding19-imdea/coding19-imdea.github.io/contents/"+filename+"?access_token="+ghToken, optionsRead)


var author = { 
  "name": "coding19-imdea",
  "email":"coding19.imdea@gmail.com"
  }
  
var sha    = JSON.parse(responseRead.getContentText()).sha;
var oldcontentData = Utilities.base64Decode(JSON.parse(responseRead.getContentText()).content);
if (oldcontentData== null) {
    oldcontentData="";
}
var oldcontent     = Utilities.newBlob(oldcontentData).getDataAsString(); // String


var entry       = '\'<li>' + name + ': \' + showcode(' + problemNumber + ',"https://raw.githubusercontent.com/coding19-imdea/coding19-imdea.github.io/master/' + srcfilename + '", "' + language + '") + \'</li>\'\n'; 
var initNull    = 'if (submissions['+ problemNumber +'] == undefined) {submissions['+ problemNumber + '] = "";}\n';
var addNewEntry = 'submissions['+ problemNumber +'] = submissions['+ problemNumber +'].concat('+ entry +');\n';

var newcontent = initNull + addNewEntry;

var content =  Utilities.newBlob(oldcontent+newcontent);


var contentEncoded =  Utilities.base64Encode(content.getBytes());

var payloadUpdate = { 
  "message": "add response row",
  "content": contentEncoded,
  "committer": author,
  "sha": sha,
  };

var optionsUpdate = {
    "method": "PUT",
    "contentType": "application/json",
    "payload":JSON.stringify(payloadUpdate),
    "muteHttpExceptions": true,
    "headers": {"Accept": "application/vnd.github.v3+json"}
 };
 
 
var addSrcMsg =  "add src file " + srcfilename;
var payloadSrcFile = { 
  "message": addSrcMsg,
  "content": srccontent,
  "committer": author,
  "sha": sha,
  };
  
var optionsaddSrcFile = {
    "method": "PUT",
    "contentType": "application/json",
    "payload":JSON.stringify(payloadSrcFile),
    "muteHttpExceptions": true,
    "headers": {"Accept": "application/vnd.github.v3+json"}
 };

var update = UrlFetchApp.fetch("https://api.github.com/repos/coding19-imdea/coding19-imdea.github.io/contents/"+filename+"?access_token="+ghToken, optionsUpdate);

var addSrcFile = UrlFetchApp.fetch("https://api.github.com/repos/coding19-imdea/coding19-imdea.github.io/contents/"+srcfilename+"?access_token="+ghToken, optionsaddSrcFile);
//Logger.log(addSrcFile);      

}



