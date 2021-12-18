declare

fun {NewEnv N} {NewArray 1 N none()} end

fun {GetNode Env Id}
   case {Get Env Id}
   of none() then
      local N = {NewCell node(Id Id)} in
         {Put Env Id N} N
      end
   [] N then N end
end

fun {Parent Env N}
   if @N.1 == @N.2 then N
   else {Parent Env {GetNode Env @N.2}} end
end

proc {UpdateParent N P} N := node(@N.1 @P.1) end

fun {IsParent Env I}
   local N = {GetNode Env I} in
      @N.1 == @{Parent Env N}.1
   end
end

proc {Connect Env N M}
   local P = {Parent Env N}
         Q = {Parent Env M} in
      if @P.1 < @Q.1 then
         {UpdateParent Q P}
         {UpdateParent M P}
         {UpdateParent N P}
         {UpdateParent {GetNode Env @N.2} P}
      else
         {UpdateParent P Q}
         {UpdateParent N Q}
         {UpdateParent M Q}
         {UpdateParent {GetNode Env @M.2} Q}
      end
   end
end

fun {ReadInt L R}
   case L
   of nil then L#R
   [] H|L then
      if {Char.isDigit H} then {ReadInt L H|R}
      else {String.toInt {List.reverse R}}#L end
   end
end

fun {Solve N L}
   local R = {NewCell 1} Env = {NewEnv N}
      fun {Iter L}
         case L of nil then _
         else
            local I J in
               I = {ReadInt L nil}
               J = {ReadInt I.2 nil}
               {Connect Env {GetNode Env I.1} {GetNode Env J.1}}
               {Iter J.2}
            end
         end
      end
   in
      _ = {Iter L}
      for I in 1..N do
         if {IsParent Env I} then R := (@R * 2) mod 998244353 end
      end
      @R
   end
end

local N M S I = {New Open.file init(url: '49.txt')} in
   {I read(size: all list: S)}
   N = {ReadInt S nil}
   M = {ReadInt N.2 nil}
   if N.1 == M.1 then {Show {Solve N.1 M.2}}
   else {Show 0} end
   {I close()}
end
