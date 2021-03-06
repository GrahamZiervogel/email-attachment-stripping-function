Public Sub SaveAttachToDisk(itm As Outlook.MailItem)

    Dim objAtt As Outlook.Attachment
    Dim saveFolder As String

    saveFolder = "C:\StrippedData\"
    
    sUser = VBA.Environ("USERNAME")
    
    For Each objAtt In itm.Attachments

        objAtt.SaveAsFile saveFolder & "\" & Format(Now, "yyyy-mm-dd") & "_" & sUser & "_" & RandomString(6) & "_" & objAtt.DisplayName

        Set objAtt = Nothing

    Next

End Sub

Function RandomString(cb As Integer) As String

    Randomize

    Dim rgch As String

    rgch = "abcdefghijklmnopqrstuvwxyz"
   
    Dim i As Long

    For i = 1 To cb

        RandomString = RandomString & Mid$(rgch, Int(Rnd() * Len(rgch) + 1), 1)

    Next

End Function