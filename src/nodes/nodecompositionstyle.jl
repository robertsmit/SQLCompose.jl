abstract type NodeCompositionStyle end
struct NodeElement <: NodeCompositionStyle end
struct NodeStructure <: NodeCompositionStyle end

NodeCompositionStyle(::Type) = NodeElement()

NodeCompositionStyle(::Type{<:Tuple}) = NodeStructure()
NodeCompositionStyle(::Type{<:NamedTuple}) = NodeStructure()

