## From discussion on [reddit](https://np.reddit.com/r/DelphiMarkets/comments/6ovjrq/we_are_delphi_ask_us_anything/dkotovo/)

Not sure why you got the downvotes. Possibly because of swearing?..

I find it appropriate here. What has happened to the "authorship lineage" is unacceptable in FOSS.

-----

I'm only catching up to the debacle, and now seeing that, indeed, [delphi-markets/delphi-framework](https://github.com/delphi-markets/delphi-framework) is a close copy of [gnosis/gnosis-contracts](https://github.com/gnosis/gnosis-contracts).

The `git` history is indeed scrubbed, hiding the changes of, e.g., NatSpec `@author` in `contracts/Oracles/DifficultyOracleFactory.sol`: compare [gnosis](https://github.com/gnosis/gnosis-contracts/blob/354668d21e824015ac370d5aa20a61540b9e2b1f/contracts/Oracles/DifficultyOracleFactory.sol#L6) and [delphi](https://github.com/delphi-markets/delphi-framework/blob/049a560f3621b408b305c1199819b86a3769c54f/contracts/Oracles/DifficultyOracleFactory.sol#L6).

(BTW, the [comment typo](https://github.com/delphi-markets/delphi-framework/blob/049a560f3621b408b305c1199819b86a3769c54f/contracts/Oracles/DifficultyOracleFactory.sol#L5) still present in delphi's variant of the file may well act as a "fingerprint" of which version of Gnosis was scrub-cloned).

There is absolutely no reason to clone like this, except for:

* intending to hide the fact it's a clone, by wiping history; or
* gross incompetence in code-sharing through online repos, and FOSS etiquette.

-----

There is a way of keeping a repo "top-level", which will grant contributors those important green boxes on their activity stream, without scrubbing history. To do that, `delphi-markets` would have to:

* create a new repo, like `delphi-markets/delphi-gnosis-compat`;
* clone `gnosis/gnosis-contracts` locally;
* change the `origin` remote to `delphi-markets/delphi-gnosis-compat`;
* apply any changes present in `delphi-markets/delphi-framework`;
* push that to `delphi-markets/delphi-gnosis-compat`;
* "mark" `delphi-markets/delphi-framework` as obsolete, by editing the `README` (again), and in github's project description.

From then on, reference the new "compat" repo everywhere.

This is how it should have been done from the get-go. `git` history is valuable entropy. How do you `git blame` when you don't have it?..

This has the added bonus of easy comparison between the projects using github's PR tools, without explicitly linking one project as a dependent of the other. I've personally used this a few times when forking someone else's code with the intent of maintaining some set of incompatible changes, while still being able to cherry-pick compatible ones (such as security bugfixes).

-----

EDITs: typo, expand


## And [another one](https://np.reddit.com/r/DelphiMarkets/comments/6ovjrq/we_are_delphi_ask_us_anything/dkp224j/)

> My guess is they wanted to hide their identities after they leaked into the repo from a commit attached to the wrong email. I did this once in the past (committed from personal identity instead of work) it's easy to do.

Maybe.

Still, they could've instead deleted the privacy-leaking repo altogether, changed the `git` name/mail (as they have done in the current incarnation), and retained full commit history.

-----

Also, the [current commit history](https://github.com/delphi-markets/delphi-framework/commits/master) gives me the creeps.

Why ~~are~~ is there [a second commit titled "Initial framework commit"](https://github.com/delphi-markets/delphi-framework/commit/bfb11b79921bc7dcac46fdbb8ab8dcf685cd00ee)?

What the hell does [Key #6 successfully found in community (no more need to leave visible)](https://github.com/delphi-markets/delphi-framework/commit/80c4d6fa0db50cf460bab4b01a6ef400c1348815) or [Bury meta-clue](https://github.com/delphi-markets/delphi-framework/commit/1747b3536ec03c2779f36779faa5a3727ff12218)?

Is this a Cicada contest? Will this be featured in "Mr. Robot"? Is there life on Enceladus?..

Seriously, the sloppiness with git and the seemingly well-worded articles on Medium present an incoherent picture, as far as "competence" is ~~related~~ considered.
