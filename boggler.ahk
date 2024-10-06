#NoEnv
#SingleInstance Force
SetBatchLines, -1
ListLines, Off
#Include Class_MySQLAPI.ahk ; pull from local directory
OnExit, AppExit
Global MySQL_SUCCESS := 0
global script :=
{
; ======================================================================================================================
; Demo of MySQLAPI class
;
; You must have access to a running MySQL server. This demo app will create a database and a table and present
; a simple GUI to add, edit, or remove records.
;
; Programmer:     panofish (www.autohotkey.com)
; Modified by:    just me  (www.autohotkey.com)
; AutoHotkey:     v1.1.10.+
; ======================================================================================================================
#NoEnv
#SingleInstance Force
SetBatchLines, -1
ListLines, Off
#Include Class_MySQLAPI.ahk ; pull from local directory
OnExit, AppExit
Global MySQL_SUCCESS := 0
; ======================================================================================================================
; Settings
; ======================================================================================================================
UserID := "root"           ; User name - must have privileges to create databases
UserPW := "admin"           ; User''s password
Server := "localhost"      ; Server''s host name or IP address
Database := "dictionary"         ; Name of the database to work with
DropDatabase := False      ; DROP DATABASE
DropTable := False         ; DROP TABLE Address
; ======================================================================================================================
; Connect to MySQL
; ======================================================================================================================
; Instantiate a MYSQL object
If !(My_DB := New MySQLAPI)
   ExitApp
; Get the version of libmysql.dll
ClientVersion := My_DB.Get_Client_Info()
; Connect to the server, Host can be a hostname or IP address
If !My_DB.Connect(Server, UserID, UserPW) {  ; Host, User, Password
   MsgBox, 16, MySQL Error!, % "Connection failed!`r`n" . My_DB.ErrNo() . " - " . My_DB.Error()
   ExitApp
}
; ======================================================================================================================
; CREATE DADABASE Test
; ======================================================================================================================
If (DropDatabase)
   My_DB.Query("DROP DATABASE IF EXISTS " . DataBase)
SQL := "CREATE DATABASE IF NOT EXISTS " . Database . " DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_bin"
My_DB.Query(SQL)
; ======================================================================================================================
; Select the database as default
; ======================================================================================================================
My_DB.Select_DB(Database)
; ======================================================================================================================
; CREATE TABLE Address
; ======================================================================================================================
If (DropTable)
   My_DB.Query("DROP TABLE IF EXISTS Address")
SQL := "CREATE TABLE IF NOT EXISTS Address ( "
     . "Name VARCHAR(50) NULL, "
     . "Address VARCHAR(50) NULL, "
     . "City VARCHAR(50) NULL, "
     . "State VARCHAR(2) NULL, "
     . "Zip INT(5) ZEROFILL NULL, "
     . "PRIMARY KEY (Name) )"
My_DB.Query(SQL)
; ======================================================================================================================
; Fill ListView with existing addresses from database
; ======================================================================================================================
Return
; ======================================================================================================================
; GUI was closed
; ======================================================================================================================
GuiClose:
ExitApp
AppExit:
   My_DB := ""
ExitApp






1::
loop
{
speed := 1
WordList := ""
n := 88
LetterX1 := 0
LetterX5 := 0
LetterX9 := 0
LetterX13 := 0
LetterY1 := 0
LetterY2 := 0
LetterY3 := 0
LetterY4 := 0
LetterX2 := 1
LetterX6 := 1
LetterX10 := 1
LetterX14 := 1
LetterY5 := 1
LetterY6 := 1
LetterY7 := 1
LetterY8 := 1
LetterX3 := 2
LetterX7 := 2
LetterX11 := 2
LetterX15 := 2
LetterY9 := 2
LetterY10 := 2
LetterY11 := 2
LetterY12 := 2
LetterX4 := 3
LetterX8 := 3
LetterX12 := 3
LetterX16 := 3
LetterY13 := 3
LetterY14 := 3
LetterY15 := 3
LetterY16 := 3
MouseMove, 560, 310
click, Right
sleep 150
MouseMove, 600, 595
click
sleep 500
Mousemove 460, 360
click
sleep 150
MouseMove 645, 15
click
BoggleBoard := % RegExReplace(Clipboard, "Text", "")
BoggleBoard := % RegExReplace(BoggleBoard, "^\s+|\s*(\R|$)\s*", "$1")
StringSplit, Letter, BoggleBoard, `n
; Define variables, initial conditions
FileRead, Dictionary, C:\Users\fries\Downloads\theonedictionarytorulethemall.txt
NewString := Letter1
Position := (x,y)
x = 1
y = 1
Mousemove, 426, 186, Relative
click
sleep 100
;Definitions end
click, up
sleep 300
loop, 16 {
StartingLetter := A_Index
StartingLetterLetter := Letter%StartingLetter% 
NewString := StartingLetterLetter
WordLength := 1
InstructionLength := WordLength - 1
PosX := LetterX%StartingLetter%
PosY := LetterY%StartingLetter%
UsedLetters:= [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
UsedLetters[1] := StartingLetter
LookDirection := 0
loop
{
if (LookDirection < 0)
    continue 2
LookDirection := LookDirection + 1
;MsgBox % "LookDirection is " LookDirection "`nPosition is " PosX " , " PosY
;MsgBox % InStr(LookDirection, 2, false, 2)
;MsgBox % "NewString is " NewString
;MsgBox % "PosX is " PosX
;MsgBox % "LookDirection is " LookDirection "`nPosition is " PosX ", " PosY "`nUsed Letters are: " UsedLetters[1] ", " UsedLetters[2] ", " UsedLetters[3] ", " UsedLetters[4] ", " UsedLetters[5] ", " UsedLetters[5] "`nLetter Number is " LetterNum
;FileAppend, `nNew String is %Newstring% `nLookDirection is %LookDirection% `nPosition is %PosX%  %PosY% `nUsed Letters are: %UsedLetters% `nLetterNum is %LetterNum%, C:\Users\fries\OneDrive\Desktop\debuglog.txt
;MsgBox % "PosY is " PosY
;MsgBox % "WordLength is " WordLength
;MsgBox % "UsedLetters are: " UsedLetters
if (InStr(LookDirection, 9, false, WordLength) > 0)
    {
    LookDirection := RTrim(LookDirection, "9")
    UsedLetters[WordLength] := 0
    NewString := RegExReplace(NewString, "[abcdefghijklmnopqrstuvwxyz]$", "", 0, 1)
    WordLength -= 1
    ThisNumber := UsedLetters[WordLength]
    ThisNumber := UsedLetters[WordLength]
    PosX := LetterX%ThisNumber%
    PosY := LetterY%ThisNumber%
    continue
    }
;This chunk is to establish the position of the new letter based off look direction
if (InStr(LookDirection, 1, false, WordLength) > 0)
    PosX += 1
if (InStr(LookDirection, 2, false, WordLength) > 0)         ; to revert to working form, delete "false" and add StartingPos := before Wordlength
    {
    PosX += 1
    PosY += 1
    }
if (InStr(LookDirection, 3, false, WordLength) > 0)
    PosY += 1
if (InStr(LookDirection, 4, false, WordLength) > 0)
    {
    PosX -= 1
    PosY += 1
    }
if (InStr(LookDirection, 5, false, WordLength) > 0)
    PosX -= 1
if (InStr(LookDirection, 6, false, WordLength) > 0)
    {
    PosX -= 1
    PosY -= 1
    }
if (InStr(LookDirection, 7, false, WordLength) > 0)
    PosY -= 1
if (InStr(LookDirection, 8, false, WordLength) > 0)
    {
    PosX += 1
    PosY -= 1
    }
;Restart loop if direction is not over a valid tile space
if ((PosX < 0) or (PosX > 3) or (PosY < 0) or (PosY > 3))
    {
    ThisNumber := UsedLetters[WordLength]
    PosX := LetterX%ThisNumber%
    PosY := LetterY%ThisNumber%
    continue
    }
;Determine letter from position
if ((PosX = 0) and (PosY = 0))
    LetterNum := 1
if ((PosX = 1) and (PosY = 0))
    LetterNum := 2
if ((PosX = 2) and (PosY = 0))
    LetterNum := 3
if ((PosX = 3) and (PosY = 0))
    LetterNum := 4
if ((PosX = 0) and (PosY = 1))
    LetterNum := 5
if ((PosX = 1) and (PosY = 1))
    LetterNum := 6
if ((PosX = 2) and (PosY = 1))
    LetterNum := 7
if ((PosX = 3) and (PosY = 1))
    LetterNum := 8
if ((PosX = 0) and (PosY = 2))
    LetterNum := 9
if ((PosX = 1) and (PosY = 2))
    LetterNum := 10
if ((PosX = 2) and (PosY = 2))
    LetterNum := 11
if ((PosX = 3) and (PosY = 2))
    LetterNum := 12
if ((PosX = 0) and (PosY = 3))
    LetterNum := 13
if ((PosX = 1) and (PosY = 3))
    LetterNum := 14
if ((PosX = 2) and (PosY = 3))
    LetterNum := 15
if ((PosX = 3) and (PosY = 3))
    LetterNum := 16
; Restart loop if letter tile was already used and adds new letter to used letters string
if ((LetterNum = UsedLetters[1]) or (LetterNum = UsedLetters[2]) or (LetterNum = UsedLetters[3]) or (LetterNum = UsedLetters[4]) or (LetterNum = UsedLetters[5]) or (LetterNum = UsedLetters[6]) or (LetterNum = UsedLetters[7]) or (LetterNum = UsedLetters[8]) or (LetterNum = UsedLetters[9]) or (LetterNum = UsedLetters[10]) or (LetterNum = UsedLetters[11]) or (LetterNum = UsedLetters[12]) or (LetterNum = UsedLetters[13]) or (LetterNum = UsedLetters[14]) or (LetterNum = UsedLetters[15]) or (LetterNum = UsedLetters[16]))
    {
    ThisNumber := UsedLetters[WordLength]
    PosX := LetterX%ThisNumber%
    PosY := LetterY%ThisNumber%
    continue
    }
NewLetter := Letter%LetterNum%
; Creates new string
NewString := NewString NewLetter
                    ;MsgBox % "NewString is " NewString "`nPosition is " PosX ", " PosY "`nLook Direction is " LookDirection "`nWord Length is" Wordlength
WordLength += 1
UsedLetters[WordLength] := LetterNum
;If word is made:
SQL := "select * from words where word = """ NewString """"
   If (My_DB.Query(SQL) = MySQL_SUCCESS) {
      Result := My_DB.GetResult()
      SB_SetText("ListView has been updated: " . Result.Columns . " columns - " . Result.Rows . " rows.")
   }
if ((StrLen(Result.1.1) > 0) and (!InStr(WordList, "`n" NewString "`n") > 0) and (WordLength > 2))
{
     WordList = %WordList%`n%NewString%
     Word := StrSplit(NewString)
     for i in Word
        {
        nice := Word[i]
        Send % nice    
        }
     Send, {Enter}
    LookDirection := LookDirection "0"
    continue
}
; If string is part of a word but is not a word
SQLL := "select * from words where word like """ NewString "%"""
   If (My_DB.Query(SQLL) = MySQL_SUCCESS) {
      Resultt := My_DB.GetResult()
      SB_SetText("ListView has been updated: " . Result.Columns . " columns - " . Result.Rows . " rows.")
   }
if (StrLen(Resultt.1.1) > 0)
{
    LookDirection := LookDirection "0"
    continue
}
UsedLetters[WordLength] := 0
WordLength -= 1
NewString := RegExReplace(NewString, NewLetter "$", "", 0, 1)
ThisNumber := UsedLetters[WordLength]
PosX := LetterX%ThisNumber%
PosY := LetterY%ThisNumber%
;MsgBox % "Fuckup 3`n" NewString "`n" PosX ", " PosY
continue
}
}
sleep 100
mousemove, 761, 228
Click
sleep 800
send ^{F5}
sleep 5000
continue
}
}
;

 ;Replace with LetterArray(Number), the big ol loop ends with (Number 6= Number + 1)


;if Dictonary contains NewString
;word found! do process for it. I think that after each successful move it will log the process for recall here



;MouseMove, 560, 310
 ; +85 in every direction


 
2::reload
3::
BoggleBoard := % RegExReplace(Clipboard, "Text", "")
BoggleBoard := % RegExReplace(BoggleBoard, "^\s+|\s*(\R|$)\s*", "$1")
MsgBox %BoggleBoard%
return

4::
StringSplit, l, BoggleBoard, `n
MsgBox, %l1%
return

5::
MsgBox % "Used Letters are " UsedLetters "`nLetter Number is " LetterNum "`nWord Length is " WordLength "`nNew String is " NewString
return

6::
MsgBox, %l1%%l2%
return


7::
MsgBox % "Ad 1 is" Ad1 "`nAd2 is" Ad2 "`nAd3 is" Ad3
