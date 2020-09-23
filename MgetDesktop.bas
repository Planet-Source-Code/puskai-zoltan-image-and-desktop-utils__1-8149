Attribute VB_Name = "MgetDesktop"
Public Declare Function getDesktop Lib "JPGUtils.dll" (ByVal nWidth As Integer, ByVal nHeight As Integer, ByVal blnJpeg As Boolean, ByVal JPGCompressQuality As Integer, ByVal strFileName As String) As Integer
Public Declare Function ConvertBMPtoJPG Lib "JPGUtils.dll" (ByVal strFileName As String, ByVal JPGCompressQuality As Integer, ByVal blnKeepBMP As Boolean) As Integer
Public Declare Function ConvertJPGtoBMP Lib "JPGUtils.dll" (ByVal strFileName As String, ByVal blnKeepJPG As Boolean) As Integer

Sub Main()
Dim retval As Integer
    getDesktop 400, 300, False, 10, App.Path & "\CaptureinBmp.bmp"
    MsgBox "You just have captured the desktop and saved in " & App.Path & "\CaptureinBmp.bmp with resolution 400 X 300"
    retval = ConvertBMPtoJPG(App.Path & "\CaptureinBmp.bmp", 80, True)
    If retval Then MsgBox "You just have converted " & App.Path & "\ScreenCaptureinBitmap.bmp to " & App.Path & "\CaptureinBmp.jpg with 80% compress quality"
    getDesktop 0, 0, True, 100, App.Path & "\ScreenCaptureinJpeg.jpg"
    MsgBox "You just have captured the desktop and saved in " & App.Path & "\ScreenCaptureinJpeg.jpg with Screen resolution and Compress quality 100%"
    retval = ConvertJPGtoBMP(App.Path & "\ScreenCaptureinJpeg.jpg", True)
    If retval Then MsgBox "You just have converted " & App.Path & "\ScreenCaptureinJpeg.jpg to " & App.Path & "\ScreenCaptureinJpeg.bmp"
End Sub
