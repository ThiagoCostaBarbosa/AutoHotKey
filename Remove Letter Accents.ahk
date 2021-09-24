/ *
    Função: RemoveLetterAccents

    Descrição:
    Remove os acentos de uma string.

    Parâmetros:
        str - uma string, mesmo que seja multiline.

    Retorna:
        Uma string formatada sem nenhum tipo de acento.

    Exemplo:
        > text := RemoveLetterAccents("A vida é bela`! Então vá vivê-la`!")
        
    Licença:
        - Versão 1.05 <http://www.autohotkey.net/~polyethene/#dateparse>
        - Dedicado ao domínio público (CC0 1.0) <http://creativecommons.org/publicdomain/zero/1.0/>
* /



RemoveLetterAccents(str){
    static Array := { "a" : "áàâǎăãảạäåāąấầẫẩậắằẵẳặǻ"
        , "c" : "ćĉčċç"
        , "d" : "ďđð"
        , "e" : "éèêěĕẽẻėëēęếềễểẹệ"
        , "g" : "ğĝġģ"
        , "h" : "ĥħ"
        , "i" : "íìĭîǐïĩįīỉịĵ"
        , "k" : "ķ"
        , "l" : "ĺľļłŀ"
        , "n" : "ńňñņ"
        , "o" : "óòŏôốồỗổǒöőõøǿōỏơớờỡởợọộ"
        , "s" : "ṕṗŕřŗśŝšş"
        , "t" : "ťţŧ"
        , "u" : "úùŭûǔůüǘǜǚǖűũųūủưứừữửựụ"
        , "w" : "ẃẁŵẅýỳŷÿỹỷỵ"
    , "z" : "źžż" }
    for k, v in Array
    {
        StringUpper, VU, v
        StringUpper, KU, k
        str:=RegExReplace(str,"[" v "]",k)
        str:=RegExReplace(str,"[" VU "]",KU)
    }
    Return str
}
