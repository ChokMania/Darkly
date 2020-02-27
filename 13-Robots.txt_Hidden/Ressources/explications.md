# Explications
Dans la page "robots.txt", trouver precedemment:

<pre>User-agent: *
Disallow: /whatever
Disallow: /.hidden</pre>

Il y a un dossier <code>/.hidden</code> que l'on à pas explorer.

Dedans ce trouve un arborescence assez "complèxe".

<pre>
amcbevgondgcrloowluziypjdh/                        11-Sep-2001 21:21                   -
bnqupesbgvhbcwqhcuynjolwkm/                        11-Sep-2001 21:21                   -
ceicqljdddshxvnvdqzzjgddht/                        11-Sep-2001 21:21                   -
doxelitrqvhegnhlhrkdgfizgj/                        11-Sep-2001 21:21                   -
eipmnwhetmpbhiuesykfhxmyhr/                        11-Sep-2001 21:21                   -
ffpbexkomzbigheuwhbhbfzzrg/                        11-Sep-2001 21:21                   -
ghouhyooppsmaizbmjhtncsvfz/                        11-Sep-2001 21:21                   -
hwlayeghtcotqdigxuigvjufqn/                        11-Sep-2001 21:21                   -
isufpcgmngmrotmrjfjonpmkxu/                        11-Sep-2001 21:21                   -
jfiombdhvlwxrkmawgoruhbarp/                        11-Sep-2001 21:21                   -
kpibbgxjqnvrrcpczovjbvijmz/                        11-Sep-2001 21:21                   -
ldtafmsxvvydthtgflzhadiozs/                        11-Sep-2001 21:21                   -
mrucagbgcenowkjrlmmugvztuh/                        11-Sep-2001 21:21                   -
ntyrhxjbtndcpjevzurlekwsxt/                        11-Sep-2001 21:21                   -
oasstobmotwnezhscjjopenjxy/                        11-Sep-2001 21:21                   -
ppjxigqiakcrmqfhotnncfqnqg/                        11-Sep-2001 21:21                   -
qcwtnvtdfslnkvqvzhjsmsghfw/                        11-Sep-2001 21:21                   -
rlnoyduccpqxkvcfiqpdikfpvx/                        11-Sep-2001 21:21                   -
sdnfntbyirzllbpctnnoruyjjc/                        11-Sep-2001 21:21                   -
trwjgrgmfnzarxiiwvwalyvanm/                        11-Sep-2001 21:21                   -
urhkbrmupxbgdnntopklxskvom/                        11-Sep-2001 21:21                   -
viphietzoechsxwqacvpsodhaq/                        11-Sep-2001 21:21                   -
whtccjokayshttvxycsvykxcfm/                        11-Sep-2001 21:21                   -
xuwrcwjjrmndczfcrmwmhvkjnh/                        11-Sep-2001 21:21                   -
yjxemfsgdlkbvvtjiylhdoaqkn/                        11-Sep-2001 21:21                   -
zzfzjvjsupgzinctxeqtzzdzll/                        11-Sep-2001 21:21                   -
README                                             11-Sep-2001 21:21                  34
</pre>

Avec un depth = 3, avec au niveau 3 un README contenant un message.
Donc on cherche dans 26^3 dossier notre flag avec une commande curl et donc 26^3 + 1 + 26 + 26*26 README.

<pre><code>wget -r -np -R "index.html*" -e robots=off --no-parent --no-directories "http://192.168.1.175/.hidden/"
</code></pre>
> On obtient donc bien 18279 README (en comptant ceux present a chaque racines de nouveaux dossiers)

En faisant du tri dedans, en supprimant des doublons etc
On trouve enfin le flag dans le fichier README.15794.
Avec un calcul on en deduis donc qu'il se trouve :
<pre><code>.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README</code></pre>



# Comment l'éviter ?
Il faut proteger la page en question avec un .htaccess.

# Bonus
Ce flag est plus court que les autres pour eviter qu'on puisse reperer le flag juste au nombre de char.