Attribute VB_Name = "Module1"
Public Declare Function GetCurrentProcessId _
Lib "kernel32" () As Long
Public Declare Function GetCurrentProcess _
Lib "kernel32" () As Long
Public Declare Function RegisterServiceProcess _
Lib "kernel32" (ByVal dwProcessID As Long, _
ByVal dwType As Long) As Long

Public eqErr, servID

