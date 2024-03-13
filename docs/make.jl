using Documenter
using DataFrames
using CategoricalArrays
using DocumenterVitepress

DocMeta.setdocmeta!(DataFrames, :DocTestSetup, :(using DataFrames); recursive=true)

# Build documentation.
# ====================

makedocs(
    # options
    modules = [DataFrames],
    doctest = true,
    clean = false,
    sitename = "DataFrames.jl",
    format=DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/JuliaData/DataFrames.jl", # this must be the full URL!
        devbranch = "main",
        devurl = "dev";
    ),
    draft = false,
    source = "src",
    build = "build",
    pages = [
        "Introduction" => "introduction.md",
        "First Steps with DataFrames.jl" => "man/basics.md",
        "User Guide" => [
            "Getting Started" => "man/getting_started.md",
            "Working with DataFrames" => "man/working_with_dataframes.md",
            "Importing and Exporting Data (I/O)" => "man/importing_and_exporting.md",
            "Joins" => "man/joins.md",
            "Split-apply-combine" => "man/split_apply_combine.md",
            "Reshaping" => "man/reshaping_and_pivoting.md",
            "Sorting" => "man/sorting.md",
            "Categorical Data" => "man/categorical.md",
            "Missing Data" => "man/missing.md",
            "Data manipulation frameworks" => "man/querying_frameworks.md",
            "Comparison with Python/R/Stata" => "man/comparisons.md"
        ],
        "API" => [
            "Types" => "lib/types.md",
            "Functions" => "lib/functions.md",
            "Indexing" => "lib/indexing.md",
            "Metadata" => "lib/metadata.md",
            #hide("Internals" => "lib/internals.md"),
        ]
    ],
)

# Deploy built documentation.
# ===========================

deploydocs(
    # options
    repo = "github.com/JuliaData/DataFrames.jl.git",
    target = "build",
    branch = "gh-pages",
    deps = nothing,
    make = nothing,
    devbranch = "main",
    push_preview = true
)