#r "nuget: Giraffe.ViewEngine"
open System.IO
open System.Diagnostics
open Giraffe.ViewEngine

#load "../editions.fsx"
open Editions

let buildDir = "dist"
let makeBuildPath path = Path.Combine (buildDir, path)

type BuiltEdition = {
    edition: Edition
    pdfLink: string
    coverLink: string
}

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
    startInfo.RedirectStandardOutput <- true
    for x in args do
        startInfo.ArgumentList.Add x
    use p = new Process ()
    p.StartInfo <- startInfo
    p.Start () |> ignore
    p.WaitForExit ()
    p.StandardOutput

let buildIndexView builtEditions =
    html [] [
        head [] [
            title [] [str "Aspen Walkers Software Journal"]
            link [_href "/styles.css"; _rel "stylesheet"]
        ]
        body [] [
            h1 [] [str "Aspen Walkers Software Journal"]

            p [] [
                str """
                This journal is an attempt to bring out the joy of developing and using software.
                The journal format was chosen explicitly to make the process of reading and writing the articles more intentional.
                If you would like to contribute in any way, come visit the
                """
                a [_href "https://github.com/EliasPrescott/aspen-walkers"] [str "GitHub repo"]
                str "."
            ]

            let editions =
                builtEditions
                |> List.sortWith (fun a b ->
                    let yearDiff = b.edition.year - a.edition.year
                    if yearDiff <> 0u then
                        int(yearDiff)
                    else
                        // break year ties using the month
                        int(b.edition.month) - int(a.edition.month))

            div [_class "editionList"] [
                for builtEdition in editions do
                    let edition = builtEdition.edition
                    div [_class "editionEntry"] [
                        a [_href builtEdition.pdfLink] [
                            figure [] [
                                let title = Edition.title edition
                                img [_src builtEdition.coverLink; _alt $"Cover for {title} edition of the journal."]
                                figcaption [] [Text title] 
                            ]
                        ]
                    ]
            ]
        ]
    ]

let getVersion () =
    execute "git" ["log"; "-n"; "1"; "--pretty=format:%H"]
    |> _.ReadToEnd()

let buildEditions () =
    let version = getVersion ()
    if Directory.Exists buildDir then
        Directory.Delete (buildDir, true)
    Directory.CreateDirectory buildDir |> ignore
    File.Copy ("./web/styles.css", makeBuildPath "styles.css")

    [
        for edition in editions do
            let pdfPath = Edition.pdfPath edition
            let coverPath = Edition.coverPath edition
            execute "typst" ["compile"; edition.journalFile; makeBuildPath pdfPath] |> ignore
            execute "typst" ["compile"; "--pages"; "1"; "--ppi"; "72"; edition.journalFile; makeBuildPath coverPath] |> ignore
            {
                edition = edition
                pdfLink = pdfPath + $"?version={version}"
                coverLink = coverPath + $"?version={version}"
            }
    ]

let main () =
    buildEditions ()
    |> buildIndexView
    |> RenderView.AsBytes.htmlDocument 
    |> fun bytes ->
        File.WriteAllBytes (makeBuildPath "index.html", bytes)

main ()
