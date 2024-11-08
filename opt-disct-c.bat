@echo off
title Deep Cleanup for Drive C
color 0a

echo.
echo ==== Starting Deep Cleanup of Drive C ====
echo.

:: تنظيف ملفات النظام المؤقتة
echo Cleaning Temporary Files...
del /q /s "%temp%\*.*" 
del /q /s "C:\Windows\Temp\*.*"
echo Temporary Files Cleaned!

:: تنظيف ملفات التحديثات القديمة
echo Cleaning Windows Update Cache...
del /q /s "C:\Windows\SoftwareDistribution\Download\*.*"
echo Windows Update Cache Cleaned!

:: حذف ملفات السجل القديمة
echo Cleaning Old Log Files...
forfiles /p "C:\Windows\Logs" /s /m *.log /d -7 /c "cmd /c del @file"
echo Old Log Files Cleaned!

:: تنظيف ملفات التخزين المؤقت للنظام
echo Cleaning System Cache Files...
del /q /s "C:\Windows\Prefetch\*.*"
echo System Cache Files Cleaned!

:: تنظيف ملفات استعادة النظام
echo Deleting Old System Restore Points...
vssadmin delete shadows /for=C: /all /quiet
echo Old System Restore Points Deleted!

:: تنظيف مجلد ملفات التقارير عن الأخطاء
echo Cleaning Error Reporting Files...
del /q /s "C:\ProgramData\Microsoft\Windows\WER\*.*"
echo Error Reporting Files Cleaned!

:: تنظيف ذاكرة التخزين المؤقتة لـ DNS
echo Clearing DNS Cache...
ipconfig /flushdns
echo DNS Cache Cleared!

:: تحسين مساحة القرص باستخدام أداة Disk Cleanup
echo Running Disk Cleanup Tool...
cleanmgr /sagerun:1
echo Disk Cleanup Completed!

echo.
echo ==== Deep Cleanup Completed! ====
echo Please restart your computer for full effect.
pause
