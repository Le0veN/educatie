#include <windows.h>
#include "sysmets.h"

LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);

long WMCreate  (HWND hwnd, WPARAM wParam, LPARAM lParam);
long WMPaint   (HWND hwnd, WPARAM wParam, LPARAM lParam);
long WMDestroy (HWND hwnd, WPARAM wParam, LPARAM lParam); 

void InitClass (WNDCLASS* wndclass, HINSTANCE hInstance, char* szAppName)
{
  wndclass->style         = CS_HREDRAW | CS_VREDRAW;
  wndclass->lpfnWndProc   = WndProc;
  wndclass->cbClsExtra    = 0;
  wndclass->cbWndExtra    = 0;
  wndclass->hInstance     = hInstance;
  wndclass->hIcon         = LoadIcon (NULL, IDI_APPLICATION);
  wndclass->hCursor       = LoadCursor (NULL, IDC_ARROW);
  wndclass->hbrBackground = GetStockObject (WHITE_BRUSH);
  wndclass->lpszMenuName  = NULL;
  wndclass->lpszClassName = szAppName;
}

BOOL InitApplication (HINSTANCE hInstance, char* szAppName)
{
  WNDCLASS wndclass;

  InitClass (&wndclass, hInstance, szAppName);
  return RegisterClass (&wndclass);
}

BOOL InitInstance (HINSTANCE hInstance, char* szAppName, int nCmdShow)
{
  HWND		  hwnd;

  hwnd = CreateWindow (szAppName,
							  "Metrici sistem No. 1",
							  WS_OVERLAPPEDWINDOW,
							  CW_USEDEFAULT,
							  CW_USEDEFAULT,
							  CW_USEDEFAULT,
							  CW_USEDEFAULT,
							  NULL,
							  NULL,
							  hInstance,
							  NULL);
  if (hwnd == NULL)
	 return FALSE;

  ShowWindow (hwnd, nCmdShow);
  UpdateWindow (hwnd);

  return TRUE;
}

BOOL AppInit (HINSTANCE hInstance,
				  HINSTANCE hPrevInstance,
				  int nCmdShow)
{
  static char szAppName [] = "SysMets1";

  if (!hPrevInstance) {
	 if (!InitApplication (hInstance, szAppName))
		return FALSE;
  }
  return InitInstance (hInstance, szAppName, nCmdShow);
}

int WINAPI WinMain (HINSTANCE hInstance, 
					HINSTANCE hPrevInstance,
					LPSTR lpszCmdLine,
					int nCmdShow)

{
  MSG		  msg;

  if (!AppInit (hInstance, hPrevInstance, nCmdShow))
	 return 0;

  while (GetMessage (&msg, NULL, 0, 0)) {
	 TranslateMessage (&msg);
	 DispatchMessage (&msg);
  }

  return msg.wParam;
}

LRESULT CALLBACK	WndProc(HWND hwnd, 
							UINT message, 
							WPARAM wParam, 
							LPARAM lParam)

{
  switch (message) {

	case WM_CREATE:  return WMCreate  (hwnd, wParam, lParam);
	case WM_PAINT:   return WMPaint   (hwnd, wParam, lParam);
	case WM_DESTROY: return WMDestroy (hwnd, wParam, lParam);

  }

  return DefWindowProc (hwnd, message, wParam, lParam);
}


long cxChar, cyChar, cxCaps;

long WMCreate (HWND hwnd, WPARAM wParam, LPARAM lParam)
{
  TEXTMETRIC   tm;
  HDC          hdc;

  hdc = GetDC (hwnd);

  GetTextMetrics (hdc, &tm);
  cxChar = tm.tmAveCharWidth;
  if ((tm.tmPitchAndFamily & 0x0001) == 0)
    cxCaps = cxChar;
  else
    cxCaps = 3 * cxChar / 2;
  cyChar = tm.tmHeight + tm.tmExternalLeading;

  ReleaseDC (hwnd, hdc);

  return 0;
}

long WMPaint (HWND hwnd, WPARAM wParam, LPARAM lParam)
{
  char		   szBuffer [10];
  short		   i;
  PAINTSTRUCT  ps;
  HDC          hdc;

  hdc = BeginPaint (hwnd, &ps);

  for (i = 0; i < NUMLINES; i++) {

	 TextOut (hdc, cxChar, cyChar*(i + 1),
			 sysmetrics [i].szLabel,
			 lstrlen (sysmetrics [i].szLabel));
	 TextOut (hdc, cxChar + 18*cxCaps, cyChar*(i + 1),
			 sysmetrics [i].szDesc,
			 lstrlen (sysmetrics [i].szDesc));

	 SetTextAlign (hdc, TA_RIGHT | TA_TOP);

	 TextOut (hdc, cxChar + 18*cxCaps + 50*cxChar, cyChar*(i + 1),
			 szBuffer,
			 wsprintf (szBuffer, "%5d",
						GetSystemMetrics (sysmetrics [i].nIndex)));

	 SetTextAlign (hdc, TA_LEFT | TA_TOP);
  }

  EndPaint (hwnd, &ps);

  return 0;
}

long WMDestroy (HWND hwnd, WPARAM wParam, LPARAM lParam)
{
  PostQuitMessage (0);

  return 0;
}


