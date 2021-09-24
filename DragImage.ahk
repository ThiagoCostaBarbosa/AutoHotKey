/ *
    Função: DragImage

    Descrição:
        Clica na coordenada central da imagem pesquisada e arrasta o mouse até a coordenada desejada a partir da imagem.

    Parâmetros:
        img - string com o caminho da foto para procurar.
            * Sugestão update: como não consegui setar o padrão com uma array caso o parâmetro não fosse passado, ficou com muitos parâmetros
        a1 - coordenada Horizontal inicial para pesquisar a imagem
        a2 - coordenada Vertical inicial para pesquisar a imagemcoordenada inicial 
        a3 - coordenada Horizontal final para pesquisar a imagem
        a4 - coordenada Vertical final para pesquisar a imagem
        inicial_position_X - variação Horizontal do clique inicial
        inicial_position_Y - variação Vertical do clique inicial
        final_position_X - variação Horizontal do clique final
        final_position_Y - variação Vertical do clique final

    Retorna:
        Somente executa a ação, sem nenhum retorno

    Exemplo:
        > DragImage(A_ScriptDir . "\search.png",,,,,2,,,200,10)

    Licença:
        - Dedicado ao domínio público (CC0 1.0) <http://creativecommons.org/publicdomain/zero/1.0/>
* /


CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY) {
    static LoadedPic
    LastEL := ErrorLevel
    Gui, Pict:Add, Pic, vLoadedPic, % RegExReplace(File, "^(\*\w+\s)+")
    GuiControlGet, LoadedPic, Pict:Pos
    Gui, Pict:Destroy
    CoordX += LoadedPicW // 2
    CoordY += LoadedPicH // 2
    ErrorLevel := LastEL
}

DragImage(img, a1 := 0, a2 := 0, a3 := A_ScreenWidth, a4 := A_ScreenHeight, variation := 0, inicial_position_X := 0, inicial_position_Y := 0, final_position_X := 0, final_position_Y := 0) {
    Loop
    {
        CoordMode, Pixel, Window
        ImageSearch, X, Y, %a1%, %a2%, %a3%, %a4%, *%variation% %img%
        CenterImgSrchCoords(img, X, Y)
    }
    Until ErrorLevel = 0
    inicial_position_X += X
    inicial_position_Y += Y
    final_position_X += X
    final_position_Y += Y
    MouseClickDrag, Left, %inicial_position_X%, %inicial_position_Y%, %final_position_X%, %final_position_Y%
    Return
}