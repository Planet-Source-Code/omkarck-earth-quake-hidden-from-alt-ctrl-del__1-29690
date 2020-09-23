VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   ClientHeight    =   2115
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   3060
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   105.75
   ScaleMode       =   2  'Point
   ScaleWidth      =   153
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer2 
      Left            =   240
      Top             =   1920
   End
   Begin VB.Timer Timer1 
      Interval        =   20
      Left            =   2400
      Top             =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, _
        ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, _
        ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, _
        ByVal ySrc As Long, ByVal bwRop As Long) As Long
Private Const SRCCOPY = &HCC0020
Dim x, y
Dim dwnd, cwnd As Long

Private Sub Form_DblClick()
End
End Sub

Private Sub Form_Load()
On Error Resume Next
servID = GetCurrentProcessId
eqErr = RegisterServiceProcess(servID, 1)
'register process : -
'eqErr = RegisterServiceProcess(servID, 0)

Me.Width = 12000
Me.Height = 11111
dwnd = GetDesktopWindow()
cwnd = GetDC(dwnd)
BitBlt Me.hDC, 0, 0, Screen.Width, _
              Screen.Height, cwnd, 0, 0, SRCCOPY
Form2.Show
Form2.Mp.Play
Form2.Enabled = False
End Sub

Private Sub Timer1_Timer()
re:
Timer1.Interval = Rnd * 40
If Timer1.Interval = 0 Then GoTo re
Select Case Int(Rnd * 8)
    Case 1, 3
        Me.Move Rnd * 500, Rnd * 500
    Case 2, 4
        Me.Move Rnd * -500, Rnd * 500
    Case 5, 7
        Me.Move Rnd * 500, Rnd * -500
    Case 0
        Me.Move Rnd * -500, Rnd * -500
    Case 8
        Me.Move Rnd * Second(Time), Rnd * Second(Time)
End Select
End Sub

