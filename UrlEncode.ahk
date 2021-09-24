/ *
    Função: UrlEncode

    Descrição:
        Codificar uma string para o formato de url.

    Parâmetros:
        str - uma string com caracteres especiais e espaços, não aceitos em uma url.

    Retorna:
        Uma string codificada para url.

    Exemplo:
        > siteurl := "http://wa.me/99999?text=" . UrlEncode("Olá, gostaria de marcar um horário")

    Licença:
        - Dedicado ao domínio público (CC0 1.0) <http://creativecommons.org/publicdomain/zero/1.0/>
* /

UriEncode(str, RE="[0-9A-Za-z]") {
    VarSetCapacity(Var, StrPut(str, "UTF-8"), 0), StrPut(str, &Var, "UTF-8")
    While Code := NumGet(Var, A_Index - 1, "UChar")
    Res .= (Chr:=Chr(Code)) ~= RE ? Chr : Format("%{:02X}", Code)
    Return, Res
}

UrlEncode(strUrl) {
    return UriEncode(strUrl, "[!#$&-;=?-Z_a-z~]")
}
