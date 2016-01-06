
"""Write the first `n` chars of "Hello World!" to a buffer using a C call. """
function hello_c(n::Int)
    buffer = zeros(Cchar, n)
    val = ccall((:HelloWorld, "./rosetta.so"), Csize_t, (Ptr{Cchar}, Csize_t), 
                buffer, length(buffer))
    val = convert(Int64, val)
    string = bytestring(pointer(buffer))
    val, string
end

@show hello_c(5)
@show hello_c(13)
@show hello_c(20)
