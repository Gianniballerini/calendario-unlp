# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seed
user = User.create!(
	email: 'gianniballerini@gmail.com', 
	password: 'topsecret', 
	password_confirmation: 'topsecret')

# Career seeds.
sistemas = Career.create!(name: "Licenciatura en Sistemas")
informatica = Career.create!(name: "Licenciatura en Informatica")
apu = Career.create!(name: "Analista Programador Universitario")

# Year seeds.
sistemas_1st = Year.create!(name: "1st", career: sistemas)
sistemas_2nd = Year.create!(name: "2nd", career: sistemas)
sistemas_3rd = Year.create!(name: "3rd", career: sistemas)
sistemas_4th = Year.create!(name: "4th", career: sistemas)
sistemas_5th = Year.create!(name: "5th", career: sistemas)

informatica_1st = Year.create!(name: "1st", career: informatica)
informatica_2nd = Year.create!(name: "2nd", career: informatica)
informatica_3rd = Year.create!(name: "3rd", career: informatica)
informatica_4th = Year.create!(name: "4th", career: informatica)
informatica_5th = Year.create!(name: "5th", career: informatica)

apu_1st = Year.create!(name: "1st", career: apu)
apu_2nd = Year.create!(name: "2nd", career: apu)
apu_3rd = Year.create!(name: "3rd", career: apu)

# Subject seeds.
sistemas_1st_subject_list = [
	"Expresión de Problemas y Algoritmos",
	"Conceptos de Organización de Computadoras",
	"Matemática 0",
	"Conceptos de Algoritmos, Datos y Programas",
	"Organización de Computadoras",
	"Matemática 1",
	"Taller de Programación",
	"Arquitectura de Computadoras",
	"Matemática 2"
]

sistemas_1st_subject_list.each do |sname| 
	Subject.create!(name: sname, year: sistemas_1st)
end

sistemas_2nd_subject_list = [
	"Fundamentos de Organización de Datos",
	"Algoritmos y Estructuras de Datos",
	"Seminario de Lenguajes",
	"Diseño de Base de Datos",
	"Ingeniería de Software 1",
	"Orientación a Objetos 1",
	"Introducción a los Sistemas Operativos",
	"Ingles"
]

sistemas_2nd_subject_list.each do |sname| 
	Subject.create!(name: sname, year: sistemas_2nd)
end

sistemas_3rd_subject_list = [
	"Matemática 3",
	"Ingeniería de Software 2",
	"Orientación de Objetos 2",
	"Conceptos y Paradigmas de Lenguajes de Programación",
	"Redes y Comunicaciones",
	"Proyecto de Software",
	"Programación Concurrente",
	"Bases de Datos 1"
]

sistemas_3rd_subject_list.each do |sname| 
	Subject.create!(name: sname, year: sistemas_3rd)
end

sistemas_4th_subject_list = [
	"Fundamentos de la teoría de la Computación",
	"Sistemas Operativos",
	"Bases de Datos 2",
	"Ingeniería de Software 3",
	"Sistemas y Organizaciones",
	"Matemática 4",
	"Desarrollo de software en Sistemas Distribuidos",
	"Agregar Optativas 1"
]

sistemas_4th_subject_list.each do |sname| 
	Subject.create!(name: sname, year: sistemas_4th)
end

sistemas_5th_subject_list = [
	"Aspectos Sociales y Profesionales de Informática",
	"Agregar Optativa 2",
	"Agregar Optativa 3"
]

sistemas_5th_subject_list.each do |sname| 
	Subject.create!(name: sname, year: sistemas_5th)
end

mp1 = Subject.create!(name: "Materia de prueba primero", year: sistemas_1st)
mp2 = Subject.create!(name: "Materia de prueba segundo", year: sistemas_2nd)
mp3 = Subject.create!(name: "Materia de prueba tercero", year: sistemas_3rd)
mp4 = Subject.create!(name: "Materia de prueba cuarto", year: sistemas_4th)
mp5 = Subject.create!(name: "Materia de prueba quinto", year: sistemas_5th)


# Events seeds
Event.create!(
	name: "evento de primero", 
	start_time: "07:00", 
	end_time: "09:00", 
	recurrent: true, 
	start_date: "2017/07/19", 
	end_date: "2017/07/26", 
	description: "Evento de prueba de primer año. Dura del 19 al 26 de Julio", 
	user: user, 
	subject: mp1)

Event.create!(
	name: "evento de segundo", 
	start_time: "7:00", 
	end_time: "09:00", 
	recurrent: true, 
	start_date: "2017/07/20", 
	end_date: "2017/07/27", 
	description: "Evento de prueba de segundo año. Dura del 20 al 27 de Julio", 
	user: user, 
	subject: mp2)

Event.create!(
	name: "evento de tercero", 
	start_time: "07:00", 
	end_time: "09:00", 
	recurrent: true, 
	start_date: "2017/07/21", 
	end_date: "2017/07/28", 
	description: "Evento de prueba de tercer año. Dura del 21 al 28 de Julio", 
	user: user, 
	subject: mp3)

Event.create!(
	name: "evento de cuarto", 
	start_time: "07:00", 
	end_time: "09:00", 
	recurrent: true, 
	start_date: "2017/07/22", 
	end_date: "2017/07/29", 
	description: "Evento de prueba de cuanto año. Dura del 22 al 29 de Julio", 
	user: user, 
	subject: mp4)

Event.create!(
	name: "evento de quinto", 
	start_time: "07:00", 
	end_time: "09:00", 
	recurrent: false, 
	start_date: "2017/07/23", 
	end_date: "2017/07/23", 
	description: "Evento de prueba de quinto año. Es como un parcial, dura un solo dia.", 
	user: user, 
	subject: mp5)

