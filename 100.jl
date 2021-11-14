#%%
using Combinatorics
#%%
# FourArithmetic = [+,-,*,/]
# fs = with_replacement_combinations(FourArithmetic,3)# 20 operators
# collect(permutations(FourArithmetic,3))
# collect(fs)
function allfs(FourArithmetic)
    A = []
    fs = with_replacement_combinations(FourArithmetic,3)# 20 operators
    for f in fs
        xs = Set(collect(permutations(f)))
        # println(xs)
        for x in xs
            push!(A,x)
        end
    end
    return A
end
# fs = allfs(FourArithmetic)

#%%
function allps(x)
    # ps = permutations(x)# 24
    ps = []
    for x in Set(collect(permutations(x)))# same -> omit
        push!(ps,x)
    end
    return ps
end
function ifans(p1234,_ans,err,p,f,txt)
    if abs(p1234 - _ans) < err
        print(p, " ")
        print(f, " ")
        println(p1234)
        println(txt)
    end
    return nothing
end
function F1(ps,_ans,err=0.0001)# no parentheses ((1 / 2) - 3) / 4
    for p in ps
        # println(p," ")
        for f in fs
            # println(f," ")
            p12   = f[1](p[1],p[2])
            p123  = f[2](p12 ,p[3])
            p1234 = f[3](p123,p[4])
            # println(p1234)
            # n +=1
            txt=("(($(p[1]) $(f[1]) $(p[2])) $(f[2]) $(p[3])) $(f[3]) $(p[4]) = $p1234")
            ifans(p1234,_ans,err,p,f,txt)
        end
    end
    # println(n)
end
function F2(ps,_ans,err=0.0001)# parentheses (1 / 2) - (3 / 4)
    for p in ps
        # println(p," ")
        for f in fs
            # println(f," ")
            p12   = f[1](p[1],p[2])
            p34   = f[3](p[3],p[4])
            p1234 = f[2](p12, p34)
            txt=("($(p[1]) $(f[1]) $(p[2])) $(f[2]) ($(p[3]) $(f[3]) $(p[4])) = $p1234")
            ifans(p1234,_ans,err,p,f,txt)
        end
    end
end
function F3(ps,_ans,err=0.0001)# no parentheses (1 - (2 / 3)) / 4
    for p in ps
        # println(p," ")
        for f in fs
            # println(f," ")
            p23   = f[2](p[2],p[3])
            p13  = f[1](p[1] ,p23)
            p1234 = f[3](p13,p[4])
            # println(p1234)
            txt=("( $(p[1]) $(f[1]) ($(p[2]) $(f[2]) $(p[3])) ) $(f[3]) $(p[4]) = $p1234")
            ifans(p1234,_ans,err,p,f,txt)
        end
    end
end
function F4(ps,_ans,err=0.0001)# 1 / (2 / 3 - 4)
    for p in ps
        # println(p," ")
        for f in fs
            # println(f," ")
            p23   = f[2](p[2],p[3])
            p24  = f[3](p23 ,p[4])
            p1234 = f[1](p[1],p24)
            # println(p1234)
            txt=("$(p[1]) $(f[1]) ( ($(p[2]) $(f[2]) $(p[3])) $(f[3]) $(p[4]) ) = $p1234")
            ifans(p1234,_ans,err,p,f,txt)
        end
    end
end
function F5(ps,_ans,err=0.0001)# 1 / (2 - 3 / 4)
    for p in ps
        # println(p," ")
        for f in fs
            # println(f," ")
            p34  =  f[3](p[3],p[4])
            p24   = f[2](p[2],p34)
            p1234 = f[1](p[1],p24)
            # println("$p34, $p24, $p1234")
            txt=("$(p[1]) $(f[1]) ( $(p[2]) $(f[2]) ($(p[3]) $(f[3]) $(p[4])) ) = $p1234")
            ifans(p1234,_ans,err,p,f,txt)
        end
    end
end
FourArithmetic = [+,-,*,/]
fs = allfs(FourArithmetic)

_ans = 10
x = [1,3,3,7]# (7 / 3 + 1) * 3
#%%
# x = [1,1,5,8]# 8 / (1 - 1 / 5) rand(0:9,4)
# x  = rand(0:9,4)
# x = [1,1,1,6]
println("Four numbers are $x")
ps = allps(x)
FS = [F1,F2,F3,F4,F5]
function main(FS)
    @time for F in FS
        F(ps,_ans)
    end
end
main(FS)
#%% 
# ((1 / 2) - 3) / 4 # (7 / 3 + 1) * 3
# 1 / 2 - 3 / 4 = (1 / 2) - (3 / 4)
# (1 - (2 / 3)) / 4
# 1 / (2 / 3 - 4)
# 1 / (2 - 3 / 4)
# [7, 7, 9, 7]