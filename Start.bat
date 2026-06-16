@echo off
title Simple LMS Launcher
color 0A

:: Backend start
cd backend
call venv\Scripts\activate.bat
start "" uvicorn main:app --reload --port 8000
cd ..

:: Frontend start
cd frontend
start "" npm run dev
cd ..

:: Browser open
start http://localhost:5173

echo [OK] Backend, Frontend, aur Browser chal rahe hain!
exit
