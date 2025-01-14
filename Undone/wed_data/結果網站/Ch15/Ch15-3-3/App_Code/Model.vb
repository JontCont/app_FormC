﻿'------------------------------------------------------------------------------
' <auto-generated>
'    這個程式碼是由範本產生。
'
'    對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
'    如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Partial Public Class Classes
    Public Property eid As String
    Public Property sid As String
    Public Property c_no As String
    Public Property time As Nullable(Of Date)
    Public Property room As String
    Public Property grade As Nullable(Of Double)

    Public Overridable Property Courses As Courses
    Public Overridable Property Instructors As Instructors
    Public Overridable Property Students As Students

End Class
Partial Public Class Courses
    Public Property c_no As String
    Public Property title As String
    Public Property credits As Nullable(Of Integer)

    Public Overridable Property Classes As ICollection(Of Classes) = New HashSet(Of Classes)

End Class
Partial Public Class Instructors
    Public Property eid As String
    Public Property name As String
    Public Property rank As String
    Public Property department As String

    Public Overridable Property Classes As ICollection(Of Classes) = New HashSet(Of Classes)

End Class
Partial Public Class Students
    Public Property sid As String
    Public Property name As String
    Public Property major As String
    Public Property tel As String
    Public Property birthday As Nullable(Of Date)

    Public Overridable Property Classes As ICollection(Of Classes) = New HashSet(Of Classes)

End Class
