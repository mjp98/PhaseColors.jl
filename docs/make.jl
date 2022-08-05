using PhaseColors
using Documenter

DocMeta.setdocmeta!(PhaseColors, :DocTestSetup, :(using PhaseColors); recursive=true)

makedocs(;
    modules=[PhaseColors],
    authors="Matthew Priddin and contributors",
    repo="https://github.com/mjp98/PhaseColors.jl/blob/{commit}{path}#{line}",
    sitename="PhaseColors.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mjp98.github.io/PhaseColors.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mjp98/PhaseColors.jl",
    devbranch="main",
)
