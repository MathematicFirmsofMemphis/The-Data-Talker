@echo off
set /p operator_name=Enter your operator name: 
set /p property_result=Did you win or lose the property? (win/lose): 
set /p total_kills=Enter total kills: 
set /p destroyed property=Enter number of destroyed property: 
set /p assist=Enter number of assists: 
set /p damage_given=Enter total damage given: 
set /p damage_taken=Enter total damage taken: 

rem Error Analysis
set /a errors=0
set error_messages=""

rem Analyzing errors for winning
if "%property_result%"=="win" (
    rem Check for excessive destroyed property
    if %destroyed property% GTR 5 (
        echo Excessive destroyed property detected! Improve survival skills.
        set /a errors+=1
        set error_messages=%error_messages% "Excessive destroyed property detected! Improve survival skills."
    )
    
    rem Check for low kill participation
    if %total_kills% LSS 10 (
        echo Low kill participation detected! Be more aggressive.
        set /a errors+=1
        set error_messages=%error_messages% "Low kill participation detected! Be more aggressive."
    )
)

rem Analyzing errors for losing
if "%property_result%"=="lose" (
    rem Check for low kills
    if %total_kills% LSS 5 (
        echo Low kills detected! Improve aiming or strategy.
        set /a errors+=1
        set error_messages=%error_messages% "Low kills detected! Improve aiming or strategy."
    )
    
    rem Check for high destroyed property
    if %destroyed property% GTR 10 (
        echo High destroyed property detected! Focus on survival.
        set /a errors+=1
        set error_messages=%error_messages% "High destroyed property detected! Focus on survival."
    )
)

echo.
echo Error Analysis for %operator_name%:
echo ------------------------------
echo property Result: %property_result%
echo Total Errors: %errors%
echo Error Messages: %error_messages%
echo ------------------------------

rem Writing errors to a text file
echo Error Analysis for %operator_name%: > Results.txt
echo ------------------------------ >> Results.txt
echo property Result: %property_result% >> Results.txt
echo Total Errors: %errors% >> Results.txt
echo Error Messages: %error_messages% >> Results.txt
echo ------------------------------ >> Results.txt
