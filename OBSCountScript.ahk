;Enter your TXT file path

filePathCount = <Chemin vers Current.txt exemple D:\OBS\Counter Script\Current.txt>
filePathTotal = <Chemin vers Max.txt exemple D:\OBS\Counter Script\Max.txt>
filePathOut = <Chemin vers Output.txt exemple D:\OBS\Counter Script\Output.txt>

IfNotExist, %filePathCount%
	FileAppend, 0, %filePathCount%

IfNotExist, %filePathTotal%
	FileAppend, 10, %filePathTotal%
	
IfNotExist, %filePathOut%
	FileAppend, 0/10, %filePathOut%
	
FileReadLine, maxVar, %filePathTotal%, 1

;When you press F12 it will increment and update the death counter in the .txt
	F12::
		FileReadLine, deathVar, %filePathCount%, 1
		Var := ++deathVar
		FileDelete, %filePathCount%
		FileAppend, %deathVar%, %filePathCount%
		FileDelete, %filePathOut%
		FileAppend, %deathVar%/%maxVar%, %filePathOut%
	return

;When you press F11 it will decrement and update the death counter in the .txt
	F11::
		FileReadLine, deathVar, %filePathCount%, 1
		
		if deathVar = 0
		return

		Var := --deathVar
		FileDelete, %filePathCount%
		FileAppend, %deathVar%, %filePathCount%
		FileDelete, %filePathOut%
		FileAppend, %deathVar%/%maxVar%, %filePathOut%
	return