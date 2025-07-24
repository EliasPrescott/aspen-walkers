#r "nuget: Giraffe.ViewEngine"
open System.IO
open System.Diagnostics
open Giraffe.ViewEngine

#load "../editions.fsx"
open Editions

let buildDir = "dist"
let makeBuildPath path = Path.Combine (buildDir, path)

module Edition =
    let pdfPath edition =
        $"{edition.year}-{edition.month}-Journal.pdf"

    let coverPath edition =
        $"{edition.year}-{edition.month}-Cover.png"

    let title edition =
        let path = $"{edition.month} {edition.year}"
        if edition.draft then path + " (draft)"
        else path

let execute cmd args =
    let startInfo = ProcessStartInfo ()
    startInfo.FileName <- cmd
    startInfo.CreateNoWindow <- true
    for x in args do
        startInfo.ArgumentList.Add x
    use p = new Process ()
    p.StartInfo <- startInfo
    p.Start () |> ignore
    p.WaitForExit ()

let indexView =
    html [] [
        head [] [
            title [] [str "Aspen Walkers Software Journal"]
            link [_href "/styles.css"; _rel "stylesheet"]
        ]
        body [] [
            h1 [] [str "Aspen Walkers Software Journal"]

            let editions =
                editions
                |> List.sortWith (fun a b ->
                    let yearDiff = b.year - a.year
                    if yearDiff <> 0u then
                        int(yearDiff)
                    else
                        // break year ties using the month
                        int(b.month) - int(a.month))

            div [_class "editionList"] [
                for edition in editions do
                    div [_class "editionEntry"] [
                        a [_href <| Edition.pdfPath edition] [
                            figure [] [
                                let imgPath = Edition.coverPath edition
                                let title = Edition.title edition
                                img [_src imgPath; _alt $"Cover for {title} edition of the journal."]
                                figcaption [] [Text title] 
                            ]
                        ]
                    ]
            ]
        ]
    ]

let buildEditions () =
    if Directory.Exists buildDir then
        Directory.Delete (buildDir, true)
    Directory.CreateDirectory buildDir |> ignore
    File.Copy ("./web/styles.css", makeBuildPath "styles.css")
    for edition in editions do
        execute "typst" ["compile"; edition.journalFile; Edition.pdfPath edition |> makeBuildPath]
        execute "typst" ["compile"; "--pages"; "1"; "--ppi"; "72"; edition.journalFile; Edition.coverPath edition |> makeBuildPath]

let main () =
    buildEditions ()

    indexView
    |> RenderView.AsBytes.htmlDocument 
    |> fun bytes ->
        File.WriteAllBytes (makeBuildPath "index.html", bytes)

main ()
