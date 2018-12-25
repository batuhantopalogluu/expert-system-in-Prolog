% +----------------------------------------------+
% | BATUHAN TOPALO�LU 151044026 CSE341 HW3 PART1 |
% +----------------------------------------------+
%
%
% �al��t�rma s�ras�nda add method formatlar�na bak�lmak istenirse
% 'formats()' �a�r�labilir.
%
%>>>>>>> conflicts(CourseID1,CourseID2):-
%      Burada kontrol�n do�ru d�nebilmesi i�in arka planda
%     bu iki dersin ders saatlerinde �ak��ma olmuyor olmas�
%     gerekiyor.
%
%     ! Bence �ak��ma i�in sadece zaman �ak��mas� olmas� yeterli,
%     s�n�flar�n ayr� olmas� �ak��ma olmad��� anlam�na gelmez.
%
%>>>>>>> assign(RoomID,CourseID):-
%
%     1- S�n�fta o dersin ders saati kadar bo� bir saat dilimi olup
%       olmad���na bak�l�r.
%
%     2- S�n�f�n ekipmanlar� dersin gereksinimlerini
%       kar��l�yor mu o kontrol edilir.
%
%     3- S�n�f�n ��renci kapasitesi dersin kapasitesine uygun mu diye
%       konrol edilir. O an dersi alan ��renci say�s�na de�il, direk
%       dersin kapasitesine g�re kontrol ettim.
%
%
%>>>>>>> enroll(StudentID,CourseID):-
%
%     1- Dersin al�nd��� s�n�f�n imkanlar� engelli ��rencilere uygun mu
%       diye kontrol edilir.
%
%     2- Dersin ��renci kapasitesi yeni ��renci eklenmeye uygun mu diye
%       kontrol edilir.
%
%
%
%>>>>>>>> add_student(SID,Cours,Hc):-
%
%     1- Daha �nce SID de bir ��renci olup olmad��� kontrol edilir,
%        varsa i�lem false olur.
%
%     2- Kay�t olanmak istenilen derslerin ge�erli birer ders olup
%        olmad��� kontrol edilir.
%
%     3- Kay�t olunmak istenilen derslerin s�n�flar� ��renci i�in uygun
%        ko�ullara sahip mi diye kontrol edilir.
%
%     4- Kay�t olunmak istenilen s�n�fta bo� kontenjan var m� diye
%        kontrol edilir.
%
%     5- Kay�t olunmak istenilen derslerin saatleri birbirleriyle
%     �ak���yor mu diye kontrol edilir.
%
%
%>>>>>>>> add_room(RID,Cap,Eq):-
%
%     1- sadece daha �nce ayn� ID ile bir s�n�f olmamas� yeterli ko�ul.
%
%
%>>>>>>>> add_course(CID,IID,C,HourList,R,E):-
%
%     1- ayn� ID ile daha �nce olu�turulmu� bir kurs var m� diye kontrol
%     edilir.
%
%     2- verilen instructor ID ge�erli bir ID mi diye kontrol edilir.
%
%     3- occupancy tablosunu g�ncellemeyi kullan�c�ya b�rakt�m.
%
% ** >>>>>>>> yeni kurs eklendi�inde occupancy tablosunun g�ncellemesi
% i�ini kullan�c� taraf�na b�rak�yorum ,g�ncelleme yap�lmazsa
% hatal� sonu�lar ortaya ��kabilir. Bu bir eksik say�labilir san�r�m
% ancak bu k�sm� yeti�tiremedim diyebilirim. Di�er b�t�n kontrollerimin
% do�ru �al��t���n� d���n�yorum.
%
%


:-dynamic(room/3).
:-dynamic(instructor/3).
:-dynamic(student/3).
:-dynamic(course/6).
:-dynamic(occupancy/3).

%room(room_ID,Capacity,Equipment)
room(z06,10,[hcapped,projector]).
room(z11,15,[hcapped]).  % 10


%instructor(�nstructor_ID).
instructor(genc,[projector],[cse341]).
instructor(turker,[smartboard],[cse343]).
instructor(bayrakci,[],[cse331]).
instructor(gozupek,[smartboard],[cse321]).

%student(Student_ID,Cours_list,hcapped)
student(1,[cse341,cse343,cse331],no). % sizin verdi�iniz tabloda derslerin kapasitesi g�zetilmeden bir atama yap�lm��.
student(2,[cse341,cse343],no).        % bunlar program ba�larken y�kl� bilgi olarak geldi�i i�in kontrol etmiyorum.
student(3,[cse341,cse331],no).
student(4,[cse341],no).
student(5,[cse343,cse331],no).
student(6,[cse341,cse343,cse331],yes).
student(7,[cse341,cse343],no).
student(8,[cse341,cse331],yes).
student(9,[cse341],no).
student(10,[cse341,cse321],no).
student(11,[cse341,cse321],no).
student(12,[cse343,cse321],no).
student(13,[cse343,cse321],no).
student(14,[cse343,cse321],no).
student(15,[cse343,cse321],yes).



%course(course_ID,�nstructor_ID,Capacity,Hour,Room,Needs)
course(cse341,genc,10,4,z06,[hcapped]).
course(cse343,turker,6,3,z11,[]).
course(cse331,bayrakci,5,3,z06,[]).
course(cse321,gozupek,10,4,z11,[]).

%occupancy(Room_ID,Hour,Cours_ID)
occupancy(z06,8,cse341).
occupancy(z06,9,cse341).
occupancy(z06,10,cse341).
occupancy(z06,11,cse341).
occupancy(z06,12,n).
occupancy(z06,13,cse331).
occupancy(z06,14,cse331).
occupancy(z06,15,cse331).
occupancy(z06,16,n).
occupancy(z11,8,cse343).
occupancy(z11,9,cse343).
occupancy(z11,10,cse343).
occupancy(z11,11,n).
occupancy(z11,12,n).
occupancy(z11,13,cse321).
occupancy(z11,14,cse321).
occupancy(z11,15,cse321).
occupancy(z11,16,cse321).


% �al��t�rma s�ras�nda method formatlar�na bak�lmak istenirse diye
% ekledim.
formats():-
   write('METHOD FORMATS :'),nl,
   write('add_student(Student_ID,[cseXXX,cseXXX,...],handicapped yes/no)'),nl,
   write('add_course(Course_ID,Instruction_ID,Capacity,Hour,Room_ID,Equipment)'),nl,
   write('add_room(Room_ID,Room_Capacity,Room_EquipmentsList)'),nl.


% Check whether there is any scheduling conflict. -->
conflict(CID1,CID2):-
    course_hour(8,CID1,[],C1),  %Kurslar�n ders saatlerinde bir �ak��ma var m� diye kontrol edilir.
    course_hour(8,CID2,[],C2),  %Normal hayatta ders �ak��mas� i�in sadece saatlere bakt���m�z i�in burada s�n�flar� kontrol etmiyorum.
    \+compare_lists(C1,C2).


% Check which room can be assigned to a given class. -->
assign(RoomID,CourseID):-
    course(CourseID,_,CC,CH,_,ELM),
    room(Room,RC,RE),
    RC >= CC,                        % kapasitesi yeterli mi diye kontrol edilir.
    include_lists(ELM,RE),           % ders i�in gerekli ekipmanlar�n s�n�fta olup olmad��� kontrol edilir.
    free_time(8,Room,0,CH),          % s�n�fta ders i�in yeterli bo� saat var m� diye kontrol edilir.
    RoomID  =  Room.


% Check whether a student can be enrolled to a given class. -->
enroll(StudentID,CourseID):-

    student(StudentID,_,H),
    course(CourseID,_,Capacity,_,Roomm,_),
    room(Roomm,_,Req),
    (H == yes, HK = hcapped ,include_lists([HK],Req); H == no),
    course_counterr(CourseID,Res),
    Res < Capacity.



% add_student(SID,[H|T],Hc):- add_student(SID,H,T,Hc).
add_student(SID,Cours,Hc):-
    \+ student(SID,_,_),       % Daha �nce ID de bir ��renci olmamal�.
    check_course(Cours),       % girilen kurslar�n ge�erli birer kurs olup olmad��� kontrol edilir.
    check_conflict(Cours,Res), % al�nmak istenen derslerin saatleri �ak���yor mu diye kontrol edilir.
    Res == 0,
    assertz(student(SID,Cours,Hc)), %uygunluk kontrol edilmeden �nce student objesi olu�turulur ancak uygun ko�ullar� sa�lamazsa silinir ve iz b�rakmaz.
    (check_available(SID,Cours);retract(student(SID,Cours,Hc)),1 == 2).



% bir s�n�f eklemek i�in sadece o s�n�f �d'sinde daha �nce bir s�n�f
% olup olmad���n� kontrol etmek d���nda bir ko�ul akl�ma gelmedi o
% y�zden tek bir ko�ul kontrol� yap�yorum ve yeni s�n�f� olu�turuyorum.
add_room(RID,Cap,Eq):-

    \+ room(RID,_,_),
    assertz(room(RID,Cap,Eq)).


%add_course(Course_ID,Instruction_ID,Capacity,Hour,Room_ID,Equipment)
add_course(CID,IID,C,Hour,R,E):-

    \+ course(CID,_,_,_,_,_),  % course ID daha �nce al�nm�� olmamal�
    instructor(IID,_,_),       %instructor ID ge�erli bir ID olmal�
    assertz(course(CID,IID,C,Hour,R,E)),
    (assign(R,CID);retract(course(CID,IID,C,Hour,R,E))). % Course verilen Room a assign edilebilirse sorun yok
                                                         % olu�turulan obje korunur ancak atamaya uygun de�ilse silinir.



% Burada b�t�n sorumlulu�u kullan�c�ya b�rak�yorum. Kullan�c� occupancy
% tablosu inceleyip bir derse s�n�f atad���nda her ders saati occupancy
% tablosunu g�ncellemesi gerekiyor.
add_occupancy(RID,Hour,CID):-
  retract(occupancy(RID,Hour,_)),
  assertz(occupancy(RID,Hour,CID)).


%++++++++++  Y A R D I M C I   K O � U L  � F A D E L E R � +++++++++++
% Bu methodlar d��ar�dan direk kullan�c�n�n kullanmamas� gereken
% yard�mc� ko�ul ifadeleri


% verilen iki liste aras�nda �ak��an eleman olup olmad���n� kontrol
% etmek i�in kullan�lan bir method.
compare_lists([],_).
compare_lists([H|T],L2):-
    \+member(H,L2),
    compare_lists(T,L2).



%bir ��rencinin kay�t olmak istedi�i dersin ge�erli bir ders olup olmad���n� kontrol ediyor.
check_course([]).
check_course([H|T]):-
    course(H,_,_,_,_,_),
    check_course(T).




% Bu fonksiyon L1 parametresi olarak verilen listenin elemanlar�n�n L2
% listesinde olup olmad���n� kontrol eder. L1 in b�t�n elemanlar� L2 de
% varsa True , di�er durumda false d�ner.
include_lists(L1,L2):-
    length(L1,LL1),
    length(L2,LL2),
    LL1 =< LL2,
    include_backend(L1,L2).

include_backend([],_).
include_backend([H|T],L2):-
    member(H,L2),
    include_backend(T,L2).




% parametre olarak gelen s�n�fta toplam ka� bo� ders saati oldu�unu
% hesaplayan fonksiyon.
free_time(18,_,Count,C):- C =< Count.
free_time(Hour,RID,Count,C):-
    Hour < 18,
    occupancy(RID,Hour,CD1),
    CD1 == n,
    Hour1 is Hour + 1,
    K is Count + 1,
    free_time(Hour1,RID,K,C).

free_time(Hour,RID,Count,C):-
    Hour < 18,
    Hour1 is Hour + 1,
    free_time(Hour1,RID,Count,C).




%hours of courses
% bir dersin i�lendi�i saatleri bize bir liste halinde d�nd�r�r.
% �rn: cse341 i�in [8,9,10,11]
course_hour(18,CID,Count,Count):- course(CID,_,_,X,_,_),length(Count,Len),Len == X.
course_hour(Hour,CD1,Count,C):-
    Hour < 18,
    occupancy(_,Hour,CD1),
    Hour1 is Hour + 1,
    append(Count,[Hour],Res),
    course_hour(Hour1,CD1,Res,C).

course_hour(Hour,CID,Count,C):-
    Hour < 18,
    Hour1 is Hour + 1,
    course_hour(Hour1,CID,Count,C).



% Verilen course ID ye sahip kursa ka� ��rencinin kay�tl� oldu�u
% hesaplay�p d�nd�r�r. Orn: cse341 dersi i�in ba�lang�c durumu i�in
% Res de�eri 10 dur.
course_counterr(CID,Res):- course_counterr(0,CID,[],X), length(X,Res),!.

course_counterr(100,_,Count,Count).

course_counterr(SID,CD1,Count,C):-
    SID < 100,
    student(SID,Courses,_),
    include_lists([CD1],Courses),

    (\+member(SID,Count),append(Count,[SID],Res);member(SID,Count)),
    SID1 is SID + 1,
    course_counterr(SID1,CD1,Res,C).

course_counterr(Hour,CID,Count,C):-
    Hour < 100,
    Hour1 is Hour + 1,
    course_counterr(Hour1,CID,Count,C).




% Parametre olarak gelen course listesindeki derslerin verilen student
% i�in uygun oldu�unu ispatlamak �zerine kurulmu� bir kontrol.
% b�t�n dersler uygunsa True herhangi biri uygun de�ilse false olur.
check_available(_,[]).
check_available(SID,[H|T]):-
    enroll(SID,H),
    check_available(SID,T).




% bir listede verilen dersler aras�nda conflict durumu var m� diye
% kontrol edilen ko�ul
check_conflict(List,Res):-check_conflict(List,0,Res),!.
check_conflict([_|[]],O,O).
check_conflict([H|[HTail|TTail]],O,N):-
   (conflict(H,HTail),K is O + 1;K is O),
   check_conflict([HTail|TTail],K,N).



