module MacroTools

using DataStructures, Compat
using Compat.Markdown
export @match, @capture

include("match/match.jl")
include("match/types.jl")
include("match/union.jl")
include("match/macro.jl")

include("utils.jl")
include("structdef.jl")

include("examples/destruct.jl")
include("examples/threading.jl")
include("examples/forward.jl")

include("patch/diff.jl")
include("patch/location.jl")
include("patch/cst.jl")

const animals = Symbol[]
const animals_file = joinpath(@__DIR__, "..", "animals.txt")

# Load and initialize animals symbols.
_animals = split(read(animals_file, String))
resize!(animals, length(_animals))
animals .= Symbol.(lowercase.(_animals))
Compat.Random.shuffle!(animals)

end # module
