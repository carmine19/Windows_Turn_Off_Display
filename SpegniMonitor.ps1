Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Monitor
{
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern IntPtr SendMessage(IntPtr hWnd, UInt32 Msg, IntPtr wParam, IntPtr lParam);
    public static int SC_MONITORPOWER = 0xF170;
    public static int WM_SYSCOMMAND = 0x0112;
    public static IntPtr HWND_BROADCAST = (IntPtr)0xffff;
    public static IntPtr MONITOR_OFF = (IntPtr)2;
}
"@

[void] [Monitor]::SendMessage([Monitor]::HWND_BROADCAST, [Monitor]::WM_SYSCOMMAND, [Monitor]::SC_MONITORPOWER, [Monitor]::MONITOR_OFF)
