type Month =
    | January = 1
    | February = 2
    | March = 3
    | April = 4
    | May = 5
    | June = 6
    | July = 7
    | August = 8
    | September = 9
    | October = 10
    | November = 11
    | December = 12

type Edition = {
    year: uint
    month: Month
    journalFile: string
    draft: bool
}

let editions = [
    {
        year = 2025u
        month = Month.August
        journalFile = "editions/2025-august/journal.typ"
        draft = true
    }
]
