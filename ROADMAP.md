The 0.0.x series are *very* unstable and may break the API with every commit, there will be
frequent releases to get feedback. Since 0.0.6 it goes into some battle testing for writing a
proc macro crate that does not need to parse rust syntax. Once that is settled a initial 0.1.0
release will be made with a more stable API. From there on the planned 'unsynn-rust' and along
that a 'unsynn-derive' will be implemented. When the later two are working and no major
deficiencies in 'unsynn' are found then it is time for a 1.0.0 release.


## Planned/Ideas

* can we add prettyprint for tokens_to_string?
  this needs a threadlocal storing some context (indent level, indent by (str of spaces), prettyprint flag)
* keyword! {
      // we have:
      Match = "match";
      // list alternative keywords, alias existing ones
      MatchMore = ["match", OtherKeyword];
      // negative matches
      DontMatchMore != ["Dont", "Match", OtherKeyword];
  }
* make proc_macro2 optional with a feature flag  
  this would disable parsing &str and related API's and most of the test suite. But should be
  sufficient for writiung lean proc_macro parsers.
* improve error handing
   - document how errors are reported and what the user can do to handle them
   - User can/should write forgiving grammars that are error tolerant
   - add tests error/span handling
* Brainfart: Dynamic parser construction  
  instead parse::<UnsynnType>()
  create a parse function dynamically from a str parsed by unsynn itself
  "Either<This, That>".to_parser().parse()
  this will need a `trait DynUnsynn` implementing the common/dynamic parts of these
  and a registry where all entities supporting dynamic construction are registered.
  This will likely be factored out into a unsynn-dyn crate
  Add some scanf like DSL to generate these parsers.
  xmacro may use it like $(foo@Ident: values)
* add rust types
  * f32: 32-bit floating point number
  * f64: 64-bit floating point number (default)


# Development

unsynn is meant to evolve opportunistically. When you spot a problem or need a new feature
feel free to open an [issue](https://git.pipapo.org/cehteh/unsynn/issues) or (prefered!) send
a [PR](https://git.pipapo.org/cehteh/unsynn/pulls).

Commits and other git operations are augmented and validated with
[cehgit](https://git.pipapo.org/cehteh/cehgit). For contributors it is recommened to enable
cehgit too by calling `./.cehgit install-hook --all` within a checked out unsynn repository.
