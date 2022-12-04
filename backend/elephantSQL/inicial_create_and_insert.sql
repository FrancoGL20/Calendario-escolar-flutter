create table homeworks(
    id serial,
    class_image text,
    name text,
    schedule text,
    classroom text,
    days text
);

insert into
    homeworks (class_image,name,schedule,classroom,days)
values
    (
    'https://verticepublicidad.com/blog/wp-content/uploads/2019/05/Analytics-icon.png',
    'Inteligencia de negocios',
    '11:30am - 1:00pm',
    'SDTUR1',
    'Mier, Vier'
    ),(
    'https://cdn2.iconfinder.com/data/icons/e-learning-17/96/computer_innovation_technology_idea-512.png',
    'Innovación tecnológica',
    '8:30pm - 10:00pm',
    'NA',
    'Sab'
    ),(
    'https://developer.android.com/static/images/blogger.png?hl=es-419',
    'Programación de disp. moviles 1',
    '7:00pm - 8:30pm',
    '6203A',
    'Mar, Mier, Jue'
    ),(
    'https://investigacion.ucsc.cl/wp-content/uploads/sites/125/2022/10/document-icon-300x300.png',
    'Gestión y gobierno',
    '5:30pm - 7:00pm',
    '9208',
    'Mier, Jue'
    ),(
    'https://cdn-icons-png.flaticon.com/512/309/309624.png',
    'Infra. y cómputo en la nube',
    '11:30 - 1:00pm',
    '6203C',
    'Lun, Mar'
    ),(
    'https://www.estudiolimbo.com/wp-content/uploads/2014/07/video-animacion-icon.png',
    'Gráficos y animación',
    '2:30pm - 4:00pm',
    '6203A',
    'Lun, Mier'
    );