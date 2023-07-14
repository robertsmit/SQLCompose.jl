
abstract type CharacterType <: SQLType end

#variable unlimited length
struct TextType <: CharacterType end

#fixed-length, blank padded
struct CharType <: CharacterType
    length::UInt64
end

#variable-length with limit
struct VarCharType <: CharacterType
    limit::UInt64
end
