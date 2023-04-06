abstract type NodeCompositionStyle end
struct NodeElement <: NodeCompositionStyle end
struct NodeStructure <: NodeCompositionStyle end
# Default behavior is illiquid
NodeCompositionStyle(::Type) = NodeElement()

# Cash is always liquid
NodeCompositionStyle(::Type{Tuple}) = NodeStructure()
NodeCompositionStyle(::Type{NamedTuple}) = NodeStructure()

