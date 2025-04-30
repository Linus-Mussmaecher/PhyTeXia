# PhyTeXia

Note that PhyTeXia relies heavily on LuaTeX and will thus only work with such compilers.

PhyTeXia is a package for LuaLaTeX that empowers users to write guides, papers and other documents about the trading card game Magic: The Gathering produced by Wizards of the Coast.
It provides macros that allow the input of game-related symbols as well as decks lists and card images.

Card images are provided by the API of the \emph{Scryfall} search engine available at \url{https://scryfall.com}.

Portions of PhyTeXia are unofficial Fan Content permitted under the Wizards of the Coast Fan Content Policy.
The literal and graphical information presented about Magic: The Gathering, including card images and mana symbols, is copyright Wizards of the Coast, LLC.
PhyTeXIa is not produced by or endorsed by Wizards of the Coast.

## Features
This section includes both completed and planned features while development is still ongoing.
- Include cards into your documents by just their name. Card images are downloaded using the API of [Scryfall](scyfall.com) in the background.
- Include card tooltips in your documents (only works in Adobe Acrobat).
- Include an automatic glossary of cards that you can refer to.
- Macros for all sorts of MTG mana symbols, including all colors of mana, colorless and generic mana, hybrid mana and phyrexian mana.
- Include other relevant symbols such as the tap and untap symbol and many more.
- Include decklists in a consistently formatted way from local files or online sites such as moxfield, archidekt, mtggoldfish and many more.

## Requirements
- Usage of LuaTeX
- An active connection to the web for the usage of the Scryfall API. Does not apply when using only symbols.
