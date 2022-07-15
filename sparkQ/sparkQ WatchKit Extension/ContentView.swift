//
//  ContentView.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var questionList : [QuestionModel] = [
        QuestionModel(question: "Kapan terakhir kali kamu berjalan lebih dari satu jam? Kemana kamu pergi? dan apa pengalamannya?"),
        QuestionModel(question: "Apa hadiah terbaik yang pernah kamu terima dan mengapa?"),
        QuestionModel(question: "Jika kamu harus pindah dari tempat tinggalmu sekarang, ke mana kamu akan pergi, dan apa yang paling kamu rindukan dari tempat tinggalmu sekarang?"),
        QuestionModel(question: "Bagaimana kamu merayakan tahun baru / malam tahun baru yang lalu?"),
        QuestionModel(question: "Apakah kamu sering nonton drama korea? atau mana movie yang kamu sukai? lebih menyukai genre seperti apa? Mengapa?"),
        QuestionModel(question: "Adakah pengalaman yang mengasikkan pada saat kamu sekolah dulu?"),
        QuestionModel(question: "Jika kamu bisa menemukan eskrim rasa baru, rasa apa itu? Mengapa?"),
        QuestionModel(question: "Apa restoran terbaik yang pernah kamu kunjungi dalam sebulan terakhir yang belum pernah dikunjungi oleh pasangan kamu?  Coba beritahu hal itu."),
        QuestionModel(question: "Jelaskan hewan peliharaan terakhir yang kamu miliki."),
        QuestionModel(question: "Apa liburan favoritmu? Mengapa?"),
        QuestionModel(question: "Beri tahu pasangan kamu hal terlucu yang pernah terjadi kepada kamu ketika kamu bersama seorang anak kecil."),
        QuestionModel(question: "Hadiah apa yang kamu terima di ulang tahun terakhir kamu?"),
        
        QuestionModel(question: "Jelaskan terakhir kali kamu pergi ke kebun binatang."),
        QuestionModel(question: "Beri tahu nama dan usia anggota keluarga kamu, termasuk kakek-nenek, bibi dan paman, dan di mana mereka lahir (sejauh kamu mengetahui informasi ini)."),
        QuestionModel(question: "Salah satu dari kamu mengucapkan sebuah kata, yang berikutnya mengucapkan kata yang dimulai dengan huruf terakhir dari kata yang baru saja diucapkan. Lakukan ini sampai kamu mengucapkan 50 kata. Kata-kata apa pun boleh - kata bukan kalimat."),
        QuestionModel(question: "Suka bangun pagi atau begadang? Apakah ada pengalaman lucu dari itu?"),
        QuestionModel(question: "Dari mana kamu berasal? Sebutkan semua tempat yang pernah kamu kunjungi."),
        QuestionModel(question: "Apa kursus atau kelas favoritmu? Bisa ceritakan mengapa?"),
        QuestionModel(question: "Apa yang kamu lakukan pada liburan tahun baru kemarin?"),
        QuestionModel(question: "Apa hadiah yang kamu terima terakhir kali? Apa kamu menyukainya?"),
        QuestionModel(question: "Siapa aktor favorit kamu menurut jenis kelamin kamu sendiri? Jelaskan adegan favoritnya."),
        QuestionModel(question: "Apa tanggapanmu mengenai kuliah? Apakah itu perlu?"),
        QuestionModel(question: "Apa acara TV terbaik yang pernah Anda lihat dalam sebulan terakhir? yang pasangan kamu belum melihat? Beritahu ke pasangan kamu mengenai itu."),
        QuestionModel(question: "Apakah kamu pernah mengalami liburan yang paling asik? Coba ceritakan."),
        
        QuestionModel(question: "Kamu SMA atau SMK? Dimana itu? Bagaimana pengalamannya?"),
        QuestionModel(question: "Apa buku terbaik yang pernah kamu baca dalam tiga bulan terakhir yang belum dibaca pasangan kamu? Beritahu pasangan kamu tentang hal itu."),
        QuestionModel(question: "Jika mau keluar negeri, kemana yang paling kamu suka? Kenapa?"),
        QuestionModel(question: "Kamu lebih suka mana? Jam tangan digital, smart watch atau jam biasa? Pakai di tangan sebelah mana? Mengapa?"),
        QuestionModel(question: "Ceritakan bagaimana teman baik mamamu."),
        QuestionModel(question: "Apa kelebihan dan kekurangan dari pohon natal buatan?"),
        QuestionModel(question: "Seberapa sering kamu memotong rambut? Kemana kamu pergi? Pernahkah kamu mengalami pengalaman potong rambut yang sangat buruk?"),
        QuestionModel(question: "Apakah kamu memiliki hewan peliharaan kelas ketika kamu masih di sekolah dasar? Apakah kamu ingat nama hewan peliharaan itu?"),
        QuestionModel(question: "Menurutmu apakah benar orang kidal lebih kreatif daripada orang yang pengguna tangan kanan?"),
        QuestionModel(question: "Apa konser terakhir yang kamu lihat? Berapa banyak dari itu? album band yang kamu miliki? Pernahkah kamu melihat mereka sebelumnya? Di mana?"),
        QuestionModel(question: "Apakah kamu berlangganan majalah apa pun? Yang mana? apa yang sudah kamu berlangganan sebelumnya?"),
        QuestionModel(question: "Apakah kamu pernah bermain di sekolah? Apa peran kamu? Apa plot dari permainan itu? Apakah sesuatu yang lucu pernah terjadi ketika kamu berada di atas panggung / depan kelas?"),
    ]
    var questions: [String] = [
        "Given the choice of anyone in the world, whom would you want as a dinner guest?",
        "What does friendship mean to you?",
        "I don't know why? You say goodbye."
    ]
    
    var body: some View {
        List(Array(zip(questionList.indices, $questionList.sorted(by: { a, b in
            (a.isPinned.wrappedValue && !b.isPinned.wrappedValue)
        }))), id: \.0) { index, $question in
            
//        List($questionList, id: \.self) { $question in
            CustomListItem(counter: index + 1, question: question)
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        withAnimation {
                            question.isPinned.toggle()
                        }
                    } label: {
                        Image(systemName: "pin")
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button {
                    withAnimation {
                        question.isChecked.toggle()
                    }
                } label: {
                    Image(systemName: "checkmark")
                }
            }
        }
        .listStyle(CarouselListStyle())
//        .onChange(of: questionList) { _ in
//            questionList = questionList.sorted(by: { a, b in
//                a.isPinned && !b.isPinned
//            })
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
