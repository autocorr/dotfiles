Pkg.update()

packages = [
    # Base
    "Dates",
    "Color",
    "Compat",
    "GZip",
    "LaTeXStrings",
    "SHA",
    "TypeCheck",
    "FixedPointNumbers",
    "SortingAlgorithms",
    # Testing
    "Debug",
    "Benchmark",
    "FactCheck",
    # Functional
    "Lazy",
    "Match",
    "FunctionalCollections",
    # Python
    "PyPlot",
    "PyCall",
    "Pandas",
    # Stats
    "StatsBase",
    "DataFrames",
    "RDatasets",
]

for p in packages
    Pkg.add(p)
end


