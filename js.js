program belépési pontja

osztály
adattag
tagfügvény
lista
privát
publikus
példányosítás
konstruktor

típus:
lista
objektum
html Element

eseménykezelő

 #esemenyTrigger() {
        const esemenyem = new CustomEvent("torles", { detail: this.#index });
        window.dispatchEvent(esemenyem);
    }