# Game-Development/tutorial-7
## https://csui-game-development.github.io/tutorials/tutorial-7/

### Latihan: Basic 3D Plane Movement
- Membuat scene dengan root CharacterBody
- Tambahkan child node MeshInstance3D, CollisionShape3D, dan Node3D
- Beri bentuk capsule untuk MeshInstance3D dan CollisionShape3D
- Tambahkan child node Camera3D pada Node3D
- Tambahkan child node RayCast3D pada Camera3D
- Atur rotasi Raycast3D sehingga searah dengan Camera3D
- Tambahkan script pada root untuk karakter bergerak
- Tambahkan Input Map pada Project Setting sesuai script baru

### Latihan: Object Interaction
- Membuat base script baru bernama Interactable
- Tambahkan script pada StaticBody3D dalam Switch
- Mengatur export variabel PackedScene menjadi OmniLight3D
- Tambahkan script pada RayCast3D untuk interaksi dengan Interactable
- Konek signal RayCast3D dengan fungsi dalam script

### Latihan: Membuat Level 3D Menggunakan CSG
- Buat Level1.tscn dengan root node Node3D
- Tambahkan Player, OmniLight3D, dan Switch dalam Level1.tscn
- Buat World1.tscn dengan root node Node3D
- Bikin dunia Level 1 di dalam World 1 menggunakan CSGBox3D
- Buat jurang menggunakan CSGBox3D
- Berikan Area3D di bawah jurang
- Tambahkan script pada Area3D untuk deteksi Player dan load scene Level1.tscn
- Tambahkan CSGBox3D di atas jurang untuk membantu Player meleawti jurang
- Buat Lamp.tscn dengan root node CSGCombiner3D
- Tambahkan 2 CSGCylinder3D dan 1 CSGPolygon3D
- Bentukkan CSG sehingga membentuk Lampu

### Latihan Mandiri: Eksplorasi Mechanics 3D
1. Pick up item & inventory system
- Membuat script global.gd dan aturkan dalam Project Settings
- global.gd melacak jumlah lampu yang telah dikoleksi pemain
- Tambahkan script pada Lamp.tscn yang menggunakan Interactable
- Atur script lamp.gd sehingga menghilangkan barang dan menambahkan jumlah lampu pada global.gd ketika diinteraksi
- Edit player.gd dengan menambahkan lampu di depan pemain jika klik "place" dan jumlah lampu yang dikoleksi lebih dari 0
- Tambahkan Input Map pada Project Setting sesuai script baru

2. Sprinting & crouching
- Menambahkan variabel speed_modifier dalam player.gd
- Jika pemain tekan "sprint" atau "crouch" maka speed_modifier akan diubah
- Jika pemain gerak biasa maka speed_modifier kembali seperti normal
- Kalikan speed dengan speed_modifier

3. Membuat animasi objek 3D
- Membuat scene baru dengan root CSGBox3D
- Tambahkan script pada rotatebox.tscn
- Atur rotasi Y CSGBox3D di dalam fungsi process
- Kalikan rotasi dengan delta sehingga berputar standardisasi
- Tambahkan rotatebox.tscn dalam Level1.tscn

4. Menambahkan HUD
- Menambahkan child node VBoxContainer dalam player.gd
- Tambahkan beberapa label yang menunjukkan jumlah lampu terkoleksi, speed_modifier, tujuan level, dan cara interaksi barang

### Referensi
- https://forum.godotengine.org/t/camera-forward/67002/6
