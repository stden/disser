@echo off

rem Makefile for documents and templates
rem Author: Stanislav Kruchinin <stanislav.kruchinin@gmail.com>

set latexnmk=call ..\..\include\latex.nmk.cmd

if "%1"=="" (
	%latexnmk%
) else (
	for %%f in (%*) do if "%%f"=="help" (
		call :%%f
	) else if "%%f"=="all" (
		call :%%f
	) else if "%%f"=="allpdf" (
		call :%%f
	) else (
		%latexnmk% %%f
	)
)

exit /b

:help
	echo   all          build DVI of autoref and thesis
	echo   allpdf       build PDF of autoref and thesis
	%latexnmk% help
goto :eof

:all
	set target=thesis & %latexnmk% dvi
	set target=autoref & %latexnmk% dvi
	set target=
goto :eof

:allpdf
	set target=thesis & %latexnmk% pdf
	set target=autoref & %latexnmk% pdf
	set target=
goto :eof
