/ *
    Função: ClickPixel

    Descrição:
        Clica na coordenada desejada baseado no pixel pesquisado.

    Parâmetros:
        hex - Cor Hexadecimal procurada
        btn - botão que executará a ação
        clicks - Quantidade de cliques à executar
        variation_color - margem de dudança nos pixels a partir da foto pesquisada
            * Sugestão update: como não consegui setar o padrão com uma array caso o parâmetro não fosse passado, ficou com muitos parâmetros
        a1 - coordenada Horizontal inicial para pesquisar o pixel
        a2 - coordenada Vertical inicial para pesquisar o pixel coordenada inicial 
        a3 - coordenada Horizontal final para pesquisar o pixel
        a4 - coordenada Vertical final para pesquisar o pixel
        variation_X - variação Horizontal do clique
        variation_Y - variação Vertical do clique

    Retorna:
        Somente executa a ação, sem nenhum retorno

    Exemplo:
        > ClickPixel(0xBF59CF,Right,1,2,,,,,50,50)

    Licença:
        - Dedicado ao domínio público (CC0 1.0) <http://creativecommons.org/publicdomain/zero/1.0/>
* /

ClickPixel(hex, btn := "Left", clicks := 1, variation_color := 0, a1 := 0, a2 := 0, a3 := A_ScreenWidth, a4 := A_ScreenHeight, variation_X := 0, variation_Y := 0)
{
    CoordMode, Pixel, Windows
    Loop
    { 
        PixelSearch, aX, aY, %a1%, %a2%, %a3%, %a4%, %hex%, %variation_color%, Fast RGB
        If ErrorLevel = 0
        {
            variation_X += aX
            variation_Y += aY
            If (clicks >= 1) { 
                Click, %variation_X%, %variation_Y%, %btn%, %clicks%
                Sleep, 100
            } Else {
                MouseMove, %variation_X%, %variation_Y%
            }
        }
    }
    Until ErrorLevel = 0
}