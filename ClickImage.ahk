/ *
    Função: ClickImage

    Descrição:
        Clica na coordenada central da imagem pesquisada e arrasta o mouse até a coordenada desejada a partir da imagem.

    Parâmetros:
        img - string com o caminho da imagem para procurar.
        btn - botão que executará a ação
        clicks - Quantidade de cliques à executar
            * Sugestão update: como não consegui setar o padrão com uma array caso o parâmetro não fosse passado, ficou com muitos parâmetros
        a1 - coordenada Horizontal inicial para pesquisar a imagem
        a2 - coordenada Vertical inicial para pesquisar a imagemcoordenada inicial 
        a3 - coordenada Horizontal final para pesquisar a imagem
        a4 - coordenada Vertical final para pesquisar a imagem
        variation_color - margem de dudança nos pixels a partir da foto pesquisada
        variation_X - variação Horizontal do clique
        variation_Y - variação Vertical do clique

    Retorna:
        Somente executa a ação, sem nenhum retorno

    Exemplo:
        > ClickImage(A_ScriptDir . "\search.png",Left, 2,,,,,3)

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

ClickImage(img, btn := "Left", clicks := 1, a1 := 0, a2 := 0, a3 := A_ScreenWidth, a4 := A_ScreenHeight, variation_color := 0, variation_X := 0, variation_Y := 0) {
    CoordMode, Pixel, Window
    Loop
    {
        ImageSearch, aX, aY, %a1%, %a2%, %a3%, %a4%, *%variation_color% %img%
        CenterImgSrchCoords(img, aX, aY)
        If ErrorLevel = 0
        {
            variation_X += aX
            variation_Y += aY
            If (clicks >= 1) {
                Click, %variation_X%, %variation_Y%, %btn%, %clicks%
            } Else {
                MouseMove, %variation_X%, %variation_Y%
            }
        }
    }
    Until ErrorLevel = 0
}
