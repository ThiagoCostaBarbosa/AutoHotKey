
RemoveLetterAccents(text){
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
        text:=RegExReplace(text,"[" v "]",k)
        text:=RegExReplace(text,"[" VU "]",KU)
    }
    Return text
}
