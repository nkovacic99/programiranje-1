import csv
import os
import re
import requests
<<<<<<< HEAD

=======
>>>>>>> 03672c860183d3d16067518d3dba04a2ddb858dc
###############################################################################
# Najprej definirajmo nekaj pomožnih orodij za pridobivanje podatkov s spleta.
###############################################################################

# definiratje URL glavne strani bolhe za oglase z mačkami
cats_frontpage_url = 'http://www.bolha.com/zivali/male-zivali/macke/'
# mapa, v katero bomo shranili podatke
cat_directory = 'macke'
# ime datoteke v katero bomo shranili glavno stran
frontpage_filename = 'macke'
# ime CSV datoteke v katero bomo shranili podatke
csv_filename = 'macke'


def download_url_to_string(url):
    """Funkcija kot argument sprejme niz in puskuša vrniti vsebino te spletne
    strani kot niz. V primeru, da med izvajanje pride do napake vrne None.
    """
    try:
        # del kode, ki morda sproži napako
        page_content = requests.get(url)
<<<<<<< HEAD
    except Exception as e:
=======
    except 'TODO':
>>>>>>> 03672c860183d3d16067518d3dba04a2ddb858dc
        # koda, ki se izvede pri napaki
        # dovolj je če izpišemo opozorilo in prekinemo izvajanje funkcije
        print(e)
    # nadaljujemo s kodo če ni prišlo do napake
    return page_content.text


def save_string_to_file(text, directory, filename):
    """Funkcija zapiše vrednost parametra "text" v novo ustvarjeno datoteko
    locirano v "directory"/"filename", ali povozi obstoječo. V primeru, da je
    niz "directory" prazen datoteko ustvari v trenutni mapi.
    """
    os.makedirs(directory, exist_ok=True)
    path = os.path.join(directory, filename)
    with open(path, 'w', encoding='utf-8') as file_out:
        file_out.write(text)


# Definirajte funkcijo, ki prenese glavno stran in jo shrani v datoteko.


def save_frontpage(page, directory, filename):
    """Funkcija shrani vsebino spletne strani na naslovu "page" v datoteko
    "directory"/"filename"."""
<<<<<<< HEAD
    page_data = download_url_to_string(page)
    save_string_to_file(page_data, directory, filename)
=======
    save_string_to_file(download_url_to_string(page), directory, filename)
>>>>>>> 03672c860183d3d16067518d3dba04a2ddb858dc


###############################################################################
# Po pridobitvi podatkov jih želimo obdelati.
###############################################################################


def read_file_to_string(directory, filename):
    """Funkcija vrne celotno vsebino datoteke "directory"/"filename" kot niz"""
<<<<<<< HEAD
    full_path = os.path.join(directory, filename)
    with open(full_path, 'r', encoding='utf-8') as f:
        return f.read()
=======
    path = os.path.join(directory, filename)
    with open(path, 'r', encoding='utf-8') as f:
        return (f.read())
>>>>>>> 03672c860183d3d16067518d3dba04a2ddb858dc


# Definirajte funkcijo, ki sprejme niz, ki predstavlja vsebino spletne strani,
# in ga razdeli na dele, kjer vsak del predstavlja en oglas. To storite s
# pomočjo regularnih izrazov, ki označujejo začetek in konec posameznega
# oglasa. Funkcija naj vrne seznam nizov.


def page_to_ads(page_content):
    """Funkcija poišče posamezne ogllase, ki se nahajajo v spletni strani in
    vrne njih seznam"""
<<<<<<< HEAD
    exp = r'<div class="coloumn content">(.*?)<div class="clear">'
    return re.findall(exp, page_content, re.DOTALL)

=======
    iskalna_zahteva = re.compile(r'<div class="ad">(.*?)<div class="clear">',re.DOTALL)
    return(re.findall(iskalna_zahteva, page_content))
>>>>>>> 03672c860183d3d16067518d3dba04a2ddb858dc

# Definirajte funkcijo, ki sprejme niz, ki predstavlja oglas, in izlušči
# podatke o imenu, ceni in opisu v oglasu.


def get_dict_from_ad_block(block):
    """Funkcija iz niza za posamezen oglasni blok izlušči podatke o imenu, ceni
    in opisu ter vrne slovar, ki vsebuje ustrezne podatke
    """
    iskana_zahteva = re.compile(
        r'title="(?P<ime>.*?)"'
        r'.*?</h3>\s*(?P<opis>.*?)\s*</?div'
        r'.*?class="price">(<span>)?(?P<cena>.*?)'
        r'( €</span>)?</div', re.DOTALL)
    oglasi = re.search(iskana_zahteva, block)
    slovar_oglasov = oglasi.groupdict()
    return slovar_oglasov

# Definirajte funkcijo, ki sprejme ime in lokacijo datoteke, ki vsebuje
# besedilo spletne strani, in vrne seznam slovarjev, ki vsebujejo podatke o
# vseh oglasih strani.


def ads_from_file(filename, directory):
    """Funkcija prebere podatke v datoteki "directory"/"filename" in jih
    pretvori (razčleni) v pripadajoč seznam slovarjev za vsak oglas posebej."""
    seznam_slovarjev = list()
    for oglas in page_to_ads(read_file_to_string(directory, filename)):
        seznam_slovarjev.append(get_dict_from_ad_block(oglas))
    return seznam_slovarjev

###############################################################################
# Obdelane podatke želimo sedaj shraniti.
###############################################################################


def write_csv(fieldnames, rows, directory, filename):
    """
    Funkcija v csv datoteko podano s parametroma "directory"/"filename" zapiše
    vrednosti v parametru "rows" pripadajoče ključem podanim v "fieldnames"
    """
    os.makedirs(directory, exist_ok=True)
    path = os.path.join(directory, filename)
    with open(path, 'w') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)
    return


# Definirajte funkcijo, ki sprejme neprazen seznam slovarjev, ki predstavljajo
# podatke iz oglasa mačke, in zapiše vse podatke v csv datoteko. Imena za
# stolpce [fieldnames] pridobite iz slovarjev.


def write_cat_ads_to_csv(ads, directory, filename):
    """Funkcija vse podatke iz parametra "ads" zapiše v csv datoteko podano s
    parametroma "directory"/"filename". Funkcija predpostavi, da sa ključi vseh
    sloverjev parametra ads enaki in je seznam ads neprazen.

    """
    # Stavek assert preveri da zahteva velja
    # Če drži se program normalno izvaja, drugače pa sproži napako
    # Prednost je v tem, da ga lahko pod določenimi pogoji izklopimo v
    # produkcijskem okolju
    assert ads and (all(j.keys() == ads[0].keys() for j in ads))
    raise NotImplementedError()


# Celoten program poženemo v glavni funkciji

def main(redownload=True, reparse=True):
    """Funkcija izvede celoten del pridobivanja podatkov:
    1. Oglase prenese iz bolhe
    2. Lokalno html datoteko pretvori v lepšo predstavitev podatkov
    3. Podatke shrani v csv datotekož
    """
    # Najprej v lokalno datoteko shranimo glavno stran
<<<<<<< HEAD
    save_frontpage('http://www.bolha.com/zivali/male-zivali/macke/', cat_directory, frontpage_filename)
    # Iz lokalne (html) datoteke preberemo podatke

    content = read_file_to_string(cat_directory, frontpage_filename)
    print(page_to_ads(content)[-1])
=======
    save_string_to_file(download_url_to_string(cats_frontpage_url), cat_directory, frontpage_filename)    
    # Iz lokalne (html) datoteke preberemo podatke
    ads = page_to_ads(read_file_to_string(cat_directory, frontpage_filename))
>>>>>>> 03672c860183d3d16067518d3dba04a2ddb858dc
    # Podatke prebermo v lepšo obliko (seznam slovarjev)
    seznam_slovarjev = ads_from_file(frontpage_filename, cat_directory))
    # Podatke shranimo v csv datoteko
    
    # Dodatno: S pomočjo parameteov funkcije main omogoči nadzor, ali se
    # celotna spletna stran ob vsakem zagon prense (četudi že obstaja)
    # in enako za pretvorbo



if __name__ == '__main__':
    main()
