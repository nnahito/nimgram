import unicode

proc nGram*(text: string, n: int): seq[string] =
    var index = 0
    var cnt = 0
    var tmp: string

    let runeText = text.toRunes()
    while true:
        if n <= cnt:
            result.add(tmp)

            tmp = ""
            cnt = 0
            index = index - (n - 1)
            
        
        if text.runeLen() <= index:
            break
        
        tmp = tmp & $runeText[index]

        cnt = cnt + 1
        index = index + 1
        
