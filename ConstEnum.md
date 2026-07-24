# `ConstEnum`
[🔗](https://github.com/bacnet-ex/const_enum/blob/master/lib/const_enum.ex#L1)

This module provides macros to define constants, which get compiled into functions.
To use this feature, this module must be included into the module using `use/2`.

`use/2` will then compile a few things into the module:
  - A list of constants (only available at compile time, to get it at runtime, you need to
  add a function to retrieve the `:constants` attribute)
  - Add `before_compile` hook
  - Constants docs chunks from `defconstforward/2` included modules
  - Generate module docs with all constants, rendered as table by type,
    in the module when giving the option `generate_docs: true`, if the module already contains
    module docs, the constants docs will be appended to it

Constants can be annotated with the `constdoc` attribute to provide a documentation string for the constant type.
The `ctypedoc` attribute will set the type description (if types are generated and `constdoc` are not copied to the type).
The `ctable` attribute allows with `false` to disable generating a moduledoc table section for the type (any other value ignored).

The following functions and macros are created to work with the constants:
  - Function `assert_name/2` - Asserts that the constant exists (returns the name) as success tuple
  - Function `assert_name!/2` - Asserts that the constant exists (returns the name)
  - Function `by_name/2`, `by_name/3` - Returns the constant value by type and name as success tuple
  - Function `by_name!/2` - Returns the constant value by type and name
  - Function `by_value/2`, `by_value/3` - Returns the constant name by type and value as success tuple
  - Function `by_value!/2` - Returns the constant name by type and value
  - Function `has_by_name/2` - Checks whether the constant identified by type and name exists
  - Function `has_by_value/2` - Checks whether the constant identified by type and value exists
  - Macro `macro_assert_name/2` - Same as `assert_name!/2` but as macro
  - Macro `macro_by_name/2` - Same as `by_name!/2` but as macro
  - Macro `macro_by_value/2` - Same as `by_value!/2` but as macro

All bang functions will fail with `RuntimeError` (overridable with `:exception`),
if the constant does not exist. Likewise for macros.

# `__using__`
*macro* 

```elixir
@spec __using__(Keyword.t()) :: Macro.t()
```

The `use` hook to get started with defining constants (enums).

The following options are available:
- `copy_doc_to_type: boolean()` - Optional. Copy the docs from the constant to the types.
- `exception: module()` - Optional. The exception module to use.
- `generate_docs: boolean()` - Optional. Generate documentation for each constant type.
  This will include generating types by default. Types have the `type` as their name.
  For values, this will be the `type` with the suffix `_value`.
- `generate_types_value: boolean()` - Optional. Generate types for not only the name,
  but also the values.
- `ignore_duplicates: boolean()` - Optional. Sets the pattern match clause as generated
  and thus will silence any warning about duplicate matches (i.e. duplicated name or value).
- `no_types: boolean()` - Optional. Do not generate any types.

# `defconst`
*macro* 

```elixir
@spec defconst(atom(), atom(), term()) :: Macro.t()
```

Define a constant by type, name and value.

# `defconst_extend_env`
*macro* 

```elixir
@spec defconst_extend_env(atom(), atom(), term(), (atom(), term() -&gt; boolean()) | nil) ::
  Macro.t()
```

Generates code to register additional constants through an Enumerable
from the given application environment.
The additional constants are registered to the defined type.

The Enumerable elements must have an atom as key (for name) and
any term as value (typically a non-negative integer for the BACnet protocol).

An optional validator function can be given to validate each new constant name and value.
The first argument is the name and the second argument is the value.

# `defconstforward`
*macro* 

```elixir
@spec defconstforward(module(), atom()) :: Macro.t()
```

Define a constant forward to constants defined in another module.

This will allow to use the functions and macros in this module to
access the constants in the other module.

---

*Consult [api-reference.md](api-reference.md) for complete listing*
