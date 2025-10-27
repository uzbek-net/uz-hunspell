Online kengaytmalar ro'yxati: https://extensions.libreoffice.org/en?q=&action_doExtensionSearch=Search

## Onlayn
LibreOffice'ga kirinb Tools -> Language > More Dictionaries Online 
va kengaytma nomini terib yuklab oling "Uzbek Spell Checker (O‘zbek tili)"

## Oflayn
LibreOffice'ga kirinb Tools -> Extensions > Add va `uzbek-dictionary.oxt`
-ni yuklang

.oxt faylni yangilash uchun quyidagi buyruq
```bash
zip -r uzbek-dictionary.oxt ./libreoffice/dictionary.lst ./libreoffice/description.xml uz_UZ.aff uz_UZ.dic
```
