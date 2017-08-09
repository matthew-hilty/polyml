(*
    Copyright (c) 2017 David C.J. Matthews

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License version 2.1 as published by the Free Software Foundation.
    
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
    
    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*)

signature X86GETCONFLICTSETSIG =
sig
    type 'reg x86ICode and reg and abstract
    
    type intSet
    
    type conflictState =
    {
        conflicts: intSet, realConflicts: reg list
    }
    
    val getConflictStates:
        {instr: abstract x86ICode, active: intSet, current: intSet} list * int -> conflictState vector

    structure Sharing:
    sig
        type 'reg x86ICode = 'reg x86ICode
        and reg = reg
        and abstract = abstract
        and intSet = intSet
    end;
end;