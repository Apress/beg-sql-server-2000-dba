'********************************************
'  Visual Basic Transformation Script
'********************************************

'  Copy each source column to the destination column
Function Main()
   if ISNULL(DTSSource("minit")) then
      DTSDestination("FullName") = DTSSource("fname") _ 
                                   & " " & DTSSource("lname")
   elseif Len(trim(DTSSource("minit"))) = 0 then
      DTSDestination("FullName") = DTSSource("fname") _
                                   & " " & DTSSource("lname")
   else
      DTSDestination("FullName") = DTSSource("fname") _
                                   & " " & DTSSource("minit") _ 
                                   & ". " & DTSSource("lname")
   end if
   Main = DTSTransformStat_OK
End Function

