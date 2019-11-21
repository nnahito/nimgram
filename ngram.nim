import unicode
import tables
import math

proc createCorpus*(text: string, n: int): seq[string] =
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
        

proc tf*(corpus: seq[string]): Table[string, int] =
    for c in corpus:
        if result.hasKey(c):
            result[c] += 1
        else:
            result[c] = 1


proc cosineSimilarity*(text1: string, text2: string, corpusSize: int): float =
    let text1Copus = createCorpus(text1, corpusSize)
    let text2Copus = createCorpus(text2, corpusSize)

    let text2Tf = tf(text2Copus)

    var c = 0.0
    var m1 = 0.0
    var m2 = 0.0

    for t1c in text1Copus:
        var n = 0.0
        if text2Tf.hasKey(t1c):
            n = 1.0
            echo(t1c, " : ", text2Tf[t1c])
        
        c += (1 * n)
        m1 += 1 * 1
        m2 += n * n
    
    result = c / round(sqrt(m1) * sqrt(m2))


